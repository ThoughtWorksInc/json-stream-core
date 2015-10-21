package jsonStream;

import jsonStream.JsonDeserializer;
import jsonStream.io.TextParser;
import jsonStream.testUtil.JsonTestCase;

using jsonStream.deserializerPlugin.GeneratedDeserializerPlugin;
using jsonStream.deserializerPlugin.PrimitiveDeserializerPlugins;
using jsonStream.deserializerPlugin.LowPriorityDynamicDeserializerPlugin;
using jsonStream.NoConstructorIo;

class NoConstructorTest extends JsonTestCase
{

  public function testNoConstructor()
  {
    var jsonString = "{ \"InvalidType\" : 1 }";
    try
    {
      var noConstructor:NoConstructor = JsonDeserializer.deserialize(TextParser.parseString(jsonString));
      throw "Expect JsonDeserializerError but nothing is thrown.";
    }
    catch (e:JsonDeserializerError)
    {
      this.assertMatch(NO_DESERIALIZER_FOR_TYPE("InvalidType"), e);
    }

  }

}