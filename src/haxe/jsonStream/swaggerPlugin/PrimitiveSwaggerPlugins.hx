package jsonStream.swaggerPlugin;

import haxe.ds.IntMap;
import haxe.ds.StringMap;
import haxe.ds.Vector;
import haxe.Int64;
import haxe.io.Bytes;
import haxe.macro.Expr;
import jsonStream.SwaggerExporter.SwaggerPluginTypeHint;

@:final
class Int64SwaggerPlugin {
  public static function pluginSchema(typeHint:SwaggerPluginTypeHint<Int64>):Dynamic return {
    type: "array",
    items: {
      type: "integer",
      format: "int32"
    },
    minItems: 2,
    maxItems: 2
  }
}

@:final
class UIntSwaggerPlugin {
  public static function pluginSchema(typeHint:SwaggerPluginTypeHint<UInt>):Dynamic return {
    type: "integer",
    format: "int32"
  }
}

@:final
class IntSwaggerPlugin {
  public static function pluginSchema(typeHint:SwaggerPluginTypeHint<Int>):Dynamic return {
    type: "integer",
    format: "int32"
  }
}

#if (java || cs)
@:final
class SingleSwaggerPlugin {
  public static function pluginSchema(typeHint:SwaggerPluginTypeHint<Single>):Dynamic return {
    type: "number",
    format: "float"
  }
}
#end

@:final
class FloatSwaggerPlugin {
  public static function pluginSchema(typeHint:SwaggerPluginTypeHint<Float>):Dynamic return {
    type: "number",
    format: "double"
  }
}

@:final
class BoolSwaggerPlugin {
  public static function pluginSchema(typeHint:SwaggerPluginTypeHint<Bool>):Dynamic return {
    type: "boolean"
  }
}

@:final
class BinarySwaggerPlugin {
  public static function pluginSchema(typeHint:SwaggerPluginTypeHint<Bytes>):Dynamic return {
    type: "string",
    format: "byte"
  }
}


@:final
class StringSwaggerPlugin {
  public static function pluginSchema(typeHint:SwaggerPluginTypeHint<String>):Dynamic return {
    type: "string"
  }
}

@:final
class ArraySwaggerPlugin {

  public static function elementHint<Element>(typeHint:SwaggerPluginTypeHint<Array<Element>>):Element return null;

  macro public static function pluginSchema<Element>(typeHint:ExprOf<SwaggerPluginTypeHint<Array<Element>>>):Expr return {
    macro {
      type: "array",
      items: jsonStream.swaggerPlugin.PrimitiveSwaggerPlugins.ArraySwaggerPlugin.elementHint($typeHint).pluginSchema()
    }
  }

}

@:final
class VectorSwaggerPlugin {

  public static function elementHint<Element>(typeHint:SwaggerPluginTypeHint<Vector<Element>>):Element return null;

  macro public static function pluginSchema<Element>(typeHint:ExprOf<SwaggerPluginTypeHint<Vector<Element>>>):Expr return {
    macro {
      type: "array",
      items: jsonStream.swaggerPlugin.PrimitiveSwaggerPlugins.VectorSwaggerPlugin.elementHint($typeHint).pluginSchema()
    }
  }

}

@:final
class StringMapSwaggerPlugin {

  public static function pluginSchema(typeHint:SwaggerPluginTypeHint<StringMap<Dynamic>>):Dynamic return {
    type: "object"
  }

}

@:final
class IntMapSwaggerPlugin {

  public static function pluginSchema(typeHint:SwaggerPluginTypeHint<IntMap<Dynamic>>):Dynamic return {
    type: "object"
  }

}