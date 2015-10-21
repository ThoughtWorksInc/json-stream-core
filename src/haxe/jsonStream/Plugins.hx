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

//TODO scala.immutable.Set/Seq build plugin



@:dox(hide)
typedef CrossPlatformRefSerializerPlugin = jsonStream.serializerPlugin.CrossPlatformSerializerPlugins.CrossPlatformRefSerializerPlugin;

@:dox(hide)
typedef CrossPlatformSetSerializerPlugin = jsonStream.serializerPlugin.CrossPlatformSerializerPlugins.CrossPlatformSetSerializerPlugin;

@:dox(hide)
typedef CrossPlatformVectorSerializerPlugin = jsonStream.serializerPlugin.CrossPlatformSerializerPlugins.CrossPlatformVectorSerializerPlugin;

@:dox(hide)
typedef CrossPlatformMapSerializerPlugin = jsonStream.serializerPlugin.CrossPlatformSerializerPlugins.CrossPlatformMapSerializerPlugin;

#if (java && scala)
@:dox(hide)
typedef ScalaSeqSerializerPlugin = jsonStream.serializerPlugin.ScalaSerializerPlugins.ScalaSeqSerializerPlugin;

@:dox(hide)
typedef ScalaSetSerializerPlugin = jsonStream.serializerPlugin.ScalaSerializerPlugins.ScalaSetSerializerPlugin;

@:dox(hide)
typedef ScalaMapSerializerPlugin = jsonStream.serializerPlugin.ScalaSerializerPlugins.ScalaMapSerializerPlugin;

#end

#if cs

@:dox(hide)
typedef CSharpListSerializerPlugin = jsonStream.serializerPlugin.CSharpSerializerPlugins.CSharpListSerializerPlugin;

@:dox(hide)
typedef CSharpDictionarySerializerPlugin = jsonStream.serializerPlugin.CSharpSerializerPlugins.CSharpDictionarySerializerPlugin;

@:dox(hide)
typedef CSharpHashSetSerializerPlugin = jsonStream.serializerPlugin.CSharpSerializerPlugins.CSharpHashSetSerializerPlugin;
#end

@:dox(hide)
typedef StmTRefSerializerPlugin = jsonStream.serializerPlugin.CrossPlatformSerializerPlugins.StmTRefSerializerPlugin;

@:dox(hide)
typedef StmSetSerializerPlugin = jsonStream.serializerPlugin.CrossPlatformSerializerPlugins.StmSetSerializerPlugin;

@:dox(hide)
typedef StmMapSerializerPlugin = jsonStream.serializerPlugin.CrossPlatformSerializerPlugins.StmMapSerializerPlugin;

@:dox(hide)
typedef StmVectorSerializerPlugin = jsonStream.serializerPlugin.CrossPlatformSerializerPlugins.StmVectorSerializerPlugin;

@:dox(hide)
typedef ImmutableSetSerializerPlugin = jsonStream.serializerPlugin.CrossPlatformSerializerPlugins.ImmutableSetSerializerPlugin;

@:dox(hide)
typedef ImmutableMapSerializerPlugin = jsonStream.serializerPlugin.CrossPlatformSerializerPlugins.ImmutableMapSerializerPlugin;

#if (java && scala)

@:dox(hide)
typedef StmRefSerializerPlugin = jsonStream.serializerPlugin.StmSerializerPlugins.StmRefSerializerPlugin;

@:dox(hide)
typedef StmTSetSerializerPlugin = jsonStream.serializerPlugin.StmSerializerPlugins.StmTSetSerializerPlugin;

@:dox(hide)
typedef StmTMapSerializerPlugin = jsonStream.serializerPlugin.StmSerializerPlugins.StmTMapSerializerPlugin;

@:dox(hide)
typedef StmTArraySerializerPlugin = jsonStream.serializerPlugin.StmSerializerPlugins.StmTArraySerializerPlugin;

#end

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
typedef CrossPlatformRefDeserializerPlugin = jsonStream.deserializerPlugin.CrossPlatformDeserializerPlugins.CrossPlatformRefDeserializerPlugin;

@:dox(hide)
typedef CrossPlatformVectorDeserializerPlugin = jsonStream.deserializerPlugin.CrossPlatformDeserializerPlugins.CrossPlatformVectorDeserializerPlugin;

@:dox(hide)
typedef CrossPlatformMapDeserializerPlugin = jsonStream.deserializerPlugin.CrossPlatformDeserializerPlugins.CrossPlatformMapDeserializerPlugin;

@:dox(hide)
typedef CrossPlatformSetDeserializerPlugin = jsonStream.deserializerPlugin.CrossPlatformDeserializerPlugins.CrossPlatformSetDeserializerPlugin;

@:dox(hide)
typedef StmTRefDeserializerPlugin = jsonStream.deserializerPlugin.CrossPlatformDeserializerPlugins.StmTRefDeserializerPlugin;

@:dox(hide)
typedef StmSetDeserializerPlugin = jsonStream.deserializerPlugin.CrossPlatformDeserializerPlugins.StmSetDeserializerPlugin;

@:dox(hide)
typedef StmMapDeserializerPlugin = jsonStream.deserializerPlugin.CrossPlatformDeserializerPlugins.StmMapDeserializerPlugin;

@:dox(hide)
typedef StmVectorDeserializerPlugin = jsonStream.deserializerPlugin.CrossPlatformDeserializerPlugins.StmVectorDeserializerPlugin;

@:dox(hide)
typedef ImmutableSetDeserializerPlugin = jsonStream.deserializerPlugin.CrossPlatformDeserializerPlugins.ImmutableSetDeserializerPlugin;

@:dox(hide)
typedef ImmutableMapDeserializerPlugin = jsonStream.deserializerPlugin.CrossPlatformDeserializerPlugins.ImmutableMapDeserializerPlugin;


#if (java && scala)
@:dox(hide)
typedef ScalaSeqDeserializerPlugin = jsonStream.deserializerPlugin.ScalaDeserializerPlugins.ScalaSeqDeserializerPlugin;

@:dox(hide)
typedef ScalaSetDeserializerPlugin = jsonStream.deserializerPlugin.ScalaDeserializerPlugins.ScalaSetDeserializerPlugin;

@:dox(hide)
typedef ScalaMapDeserializerPlugin = jsonStream.deserializerPlugin.ScalaDeserializerPlugins.ScalaMapDeserializerPlugin;
#end

#if cs

@:dox(hide)
typedef CSharpListDeserializerPlugin = jsonStream.deserializerPlugin.CSharpDeserializerPlugins.CSharpListDeserializerPlugin;

@:dox(hide)
typedef CSharpDictionaryDeserializerPlugin = jsonStream.deserializerPlugin.CSharpDeserializerPlugins.CSharpDictionaryDeserializerPlugin;

@:dox(hide)
typedef CSharpHashSetDeserializerPlugin = jsonStream.deserializerPlugin.CSharpDeserializerPlugins.CSharpHashSetDeserializerPlugin;

#end

#if (java && scala)

@:dox(hide)
typedef StmRefDeserializerPlugin = jsonStream.deserializerPlugin.StmDeserializerPlugins.StmRefDeserializerPlugin;

@:dox(hide)
typedef StmTSetDeserializerPlugin = jsonStream.deserializerPlugin.StmDeserializerPlugins.StmTSetDeserializerPlugin;

@:dox(hide)
typedef StmTMapDeserializerPlugin = jsonStream.deserializerPlugin.StmDeserializerPlugins.StmTMapDeserializerPlugin;

@:dox(hide)
typedef StmTArrayDeserializerPlugin = jsonStream.deserializerPlugin.StmDeserializerPlugins.StmTArrayDeserializerPlugin;

#end

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

