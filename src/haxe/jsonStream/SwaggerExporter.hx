package jsonStream;

import haxe.ds.StringMap;

#if macro
import jsonStream.GeneratorUtilities.*;
import haxe.macro.TypeTools;
import haxe.macro.Expr;
import haxe.macro.Context;
import haxe.macro.Type;
#end

using Lambda;

#if macro
class SwaggerExporterGenerator {

  static var allGenerators:Array<SwaggerExporterGenerator> = [];

  public function new() {
    allGenerators.push(this);
  }

  public function export():Expr return {

    var addModules = [
      for (moduleName in allSchemas.keys()) {
        var moduleMap = allSchemas.get(moduleName);
        var addSchemaExprs = [
          for (className in moduleMap.keys()) {
            var schemaExpr = moduleMap.get(className);
            macro Reflect.setField(__moduleJson, $v{className}, $schemaExpr);
          }
        ];
        macro {
          var __moduleJson:Dynamic = {}
          {$a{addSchemaExprs}}
          Reflect.setField(__allSchemas, $v{moduleName}, __moduleJson);
        }
      }
    ];

    var allSchemas = macro {
      var __allSchemas:Dynamic = {};
      {$a{addModules}}
      __allSchemas;
    }

    var removed = allGenerators.pop();
    if (removed != this)
    {
      throw "Illegal internal state!";
    }

    allSchemas;

  }

  var allSchemas = new StringMap<StringMap<Expr>>();

  private static function getContextGenerator():SwaggerExporterGenerator return
  {
    allGenerators[allGenerators.length - 1];
  }

  public function tryAddSchema(type:Type):Void return {
    switch type {
      case TInst(_.get() => classType, _) if (!isAbstract(classType)):
        insert(classType.module, classType.name, function() return classSchema(classType));
      default:
// TODO:
    }
  }

  public static function generatedSchema(type:Type):Expr return {
    var followedType = Context.follow(type);
    switch followedType {
      case TInst(_.get() => classType, _) if (!isAbstract(classType)):
        if (classType.meta.has(":final")) {
          var contextGenerator = getContextGenerator();
          contextGenerator.insert(classType.module, classType.name, function() return contextGenerator.classSchema(classType));
          var refUri = '#${classType.module}/${classType.name}';
          macro {
            var __ref:Dynamic = {}
            // Workaround to avoid inline for neko target
            (Reflect.setField)(__ref, "$ref", $v{refUri});
            __ref;
          }
        } else {
          throw "Not implemented";
        }
      case TEnum(_.get() => enumType, _):
        throw "Not implemented";
      case TAbstract(_.get() => abstractType, _):
        throw "Not implemented";
      default:
        macro {}
    }
  }

  function insert(moduleName:String, className:String, schemaBuilder:Void->Expr):Void {
    var moduleMap = allSchemas.get(moduleName);
    if (moduleMap == null) {
      moduleMap = new StringMap<Expr>();
      allSchemas.set(moduleName, moduleMap);
    }
    if (!moduleMap.exists(className)) {
      moduleMap.set(className, macro throw "Building schema...");
      moduleMap.set(className, schemaBuilder());
    }
  }

  function classSchema(classType:ClassType):Expr return {
    var propertiesExprs = [];
    for (field in classType.fields.get()) {
      switch field {
        case
        {
          name: "unknownFieldMap",
          kind: FVar(AccNormal | AccNo | AccCall, _),
          type: Context.follow(_) => TAbstract(_.get() => { module: "jsonStream.unknown.UnknownFieldMap", name: "UnknownFieldMap" }, []),
        }:
          continue;
        case { kind: FVar(AccNormal | AccNo, AccNormal | AccNo), meta: meta } if (!meta.has(":transient")):
          var fieldName = field.name;
          var jsonFieldName = GeneratorUtilities.jsonFieldName(field);
          var fieldComplexType = TypeTools.toComplexType(field.type);

          var schemaExpr = Context.getTypedExpr(Context.typeExpr(macro {
            var __typeHint:jsonStream.SwaggerExporter.SwaggerPluginTypeHint<$fieldComplexType> = null;
            __typeHint.pluginSchema();
          }));
          propertiesExprs.push(macro Reflect.setField(__objectProperties, $v{jsonFieldName}, $schemaExpr));
        default:
          continue;
      }
    }
    macro {
      var __objectProperties:Dynamic = {};
      {$a{propertiesExprs}}
      {
        type: "object",
        properties: __objectProperties
      }
    }
  }
}
#end

/**
 * 插件是否使用类型系统来选择？
 * 为了一致性，应该使用类型系统。
 *
 * 启用插件的配置是否使用using？
 * 为了一致性，应该使用using
 *
 * 是否需要首先生成包含具体导出函数的exporter？
 * 需要，因为调用export处必须和using在一起
 **/
class SwaggerExporter {

  #if macro
  #end

  macro public static function export(exportingModules:Array<String>):Expr return {
    var generator = new SwaggerExporterGenerator();
// For each type in each module in exportingModules, create Expr of the schame JSON and insert it into allSchemas
    for (moduleName in exportingModules) {
      var types = haxe.macro.Context.getModule(moduleName);
      for (type in types) {
        generator.tryAddSchema(type);
      }
    }

    var allSchemaExpr = generator.export();
    //trace(ExprTools.toString(allSchemaExpr));
    allSchemaExpr;
  }
}

abstract SwaggerPluginTypeHint<T>(Dynamic) {}
