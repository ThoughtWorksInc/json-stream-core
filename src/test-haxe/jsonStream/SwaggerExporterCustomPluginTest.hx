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
      type: "array",
      items: {
        type: "integer",
        description: "custom description"
      }
    }, moduleSchemaJson.OuterClass.properties.v);
    assertDeepEquals({
      type: "number",
      format: "double"
    }, moduleSchemaJson.OuterClass.properties.f);
#if (java || cs)
    assertDeepEquals({
      type: "number",
      format: "float"
    }, moduleSchemaJson.OuterClass.properties.single);
#end
    assertEquals(null, moduleSchemaJson.OuterClass.properties.transient);



    assertEquals("object", moduleSchemaJson.InnerClass.type);

    assertEquals("#jsonStream.SwaggerExporterEntities/InnerClass", Reflect.field(moduleSchemaJson.InnerClass.properties.nestedInner, "$ref"));

    assertDeepEquals({ type: "string" }, moduleSchemaJson.InnerClass.properties.s);
    assertDeepEquals({
      type: "integer",
      description: "custom description"
    }, Reflect.field(moduleSchemaJson.InnerClass.properties, "foo-bar"));

    assertDeepEquals({ type: "string" }, moduleSchemaJson.ChildClass.allOf[1].properties.childField);
    assertDeepEquals("object", moduleSchemaJson.ChildClass.allOf[1].type);
    assertDeepEquals("#jsonStream.SwaggerExporterEntities/SuperClass.template", Reflect.field(moduleSchemaJson.ChildClass.allOf[0], "$ref"));
    assertDeepEquals({ type: "string" }, Reflect.field(moduleSchemaJson, "SuperClass.template").allOf[1].properties.superField);
    assertDeepEquals("#jsonStream.SwaggerExporterEntities/AbstractSuperClass.template", Reflect.field(Reflect.field(moduleSchemaJson, "SuperClass.template").allOf[0], "$ref"));
    assertDeepEquals("object", Reflect.field(moduleSchemaJson, "SuperClass.template").allOf[1].type);
    assertDeepEquals("object", Reflect.field(moduleSchemaJson, "AbstractSuperClass.template").type);
    assertDeepEquals({ type: "string" }, Reflect.field(moduleSchemaJson, "AbstractSuperClass.template").properties.abstractSuperField);
  }

}