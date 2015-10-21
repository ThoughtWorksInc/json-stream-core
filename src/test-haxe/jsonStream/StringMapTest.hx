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
import haxe.unit.TestCase;
import jsonStream.JsonSerializer;
import jsonStream.JsonStream;
import jsonStream.JsonDeserializer;
import jsonStream.testUtil.JsonTestCase;
import com.dongxiguo.continuation.utils.Generator;
import com.dongxiguo.continuation.Continuation;
import haxe.ds.Vector;

using jsonStream.Plugins;
using jsonStream.StringMapIo;

class StringMapTest extends JsonTestCase
{
 function testStringMap()
  {
		var smTest = new StringMapEntities();
		assertFalse(smTest == null);

		smTest.intData.set("1", 1);
		smTest.intData.set("2", 2);
		smTest.stringData.set("1", "a");
		smTest.stringData.set("2", "b");
		smTest.floatData.set("1", 1.0);
		smTest.floatData.set("1", 2.0);
		
		
		//var vectorData = new Vector<Int>(1);
		//vectorData .set(1,1);
		//smTest.vectorData.set("1", vectorData);
		
		var arrayData = new Array<Int>();
		arrayData .push(1);
		smTest.arrayData.set("1", arrayData);
		
		smTest.nullableIntData.set("null",null);
		smTest.nullableArrayData.set("null",null);

	  
		var stream = JsonSerializer.serialize(smTest);
	  var smTest2:StringMapEntities = JsonDeserializer.deserialize(stream);

	  assertDeepEquals(smTest, smTest2);
  }
}
