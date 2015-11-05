package jsonStream;

import jsonStream.SwaggerExporter.SwaggerPluginTypeHint;

class CustomIntSwaggerPlugin {

  public static function pluginSchema(typeHint:SwaggerPluginTypeHint<Int>):Dynamic return {
    {
      type: "integer",
      desciption: "custom description"
    }
  }

}