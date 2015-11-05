package jsonStream.swaggerPlugin;

import haxe.macro.Expr;
import jsonStream.SwaggerExporter.SwaggerPluginTypeHint;

class ArraySwaggerPlugin {

  public static function elementHint<Element>(typeHint:SwaggerPluginTypeHint<Array<Element>>):Element return null;

  macro public static function pluginSchema<Element>(typeHint:ExprOf<SwaggerPluginTypeHint<Array<Element>>>):Expr return {
    macro {
      type: "array",
      items: jsonStream.swaggerPlugin.PrimitiveSwaggerPlugins.ArraySwaggerPlugin.elementHint($typeHint).pluginSchema()
    }
  }

}

class IntSwaggerPlugin {
  public static function pluginSchema(typeHint:SwaggerPluginTypeHint<Int>):Dynamic return {
    type: "integer"
  }
}

class StringSwaggerPlugin {
  public static function pluginSchema(typeHint:SwaggerPluginTypeHint<String>):Dynamic return {
    type: "string"
  }
}