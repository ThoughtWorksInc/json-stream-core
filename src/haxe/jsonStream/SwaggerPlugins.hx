package jsonStream;


@:dox(hide)
typedef GeneratedSwaggerPlugin = jsonStream.swaggerPlugin.GeneratedSwaggerPlugin;

@:dox(hide)
typedef RawSwaggerPlugin = jsonStream.swaggerPlugin.RawSwaggerPlugin;

@:dox(hide)
typedef Int64SwaggerPlugin = jsonStream.swaggerPlugin.PrimitiveSwaggerPlugins.Int64SwaggerPlugin;

@:dox(hide)
typedef UIntSwaggerPlugin = jsonStream.swaggerPlugin.PrimitiveSwaggerPlugins.UIntSwaggerPlugin;

@:dox(hide)
typedef IntSwaggerPlugin = jsonStream.swaggerPlugin.PrimitiveSwaggerPlugins.IntSwaggerPlugin;

#if (java || cs)
@:dox(hide)
typedef SingleSwaggerPlugin = jsonStream.swaggerPlugin.PrimitiveSwaggerPlugins.SingleSwaggerPlugin;
#end

@:dox(hide)
typedef FloatSwaggerPlugin = jsonStream.swaggerPlugin.PrimitiveSwaggerPlugins.FloatSwaggerPlugin;

@:dox(hide)
typedef BoolSwaggerPlugin = jsonStream.swaggerPlugin.PrimitiveSwaggerPlugins.BoolSwaggerPlugin;

//TODO Binary builder plugin

@:dox(hide)
typedef StringSwaggerPlugin = jsonStream.swaggerPlugin.PrimitiveSwaggerPlugins.StringSwaggerPlugin;

@:dox(hide)
typedef ArraySwaggerPlugin = jsonStream.swaggerPlugin.PrimitiveSwaggerPlugins.ArraySwaggerPlugin;

@:dox(hide)
typedef VectorSwaggerPlugin = jsonStream.swaggerPlugin.PrimitiveSwaggerPlugins.VectorSwaggerPlugin;

@:dox(hide)
typedef StringMapSwaggerPlugin = jsonStream.swaggerPlugin.PrimitiveSwaggerPlugins.StringMapSwaggerPlugin;

@:dox(hide)
typedef IntMapSwaggerPlugin = jsonStream.swaggerPlugin.PrimitiveSwaggerPlugins.IntMapSwaggerPlugin;
