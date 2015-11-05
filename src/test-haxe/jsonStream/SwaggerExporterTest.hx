package jsonStream;

import jsonStream.testUtil.JsonTestCase;

using jsonStream.SwaggerPlugins;

class SwaggerExporterTest extends JsonTestCase {
  function test():Void {
    var schemaJson = SwaggerExporter.export(["jsonStream.SwaggerExporterEntities"]);
    var moduleSchemaJson = Reflect.field(schemaJson, "jsonStream.SwaggerExporterEntities");

    assertEquals("object", moduleSchemaJson.OuterClass.type);
    assertEquals("#jsonStream.SwaggerExporterEntities/InnerClass", Reflect.field(moduleSchemaJson.OuterClass.properties.innerClass, "$ref"));
    assertEquals("object", moduleSchemaJson.InnerClass.type);
    assertEquals("string", moduleSchemaJson.InnerClass.properties.s.type);
    assertEquals("#jsonStream.SwaggerExporterEntities/InnerClass", Reflect.field(moduleSchemaJson.InnerClass.properties.nestedInner, "$ref"));
    assertEquals("integer", Reflect.field(moduleSchemaJson.InnerClass.properties, "foo-bar").type);
  }
}