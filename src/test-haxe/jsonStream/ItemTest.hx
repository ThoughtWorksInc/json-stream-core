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
import jsonStream.ItemEntities;
import haxe.unit.TestCase;
import jsonStream.JsonSerializer;
import jsonStream.JsonStream;
import jsonStream.JsonDeserializer;
import jsonStream.testUtil.JsonTestCase;
using jsonStream.ItemIo;
import com.dongxiguo.continuation.utils.Generator;
import com.dongxiguo.continuation.Continuation;
using jsonStream.Plugins;

class ItemTest extends JsonTestCase
{
  #if cs

  function testDeserialize()
  {
		var stream = JsonSerializer.serializeRaw(new RawJson(
			{ "items": [
				[ ( { "jsonStream/IT1": { }} :Dynamic), (99:Dynamic) ],
				[ ( { "jsonStream/IT2": { }} :Dynamic), (99:Dynamic) ],
				[ ( { "jsonStream/IT3": { }} :Dynamic), (99:Dynamic) ],
				[ ( { "jsonStream/IT4": { }} :Dynamic), (99:Dynamic) ],
				[ ( { "jsonStream/IT5": { }} :Dynamic), (99:Dynamic) ]
			] }
		));
		var item1: CSharpItems = JsonDeserializer.deserialize(stream);
		var item2: CSharpItems = JsonDeserializer.deserialize(JsonSerializer.serialize(item1));
		var csItemTest = new CSharpItems();
		csItemTest.items.add(new IT1(), 99);
		csItemTest.items.add(new IT2(), 99);
		csItemTest.items.add(new IT3(), 99);
		csItemTest.items.add(new IT4(), 99);
		csItemTest.items.add(new IT5(), 99);
    assertDeepEquals(item1, csItemTest);
    assertDeepEquals(item2, csItemTest);
  }
  #end
}
