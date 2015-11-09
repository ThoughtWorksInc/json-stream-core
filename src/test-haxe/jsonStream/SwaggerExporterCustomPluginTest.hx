package jsonStream;

import jsonStream.testUtil.JsonTestCase;

using jsonStream.SwaggerPlugins;
using jsonStream.CustomIntSwaggerPlugin;


class SwaggerExporterCustomPluginTest extends JsonTestCase {

  function test():Void {
    var schemaJson = SwaggerExporter.export(["jsonStream.SwaggerExporterEntities"]);
    var moduleSchemaJson = Reflect.field(schemaJson, "jsonStream.SwaggerExporterEntities");

    assertEquals("object", moduleSchemaJson.OuterClass.type);

    assertEquals("#jsonStream.SwaggerExporterEntities/InnerClass", Reflect.field(moduleSchemaJson.OuterClass.properties.innerClass, "$ref"));
    assertEquals("#jsonStream.ItemEntities/IT5", Reflect.field(moduleSchemaJson.OuterClass.properties.other, "$ref"));

    assertDeepEquals({}, moduleSchemaJson.OuterClass.properties.d);
    assertDeepEquals({
      type: "number",
      format: "double"
    }, moduleSchemaJson.OuterClass.properties.f);
    assertDeepEquals({
      type: "number",
      format: "float"
    }, moduleSchemaJson.OuterClass.properties.single);
    assertEquals(null, moduleSchemaJson.OuterClass.properties.transient);



    assertEquals("object", moduleSchemaJson.InnerClass.type);

    assertEquals("#jsonStream.SwaggerExporterEntities/InnerClass", Reflect.field(moduleSchemaJson.InnerClass.properties.nestedInner, "$ref"));

    assertDeepEquals({ type: "string" }, moduleSchemaJson.InnerClass.properties.s);
    assertDeepEquals({
      type: "integer",
      description: "custom description"
    }, Reflect.field(moduleSchemaJson.InnerClass.properties, "foo-bar"));

  }

}