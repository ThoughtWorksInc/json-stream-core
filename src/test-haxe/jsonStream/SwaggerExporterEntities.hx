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

  public var d:Dynamic;

  public var f:Float;

#if (java || cs)
  public var single:Single;
#end

  @:transient
  public var transient:Int;
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
