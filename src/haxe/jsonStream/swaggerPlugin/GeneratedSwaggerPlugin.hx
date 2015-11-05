package jsonStream.swaggerPlugin;

import jsonStream.JsonSerializer.JsonSerializerGenerator;
import haxe.macro.Context;
import haxe.macro.Expr;
import jsonStream.SwaggerExporter;
class GeneratedSwaggerPlugin {
  macro public static function pluginSchema(typeHint:ExprOf<SwaggerPluginTypeHint<Dynamic>>):Expr return {
    switch (Context.follow(Context.typeof(typeHint)))
    {
      case TAbstract(_, [ expectedType ]):
        SwaggerExporterGenerator.generatedSchema(expectedType);
      case _:
        throw "Expected JsonSerializerPluginData";
    }

  }
}
