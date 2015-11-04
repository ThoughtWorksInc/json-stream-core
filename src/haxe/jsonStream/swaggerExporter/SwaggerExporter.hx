package jsonStream.swaggerExporter;

import haxe.macro.Context;
import haxe.macro.Type;

using Lambda;

class SwaggerExporter {

  #if macro
  static function toItemJson(type:Type):Dynamic return {
    switch type {
      case TAbstract(_.get() => { module: "StdTypes", name: "Int" }, []):
        {
          type: "integer"
        }
      case TAbstract(_.get() => { module: "StdTypes", name: "Float" }, []):
        {
          type: "number"
        }
      case TAbstract(_.get() => { module: "StdTypes", name: "Bool" }, []):
        {
          type: "boolean"
        }
      case TInst(_.get() => { module: "String", name: "String" }, []):
        {
          type: "string"
        }
      case TAbstract(_.get() => { module: "haxe.ds.Vector", name: "Vector" }, [ elementType ]):
        {
          type: "array",
          items: toItemJson(elementType)
        }
      case TInst(_.get() => { module: module, name: name, meta: classMeta }, _) if (classMeta.has(":final")):
        var ref = {};
        Reflect.setField(ref, "$ref", '#$module/$name');
        ref;
      default:
        Context.error('Unsupported type: $type', Context.currentPos());
    }
  }
  #end

  macro public static function export(exportingModules:Array<String>, swaggerFileName:String):Void {
    var definitionJsonContent:Dynamic = {};
    for (moduleName in exportingModules) {
      var moduleJson:Dynamic = {};
      var types = haxe.macro.Context.getModule(moduleName);
      for (type in types) {
        switch type {
          case haxe.macro.Type.TInst(t, args):
            var classType = t.get();
            if (exportingModules.has(classType.module)) {
              var properties:Dynamic = {};
              for (field in classType.fields.get()) {
                var jsonFieldName = switch field.meta.extract(":jsonFieldName") {
                  case []:
                    field.name;
                  case [ { params: [ { expr: EConst(CString(jsonFieldName))} ] } ]:
                    jsonFieldName;
                  case metas:
                    Context.error('Expect one string parameter for @:jsonFieldName', metas[0].pos);

                }
                var item = toItemJson(field.type);
                Reflect.setField(properties, jsonFieldName, toItemJson(field.type));
              }
              var schemaJson = {
                type: "object",
                properties: properties
              }
              if (classType.doc != null) {
                Reflect.setField(schemaJson, "description", classType.doc);
              }
              Reflect.setField(moduleJson, classType.name, schemaJson);
            }
          default:
            Context.error('Unsupported type: $type', Context.currentPos());
        }
        Reflect.setField(definitionJsonContent, moduleName, moduleJson);
      }
    }
    // Write the types to swagger JSON file.
    sys.io.File.saveContent(swaggerFileName, haxe.format.JsonPrinter.print(definitionJsonContent, null, "\t"));
  }

}
