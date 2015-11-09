package jsonStream;

import haxe.io.Bytes;

using jsonStream.SwaggerPlugins;
using jsonStream.CustomIntSwaggerPlugin;

class SwaggerExporterMain {
  static function main():Void {
    var schemaJson = SwaggerExporter.export(["jsonStream.SwaggerExporterEntities"]);
    Sys.stdout().write(Bytes.ofString(haxe.format.JsonPrinter.print(schemaJson, null, "\t")));
  }
}