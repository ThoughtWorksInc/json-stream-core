package jsonStream;
using jsonStream.deserializerPlugin.GeneratedDeserializerPlugin;
using jsonStream.deserializerPlugin.PrimitiveDeserializerPlugins;
using jsonStream.deserializerPlugin.LowPriorityDynamicDeserializerPlugin;

@:build(jsonStream.JsonDeserializer.generateDeserializer(["jsonStream.NoConstructor"]))
class NoConstructorIo
{
}