package jsonStream;

/**
 * Blahblah `class OuterClass {}` **bold text**
 **/
@:final
class OuterClass
{
  public function new() {}

  public var innerClass:InnerClass;

  public var other:ItemEntities.IT5;

  @:transient
  public var xxx:Int;
}


@:final
class InnerClass
{
  public function new() {}

  @:jsonFieldName("foo-bar")
  public var fooBar:Int;

  public var s:String;

  public var nestedInner:InnerClass;

}
