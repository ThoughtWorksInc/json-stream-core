/*
 * json-stream
 * Copyright 2014 深圳岂凡网络有限公司 (Shenzhen QiFun Network Corp., LTD)
 *
 * Author: 杨博 (Yang Bo) <pop.atry@gmail.com>, 张修羽 (Zhang Xiuyu) <zxiuyu@126.com>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package jsonStream;

// Default plugins

#if doc_gen
/**
  定义了所有内置插件的模块。

  `using jsonStream.Plugins;`将启用`builderPlugin`包、`deserializerPlugin`包和`serializerPlugin`包中的所有插件。
**/
@:final
extern class Plugins{}
#end

@:dox(hide)
typedef GeneratedSerializerPlugin = jsonStream.serializerPlugin.GeneratedSerializerPlugin;

// 序列化插件添加在此之后

@:dox(hide)
typedef RawSerializerPlugin = jsonStream.serializerPlugin.RawSerializerPlugin;

@:dox(hide)
typedef Int64SerializerPlugin = jsonStream.serializerPlugin.PrimitiveSerializerPlugins.Int64SerializerPlugin;

@:dox(hide)
typedef UIntSerializerPlugin = jsonStream.serializerPlugin.PrimitiveSerializerPlugins.UIntSerializerPlugin;

@:dox(hide)
typedef IntSerializerPlugin = jsonStream.serializerPlugin.PrimitiveSerializerPlugins.IntSerializerPlugin;

#if (java || cs)
  @:dox(hide)
  typedef SingleSerializerPlugin = jsonStream.serializerPlugin.PrimitiveSerializerPlugins.SingleSerializerPlugin;
#end

@:dox(hide)
typedef FloatSerializerPlugin = jsonStream.serializerPlugin.PrimitiveSerializerPlugins.FloatSerializerPlugin;

@:dox(hide)
typedef BoolSerializerPlugin = jsonStream.serializerPlugin.PrimitiveSerializerPlugins.BoolSerializerPlugin;


@:dox(hide)
typedef BinarySerializerPlugin = jsonStream.serializerPlugin.PrimitiveSerializerPlugins.BinarySerializerPlugin;

@:dox(hide)
typedef StringSerializerPlugin = jsonStream.serializerPlugin.PrimitiveSerializerPlugins.StringSerializerPlugin;

@:dox(hide)
typedef ArraySerializerPlugin = jsonStream.serializerPlugin.PrimitiveSerializerPlugins.ArraySerializerPlugin;

@:dox(hide)
typedef VectorSerializerPlugin = jsonStream.serializerPlugin.PrimitiveSerializerPlugins.VectorSerializerPlugin;

@:dox(hide)
typedef IntMapSerializerPlugin = jsonStream.serializerPlugin.PrimitiveSerializerPlugins.IntMapSerializerPlugin;

@:dox(hide)
typedef StringMapSerializerPlugin = jsonStream.serializerPlugin.PrimitiveSerializerPlugins.StringMapSerializerPlugin;

//序列化插件添加*不能*在此之后，haxe报错

@:dox(hide)
typedef LowPriorityDynamicSerializerPlugin = jsonStream.serializerPlugin.LowPriorityDynamicSerializerPlugin;



@:dox(hide)
typedef GeneratedDeserializerPlugin = jsonStream.deserializerPlugin.GeneratedDeserializerPlugin;

// 反序列化插件添加在此之后

@:dox(hide)
typedef RawDeserializerPlugin = jsonStream.deserializerPlugin.RawDeserializerPlugin;

@:dox(hide)
typedef Int64DeserializerPlugin = jsonStream.deserializerPlugin.PrimitiveDeserializerPlugins.Int64DeserializerPlugin;

@:dox(hide)
typedef UIntDeserializerPlugin = jsonStream.deserializerPlugin.PrimitiveDeserializerPlugins.UIntDeserializerPlugin;

@:dox(hide)
typedef IntDeserializerPlugin = jsonStream.deserializerPlugin.PrimitiveDeserializerPlugins.IntDeserializerPlugin;

#if (java || cs)
  @:dox(hide)
  typedef SingleDeserializerPlugin = jsonStream.deserializerPlugin.PrimitiveDeserializerPlugins.SingleDeserializerPlugin;
#end

@:dox(hide)
typedef FloatDeserializerPlugin = jsonStream.deserializerPlugin.PrimitiveDeserializerPlugins.FloatDeserializerPlugin;

@:dox(hide)
typedef BoolDeserializerPlugin = jsonStream.deserializerPlugin.PrimitiveDeserializerPlugins.BoolDeserializerPlugin;

@:dox(hide)
typedef BinaryDeserializerPlugin = jsonStream.deserializerPlugin.PrimitiveDeserializerPlugins.BinaryDeserializerPlugin;

@:dox(hide)
typedef StringDeserializerPlugin = jsonStream.deserializerPlugin.PrimitiveDeserializerPlugins.StringDeserializerPlugin;

@:dox(hide)
typedef ArrayDeserializerPlugin = jsonStream.deserializerPlugin.PrimitiveDeserializerPlugins.ArrayDeserializerPlugin;

@:dox(hide)
typedef VectorDeserializerPlugin = jsonStream.deserializerPlugin.PrimitiveDeserializerPlugins.VectorDeserializerPlugin;

@:dox(hide)
typedef IntMapDeserializerPlugin = jsonStream.deserializerPlugin.PrimitiveDeserializerPlugins.IntMapDeserializerPlugin;

@:dox(hide)
typedef StringMapDeserializerPlugin = jsonStream.deserializerPlugin.PrimitiveDeserializerPlugins.StringMapDeserializerPlugin;

//反序列化插件添加*不能*在此之后，haxe报错

@:dox(hide)
typedef LowPriorityDynamicDeserializerPlugin = jsonStream.deserializerPlugin.LowPriorityDynamicDeserializerPlugin;


@:dox(hide)
typedef GeneratedBuilderPlugin = jsonStream.builderPlugin.GeneratedBuilderPlugin;

//构建插件添加在此之后

@:dox(hide)
typedef RawBuilderPlugin = jsonStream.builderPlugin.RawBuilderPlugin;

@:dox(hide)
typedef Int64BuilderPlugin = jsonStream.builderPlugin.PrimitiveBuilderPlugins.Int64BuilderPlugin;

@:dox(hide)
typedef UIntBuilderPlugin = jsonStream.builderPlugin.PrimitiveBuilderPlugins.UIntBuilderPlugin;

@:dox(hide)
typedef IntBuilderPlugin = jsonStream.builderPlugin.PrimitiveBuilderPlugins.IntBuilderPlugin;

#if (java || cs)
  @:dox(hide)
  typedef SingleBuilderPlugin = jsonStream.builderPlugin.PrimitiveBuilderPlugins.SingleBuilderPlugin;
#end

@:dox(hide)
typedef FloatBuilderPlugin = jsonStream.builderPlugin.PrimitiveBuilderPlugins.FloatBuilderPlugin;

@:dox(hide)
typedef BoolBuilderPlugin = jsonStream.builderPlugin.PrimitiveBuilderPlugins.BoolBuilderPlugin;

//TODO Binary builder plugin

@:dox(hide)
typedef StringBuilderPlugin = jsonStream.builderPlugin.PrimitiveBuilderPlugins.StringBuilderPlugin;

@:dox(hide)
typedef ArrayBuilderPlugin = jsonStream.builderPlugin.PrimitiveBuilderPlugins.ArrayBuilderPlugin;

@:dox(hide)
typedef VectorBuilderPlugin = jsonStream.builderPlugin.PrimitiveBuilderPlugins.VectorBuilderPlugin;

//构建插件添加*不能*在此之后，haxe报错
@:dox(hide)
typedef LowPriorityDynamicBuilderPlugin = jsonStream.builderPlugin.LowPriorityDynamicBuilderPlugin;

