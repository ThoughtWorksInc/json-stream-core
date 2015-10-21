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

package jsonStream.serializerPlugin;


import haxe.macro.*;
import haxe.macro.Expr;
import jsonStream.JsonStream;
import jsonStream.JsonSerializer;

@:final
class CrossPlatformRefSerializerPlugin
{
  
  @:noDynamicSerialize
  macro public static function pluginSerialize<Element>(self:ExprOf<JsonSerializerPluginData<jsonStream.crossPlatformTypes.CrossRef<Element>>>):ExprOf<JsonStream> return
  {
    if (Context.defined("java") && Context.defined("scala") && Context.defined("scala_stm"))
    {
      macro jsonStream.serializerPlugin.StmSerializerPlugins.StmRefSerializerPlugin.serializeForElement(new jsonStream.JsonSerializer.JsonSerializerPluginData($self.underlying.underlying), function(substream) return substream.pluginSerialize());
    }
    else
    {
      macro new jsonStream.JsonSerializer.JsonSerializerPluginData($self.underlying.underlying).pluginSerialize();
    }
  }
}

@:final
class StmTRefSerializerPlugin
{
  
  @:noDynamicSerialize
  macro public static function pluginSerialize<Element>(self:ExprOf<JsonSerializerPluginData<jsonStream.crossPlatformTypes.StmRef<Element>>>):ExprOf<JsonStream> return
  {
    if (Context.defined("java") && Context.defined("scala"))
    {
      macro jsonStream.serializerPlugin.StmSerializerPlugins.StmRefSerializerPlugin.serializeForElement(new jsonStream.JsonSerializer.JsonSerializerPluginData($self.underlying.underlying), function(substream) return substream.pluginSerialize());
    }
    else
    {
      macro new jsonStream.JsonSerializer.JsonSerializerPluginData($self.underlying.underlying).pluginSerialize();
    }
  }
}

@:final
class CrossPlatformVectorSerializerPlugin
{

  @:noDynamicSerialize
  macro public static function pluginSerialize<Element>(self:ExprOf<JsonSerializerPluginData<jsonStream.crossPlatformTypes.CrossVector<Element>>>):ExprOf<JsonStream> return
  {
    if (Context.defined("java") && Context.defined("scala") && Context.defined("scala_stm"))
    {
      macro jsonStream.serializerPlugin.StmSerializerPlugins.StmTArraySerializerPlugin.serializeForElement(new jsonStream.JsonSerializer.JsonSerializerPluginData($self.underlying.underlying), function(substream) return substream.pluginSerialize());
    }
    else
    {
      macro jsonStream.serializerPlugin.PrimitiveSerializerPlugins.VectorSerializerPlugin.serializeForElement(new jsonStream.JsonSerializer.JsonSerializerPluginData($self.underlying.underlying), function(substream) return substream.pluginSerialize());
    }
  }
}

@:final
class StmVectorSerializerPlugin
{

  @:noDynamicSerialize
  macro public static function pluginSerialize<Element>(self:ExprOf<JsonSerializerPluginData<jsonStream.crossPlatformTypes.StmVector<Element>>>):ExprOf<JsonStream> return
  {
    if (Context.defined("java") && Context.defined("scala") )
    {
      macro jsonStream.serializerPlugin.StmSerializerPlugins.StmTArraySerializerPlugin.serializeForElement(new jsonStream.JsonSerializer.JsonSerializerPluginData($self.underlying.underlying), function(substream) return substream.pluginSerialize());
    }
    else
    {
      macro jsonStream.serializerPlugin.PrimitiveSerializerPlugins.VectorSerializerPlugin.serializeForElement(new jsonStream.JsonSerializer.JsonSerializerPluginData($self.underlying.underlying), function(substream) return substream.pluginSerialize());
    }
  }
}


@:final
class CrossPlatformSetSerializerPlugin
{

  @:noDynamicSerialize
  macro public static function pluginSerialize<Element>(self:ExprOf<JsonSerializerPluginData<jsonStream.crossPlatformTypes.CrossSet<Element>>>):ExprOf<JsonStream> return
  {
    if (Context.defined("java") && Context.defined("scala"))
    {
      if (Context.defined("scala_stm"))
      {
        macro jsonStream.serializerPlugin.StmSerializerPlugins.StmTSetSerializerPlugin.serializeForElement(new jsonStream.JsonSerializer.JsonSerializerPluginData($self.underlying.underlying), function(substream) return substream.pluginSerialize());
      }
      else
      {
        macro jsonStream.serializerPlugin.ScalaSerializerPlugins.ScalaSetSerializerPlugin.serializeForElement(new jsonStream.JsonSerializer.JsonSerializerPluginData($self.underlying.underlying), function(substream) return substream.pluginSerialize());
      }
    }
    else if (Context.defined("cs"))
    {
      macro jsonStream.serializerPlugin.CSharpSerializerPlugins.CSharpHashSetSerializerPlugin.serializeForElement(new jsonStream.JsonSerializer.JsonSerializerPluginData($self.underlying.underlying), function(substream) return substream.pluginSerialize());
    }
    else
    {
      Context.error("Unsupported platform", Context.currentPos());
    }
  }

}

@:final
class ImmutableSetSerializerPlugin
{

  @:noDynamicSerialize
  macro public static function pluginSerialize<Element>(self:ExprOf<JsonSerializerPluginData<jsonStream.crossPlatformTypes.ImmutableSet<Element>>>):ExprOf<JsonStream> return
  {
    if (Context.defined("java") && Context.defined("scala"))
    {
      macro jsonStream.serializerPlugin.ScalaSerializerPlugins.ScalaSetSerializerPlugin.serializeForElement(new jsonStream.JsonSerializer.JsonSerializerPluginData($self.underlying.underlying), function(substream) return substream.pluginSerialize());
    }
    else if (Context.defined("cs"))
    {
      macro jsonStream.serializerPlugin.CSharpSerializerPlugins.CSharpHashSetSerializerPlugin.serializeForElement(new jsonStream.JsonSerializer.JsonSerializerPluginData($self.underlying.underlying), function(substream) return substream.pluginSerialize());
    }
    else
    {
      Context.error("Unsupported platform", Context.currentPos());
    }
  }

}

@:final
class StmSetSerializerPlugin
{

  @:noDynamicSerialize
  macro public static function pluginSerialize<Element>(self:ExprOf<JsonSerializerPluginData<jsonStream.crossPlatformTypes.StmSet<Element>>>):ExprOf<JsonStream> return
  {
    if (Context.defined("java") && Context.defined("scala"))
    {
      macro jsonStream.serializerPlugin.StmSerializerPlugins.StmTSetSerializerPlugin.serializeForElement(new jsonStream.JsonSerializer.JsonSerializerPluginData($self.underlying.underlying), function(substream) return substream.pluginSerialize());
    }
    else if (Context.defined("cs"))
    {
      macro jsonStream.serializerPlugin.CSharpSerializerPlugins.CSharpHashSetSerializerPlugin.serializeForElement(new jsonStream.JsonSerializer.JsonSerializerPluginData($self.underlying.underlying), function(substream) return substream.pluginSerialize());
    }
    else
    {
      Context.error("Unsupported platform", Context.currentPos());
    }
  }

}

@:final
class CrossPlatformMapSerializerPlugin
{

  @:noDynamicSerialize
  macro public static function pluginSerialize<Key, Value>(self:ExprOf<JsonSerializerPluginData<jsonStream.crossPlatformTypes.CrossMap<Key, Value>>>):ExprOf<JsonStream> return
  {
    if (Context.defined("java") && Context.defined("scala"))
    {
      if (Context.defined("scala_stm"))
      {
        macro jsonStream.serializerPlugin.StmSerializerPlugins.StmTMapSerializerPlugin.serializeForElement(new jsonStream.JsonSerializer.JsonSerializerPluginData($self.underlying.underlying), function(substream) return substream.pluginSerialize(), function(substream) return substream.pluginSerialize());
      }
      else
      {
        macro jsonStream.serializerPlugin.ScalaSerializerPlugins.ScalaMapSerializerPlugin.serializeForElement(new jsonStream.JsonSerializer.JsonSerializerPluginData($self.underlying.underlying), function(substream) return substream.pluginSerialize(), function(substream) return substream.pluginSerialize());
      }
    }
    else if (Context.defined("cs"))
    {
      macro jsonStream.serializerPlugin.CSharpSerializerPlugins.CSharpDictionarySerializerPlugin.serializeForElement(new jsonStream.JsonSerializer.JsonSerializerPluginData($self.underlying.underlying), function(substream) return substream.pluginSerialize(), function(substream) return substream.pluginSerialize());
    }
    else
    {
      throw "";
      Context.error("Unsupported platform", Context.currentPos());
    }
  }

}

@:final
class StmMapSerializerPlugin
{

  @:noDynamicSerialize
  macro public static function pluginSerialize<Key, Value>(self:ExprOf<JsonSerializerPluginData<jsonStream.crossPlatformTypes.StmMap<Key, Value>>>):ExprOf<JsonStream> return
  {
    if (Context.defined("java") && Context.defined("scala"))
    {
      macro jsonStream.serializerPlugin.StmSerializerPlugins.StmTMapSerializerPlugin.serializeForElement(new jsonStream.JsonSerializer.JsonSerializerPluginData($self.underlying.underlying), function(substream) return substream.pluginSerialize(), function(substream) return substream.pluginSerialize());
    }
    else if (Context.defined("cs"))
    {
      macro jsonStream.serializerPlugin.CSharpSerializerPlugins.CSharpDictionarySerializerPlugin.serializeForElement(new jsonStream.JsonSerializer.JsonSerializerPluginData($self.underlying.underlying), function(substream) return substream.pluginSerialize(), function(substream) return substream.pluginSerialize());
    }
    else
    {
      throw "";
      Context.error("Unsupported platform", Context.currentPos());
    }
  }
}

@:final
class ImmutableMapSerializerPlugin
{

  @:noDynamicSerialize
  macro public static function pluginSerialize<Key, Value>(self:ExprOf<JsonSerializerPluginData<jsonStream.crossPlatformTypes.ImmutableMap<Key, Value>>>):ExprOf<JsonStream> return
  {
    if (Context.defined("java") && Context.defined("scala"))
    {
      macro jsonStream.serializerPlugin.ScalaSerializerPlugins.ScalaMapSerializerPlugin.serializeForElement(new jsonStream.JsonSerializer.JsonSerializerPluginData($self.underlying.underlying), function(substream) return substream.pluginSerialize(), function(substream) return substream.pluginSerialize());
    }
    else if (Context.defined("cs"))
    {
      macro jsonStream.serializerPlugin.CSharpSerializerPlugins.CSharpDictionarySerializerPlugin.serializeForElement(new jsonStream.JsonSerializer.JsonSerializerPluginData($self.underlying.underlying), function(substream) return substream.pluginSerialize(), function(substream) return substream.pluginSerialize());
    }
    else
    {
      throw "";
      Context.error("Unsupported platform", Context.currentPos());
    }
  }

}
