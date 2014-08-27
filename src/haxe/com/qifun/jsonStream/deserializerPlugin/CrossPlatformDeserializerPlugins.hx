/*
 * json-stream
 * Copyright 2014 深圳岂凡网络有限公司 (Shenzhen QiFun Network Corp., LTD)
 * 
 * Author: 杨博 (Yang Bo) <pop.atry@gmail.com>, 张修羽 (Zhang Xiuyu) <95850845@qq.com>
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

package com.qifun.jsonStream.deserializerPlugin;


import haxe.ds.Vector;
import haxe.macro.*;
import haxe.macro.Expr;
import com.qifun.jsonStream.JsonStream;
import com.qifun.jsonStream.JsonDeserializer;

@:final
class CrossPlatformRefDeserializerPlugin
{
  @:noUsing
  @:dox(hide)
  public static inline function toNativeStream<Element>(stream:JsonDeserializerPluginStream<com.qifun.jsonStream.crossPlatformTypes.CrossRef<Element>>) return
  {
    #if (java && scala && scala_stm)
      new JsonDeserializerPluginStream<scala.concurrent.stm.Ref<Element>>(stream.underlying);
    #else
      new JsonDeserializerPluginStream<Element>(stream.underlying);
    #end
  }


  @:noDynamicDeserialize
  macro public static function pluginDeserialize<Element>(self:ExprOf<JsonDeserializerPluginStream<com.qifun.jsonStream.crossPlatformTypes.CrossRef<Element>>>):ExprOf<Null<com.qifun.jsonStream.crossPlatformTypes.CrossRef<Element>>> return
  {
    if (Context.defined("java") && Context.defined("scala") && Context.defined("scala_stm"))
    {
      macro
      {
        var nativeStream = com.qifun.jsonStream.deserializerPlugin.CrossPlatformDeserializerPlugins.CrossPlatformRefDeserializerPlugin.toNativeStream($self);
        var nativeResult = com.qifun.jsonStream.deserializerPlugin.StmDeserializerPlugins.StmRefDeserializerPlugin.deserializeForElement(nativeStream, function(substream) return substream.pluginDeserialize());
        new com.qifun.jsonStream.crossPlatformTypes.CrossRef(nativeResult);
      }
    }
    else
    {
      macro
      {
        var nativeStream = com.qifun.jsonStream.deserializerPlugin.CrossPlatformDeserializerPlugins.CrossPlatformRefDeserializerPlugin.toNativeStream($self);
        var nativeResult = nativeStream.pluginDeserialize();
        new com.qifun.jsonStream.crossPlatformTypes.CrossRef(nativeResult);
      }
    }
  }

}


@:final
class CrossPlatformSetDeserializerPlugin
{
  @:noUsing
  @:dox(hide)
  public static inline function toNativeStream<Element>(stream:JsonDeserializerPluginStream<com.qifun.jsonStream.crossPlatformTypes.CrossSet<Element>>) return
  {
    #if (java && scala)
      #if scala_stm
        new JsonDeserializerPluginStream<scala.concurrent.stm.TSet<Element>>(stream.underlying);
      #else
        new JsonDeserializerPluginStream<scala.collection.immutable.Set<Element>>(stream.underlying);
      #end
    #elseif cs
      new JsonDeserializerPluginStream<dotnet.system.collections.generic.HashSet<Element>>(stream.underlying);
    #end
  }

  @:noDynamicDeserialize
  macro public static function pluginDeserialize<Element>(self:ExprOf<JsonDeserializerPluginStream<com.qifun.jsonStream.crossPlatformTypes.CrossSet<Element>>>):ExprOf<Null<com.qifun.jsonStream.crossPlatformTypes.CrossSet<Element>>> return
  {
    if (Context.defined("java") && Context.defined("scala"))
    {
      if (Context.defined("scala_stm"))
      {
        macro
        {
          var nativeStream = com.qifun.jsonStream.deserializerPlugin.CrossPlatformDeserializerPlugins.CrossPlatformSetDeserializerPlugin.toNativeStream($self);
          var nativeResult =
            com.qifun.jsonStream.deserializerPlugin.StmDeserializerPlugins.StmTSetDeserializerPlugin.deserializeForElement(
              nativeStream,
              function(substream) return substream.pluginDeserialize());
          new com.qifun.jsonStream.crossPlatformTypes.CrossSet(nativeResult);
        }
      }
      else
      {
        macro
        {
          var nativeStream = com.qifun.jsonStream.deserializerPlugin.CrossPlatformDeserializerPlugins.CrossPlatformSetDeserializerPlugin.toNativeStream($self);
          var nativeResult =
            com.qifun.jsonStream.deserializerPlugin.ScalaDeserializerPlugins.ScalaSetDeserializerPlugin.deserializeForElement(
              nativeStream,
              function(substream) return substream.pluginDeserialize());
          new com.qifun.jsonStream.crossPlatformTypes.CrossSet(nativeResult);
        }
      }
    }
    else if (Context.defined("cs"))
    {
      macro
      {
        var nativeStream = com.qifun.jsonStream.deserializerPlugin.CrossPlatformDeserializerPlugins.CrossPlatformSetDeserializerPlugin.toNativeStream($self);
        var nativeResult =
          com.qifun.jsonStream.deserializerPlugin.CSharpDeserializerPlugins.CSharpHashSetDeserializerPlugin.deserializeForElement(
            nativeStream,
            function(substream) return substream.pluginDeserialize());
        new com.qifun.jsonStream.crossPlatformTypes.Set(nativeResult);
      }
    }
    else
    {
      Context.error("Unsupported platform", Context.currentPos());
    }
  }

}


@:final
class CrossPlatformMapDeserializerPlugin
{
  @:noUsing
  @:dox(hide)
  public static inline function toNativeStream<Key, Value>(stream:JsonDeserializerPluginStream<com.qifun.jsonStream.crossPlatformTypes.CrossMap<Key, Value>>) return
  {
    #if (java && scala)
      #if scala_stm
        new JsonDeserializerPluginStream<scala.concurrent.stm.TMap<Key, Value>>(stream.underlying);
      #else
        new JsonDeserializerPluginStream<scala.collection.immutable.Map<Key, Value>>(stream.underlying);
      #end
    #elseif cs
      new JsonDeserializerPluginStream<dotnet.system.collections.generic.Dictionary<Key, Value>>(stream.underlying);
    #end
  }

  @:noDynamicDeserialize
  macro public static function pluginDeserialize<Key, Value>(self:ExprOf<JsonDeserializerPluginStream<com.qifun.jsonStream.crossPlatformTypes.CrossMap<Key, Value>>>):ExprOf<Null<com.qifun.jsonStream.crossPlatformTypes.CrossMap<Key, Value>>> return
  {
    if (Context.defined("java") && Context.defined("scala"))
    {
      if (Context.defined("scala_stm"))
      {
        macro
        {
          var nativeStream = com.qifun.jsonStream.deserializerPlugin.CrossPlatformDeserializerPlugins.CrossPlatformMapDeserializerPlugin.toNativeStream($self);
          var nativeResult = com.qifun.jsonStream.deserializerPlugin.StmDeserializerPlugins.StmTMapDeserializerPlugin.deserializeForElement(nativeStream, function(substream) return substream.pluginDeserialize(), function(substream) return substream.pluginDeserialize());
          new com.qifun.jsonStream.crossPlatformTypes.CrossMap(nativeResult);
        }
      }
      else
      {
        macro
        {
          var nativeStream = com.qifun.jsonStream.deserializerPlugin.CrossPlatformDeserializerPlugins.CrossPlatformMapDeserializerPlugin.toNativeStream($self);
          var nativeResult = com.qifun.jsonStream.deserializerPlugin.ScalaDeserializerPlugins.ScalaMapDeserializerPlugin.deserializeForElement(nativeStream, function(substream) return substream.pluginDeserialize(), function(substream) return substream.pluginDeserialize());
          new com.qifun.jsonStream.crossPlatformTypes.CrossMap(nativeResult);
        }
      }
    }
    else if (Context.defined("cs"))
    {
      macro
      {
        var nativeStream = com.qifun.jsonStream.deserializerPlugin.CrossPlatformDeserializerPlugins.CrossPlatformMapDeserializerPlugin.toNativeStream($self);
        var nativeResult = com.qifun.jsonStream.deserializerPlugin.CSharpDeserializerPlugins.CSharpDictionaryDeserializerPlugin.deserializeForElement(nativeStream, function(substream) return substream.pluginDeserialize(), function(substream) return substream.pluginDeserialize());
        new com.qifun.jsonStream.crossPlatformTypes.CrossMap(nativeResult);
      }
    }
    else
    {
      Context.error("Unsupported platform", Context.currentPos());
    }
  }

}


@:final
class CrossPlatformVectorDeserializerPlugin
{
  @:noUsing
  @:dox(hide)
  public static inline function toNativeStream<Element>(stream:JsonDeserializerPluginStream<com.qifun.jsonStream.crossPlatformTypes.CrossVector<Element>>) return
  {
    #if (java && scala && scala_stm)
      new JsonDeserializerPluginStream<scala.concurrent.stm.TArray<Element>>(stream.underlying);
    #else
      new JsonDeserializerPluginStream<haxe.ds.Vector<Element>>(stream.underlying);
    #end
  }

  @:noDynamicDeserialize
  macro public static function pluginDeserialize<Element>(self:ExprOf<JsonDeserializerPluginStream<com.qifun.jsonStream.crossPlatformTypes.CrossVector<Element>>>):ExprOf<Null<com.qifun.jsonStream.crossPlatformTypes.CrossVector<Element>>> return
  {
    if (Context.defined("java") && Context.defined("scala") && Context.defined("scala_stm"))
    {
      macro
      {
        var nativeStream = com.qifun.jsonStream.deserializerPlugin.CrossPlatformDeserializerPlugins.CrossPlatformVectorDeserializerPlugin.toNativeStream($self);
        var nativeResult = com.qifun.jsonStream.deserializerPlugin.StmDeserializerPlugins.StmTArrayDeserializerPlugin.deserializeForElement(nativeStream, function(substream) return substream.pluginDeserialize());
        new com.qifun.jsonStream.crossPlatformTypes.CrossVector(nativeResult);
      }
    }
    else
    {
      macro
      {
        var nativeStream = com.qifun.jsonStream.deserializerPlugin.CrossPlatformDeserializerPlugins.CrossPlatformVectorDeserializerPlugin.toNativeStream($self);
        var nativeResult = com.qifun.jsonStream.deserializerPlugin.PrimitiveDeserializerPlugins.VectorDeserializerPlugin.deserializeForElement(nativeStream, function(substream) return substream.pluginDeserialize());
        new com.qifun.jsonStream.crossPlatformTypes.CrossVector(nativeResult);
      }
    }
  }

}