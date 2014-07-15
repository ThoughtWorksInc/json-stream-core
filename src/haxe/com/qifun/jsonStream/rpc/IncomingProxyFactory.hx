package com.qifun.jsonStream.rpc;

import com.dongxiguo.continuation.Continuation;
import com.dongxiguo.continuation.utils.Generator;
import com.qifun.jsonStream.JsonStream;

#if macro
import haxe.macro.*;
import haxe.macro.Expr;
import haxe.macro.Type;
import com.qifun.jsonStream.JsonDeserializer;
import com.qifun.jsonStream.JsonSerializer;
using Lambda;
#end

class IncomingProxyFactory
{

  #if macro

  static function processName(sb:StringBuf, s:String):Void
  {
    var i = 0;
    while (i != -1)
    {
      var prev = i;
      i = s.indexOf("_", prev);
      if (i != -1)
      {
        sb.addSub(s, prev, i - prev);
        sb.add("__");
      }
      else
      {
        sb.addSub(s, prev);
        break;
      }
    }
  }

  static function proxyMethodName(pack:Array<String>, name:String):String
  {
    var sb = new StringBuf();
    sb.add("incomingProxy_");
    for (p in pack)
    {
      processName(sb, p);
      sb.add("_");
    }
    processName(sb, name);
    return sb.toString();
  }


  private static function withDefaultTypeParameters(
    body:Expr,
    typeParameters:Array<TypeParameter>):Expr return
  {
    if (typeParameters.empty())
    {
      return body;
    }
    else
    {
      var declear = {
        pos: body.pos,
        expr: EFunction(
          "inline_withDefaultTypeParameters",
          {
            params:
            [
              for (typeParameter in typeParameters)
              {
                name: typeParameter.name,
                // TODO: constraits
              }
            ],
            args: [],
            ret: null,
            expr: macro $body,
          }),
      }
      macro
      {
        $declear;
        withDefaultTypeParameters();
      }
    }
  }

  private static function buildSwitchExprForService(
    serviceClassType:ClassType,
    serviceParameters,
    rpcMethodName: ExprOf<String>,
    parameters:ExprOf<JsonStream>):Expr
  {
    var cases:Array<Case> = [];
    for (field in serviceClassType.fields.get())
    {
      switch (field)
      {
        case { kind: FVar(_) | FMethod(MethMacro) }: continue;
        case { kind: FMethod(methodKind), type: TFun(args, futureType) }:
        {
          var methodName = field.name;
          var numRequestArguments = args.length;
          var responseType = TypeTools.applyTypeParameters(
            Future.FutureTypeResolver.getAwaitResultTypes(futureType),
            serviceClassType.params,
            serviceParameters);
          var complexResponseType = TypeTools.toComplexType(responseType);
          var declareResponseHandler =
          {
            pos: Context.currentPos(),
            expr: EFunction(
              null,
              {
                args:
                [
                  {
                    name: "response",
                    type: null,
                  }
                ],
                ret: null,
                expr: macro responseHandler.onSuccess(
                  new com.qifun.jsonStream.JsonSerializer.JsonSerializerPluginData<$complexResponseType>(
                    response).pluginSerialize()),
              }),
          }
          function parseRestRequest(readArray:Expr, argumentIndex:Int):Expr return
          {
            if (argumentIndex < numRequestArguments)
            {
              var requestType = TypeTools.applyTypeParameters(
                args[argumentIndex].t,
                serviceClassType.params,
                serviceParameters);
              var complexRequestType = TypeTools.toComplexType(requestType);
              var requestName = "request" + argumentIndex;
              var next = parseRestRequest(readArray, argumentIndex + 1);
              macro com.qifun.jsonStream.rpc.IncomingProxyFactory.IncomingProxyRuntime.optimizedExtract1(
                $readArray,
                  function(elementStream):Void
                  {
                    var $requestName:$complexRequestType = new com.qifun.jsonStream.JsonDeserializer.JsonDeserializerPluginStream<$complexRequestType>(elementStream).pluginDeserialize();
                    $next;
                  });
            }
            else
            {
              var parameters =
              [
                for (i in 0...numRequestArguments)
                {
                  var requestName = "request" + i;
                  macro $i{requestName};
                }
              ];
              macro
              {
                com.qifun.jsonStream.rpc.Future.FutureHelper.start(
                  serviceImplementation.$methodName($a{parameters}),
                  $declareResponseHandler,
                  function(errorResponse:Dynamic):Void
                  {
                    responseHandler.onFailure(com.qifun.jsonStream.JsonSerializer.serialize(errorResponse));
                  });
              }
            }
          }
          var parseRequestExpr =
            withDefaultTypeParameters(
              parseRestRequest(macro readRequest, 0),
              field.params);
          cases.push(
            {
              values: [ macro $v{methodName} ],
              expr: macro switch($parameters)
              {
                case com.qifun.jsonStream.JsonStream.ARRAY(readRequest):
                {
                  $parseRequestExpr;
                }
                case _:
                {
                  throw com.qifun.jsonStream.JsonDeserializer.JsonDeserializerError.UNMATCHED_JSON_TYPE(request, [ "ARRAY" ]);
                }
              }
            });
        }
        case _: throw "Expect method!";
      }
    }
    return
    {
      expr: ESwitch(rpcMethodName, cases, null),
      pos: Context.currentPos(),
    };
  }

  static function incomingProxyField(serviceClassType:ClassType):Field return
  {
    var typeParameters =
    [
      for (p in serviceClassType.params)
      {
        TPType(TPath({ pack: [], name: p.name }));
      }
    ];
    var typeParameterDeclarations:Array<TypeParamDecl> =
    [
      for (p in serviceClassType.params)
      {
        name: p.name,
        // TODO: Constraits
      }
    ];
    var serviceModule = serviceClassType.module;
    var methodBody = if (Context.defined("doc_gen"))
    {
      macro return ((throw "For documentation generation only!"):com.qifun.jsonStream.rpc.IJsonMethod);
    }
    else
    {
      var parameterTypes = [ for (p in serviceClassType.params) p.t ];
      var switchRpcMethodName =
        buildSwitchExprForService(serviceClassType, parameterTypes, macro rpcMethodName, macro parameters);
      macro return new com.qifun.jsonStream.rpc.IncomingProxy(
        function (
          request:com.qifun.jsonStream.JsonStream,
          responseHandler:com.qifun.jsonStream.rpc.IJsonMethod.IJsonResponseHandler):Void
        {
          switch (request)
          {
            case com.qifun.jsonStream.JsonStream.OBJECT(pairs):
            {
              com.qifun.jsonStream.rpc.IncomingProxyFactory.IncomingProxyRuntime.optimizedExtract1(
                pairs,
                function(pair):Void
                {
                  var rpcMethodName = pair.key;
                  var parameters = pair.value;
                  $switchRpcMethodName;
                });
            }
            case _:
            {
              com.qifun.jsonStream.JsonDeserializer.JsonDeserializerError.UNMATCHED_JSON_TYPE(
                request,
                [ "OBJECT" ]);
            }
          }
        });
    }

    {
      name: proxyMethodName(serviceClassType.pack, serviceClassType.name),
      access: [ AStatic, APublic ],
      pos: Context.currentPos(),
      kind: FFun(
        {
          params: typeParameterDeclarations,
          args:
          [
            {
              name: "serviceImplementation",
              type: TPath(
                {
                  pack: serviceClassType.pack,
                  name: serviceModule.substring(serviceModule.lastIndexOf(".") + 1),
                  sub: serviceClassType.name,
                  params: typeParameters,
                }),
            }
          ],
          ret: null,
          expr: methodBody,
        }),
    }
  }

  #end


  @:noUsing
  macro public static function generateIncomingProxyFactory(includeModules:Array<String>):Array<Field> return
  {
    var fields = Context.getBuildFields();
    for (moduleName in includeModules)
    {
      for (rootType in Context.getModule(moduleName))
      {
        switch (rootType)
        {
          case TInst(_.get() => classType, args) if (classType.isInterface):
          {
            fields.push(incomingProxyField(classType));
          }
          default:
        }
      }
    }
    fields;
  }
}

@:dox(hide)
class IncomingProxyRuntime
{

  @:extern
  @:noUsing
  private static inline function extract1<Element, Result>(iterator:Iterator<Element>, handler:Element->Result):Result return
  {
    if (iterator.hasNext())
    {
      var element = iterator.next();
      if (iterator.hasNext())
      {
        throw JsonDeserializer.JsonDeserializerError.TOO_MANY_FIELDS(iterator, 1);
      }
      else
      {
        handler(element);
      }
    }
    else
    {
      throw JsonDeserializer.JsonDeserializerError.NOT_ENOUGH_FIELDS(iterator, 1, 0);
    }
  }

  @:extern
  @:noUsing
  public static inline function optimizedExtract1<Element, Result>(iterator:Iterator<Element>, handler:Element->Result):Result return
  {
    var generator = Std.instance(iterator, (Generator:Class<Generator<Element>>));
    if (generator == null)
    {
      extract1(iterator, handler);
    }
    else
    {
      extract1(generator, handler);
    }
  }

}
