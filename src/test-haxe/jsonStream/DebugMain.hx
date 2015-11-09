package jsonStream;

import jsonStream.SwaggerExporter.SwaggerPluginTypeHint;
import haxe.ds.Vector;


using jsonStream.swaggerPlugin.GeneratedSwaggerPlugin;
using jsonStream.swaggerPlugin.RawSwaggerPlugin;
using jsonStream.swaggerPlugin.PrimitiveSwaggerPlugins;
using jsonStream.CustomIntSwaggerPlugin;

class DebugMain {

  static function main(arguments: Vector<String>):Void {
    var schemaJson = SwaggerExporter.export(["jsonStream.SwaggerExporterEntities"]);
    trace(schemaJson);
  }

}