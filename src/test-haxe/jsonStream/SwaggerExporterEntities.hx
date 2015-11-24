package jsonStream;

/**
 * Blahblah `class OuterClass {}` **bold text**
 **/
import haxe.ds.Vector;
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

  public var v:Vector<Int>;

  @:transient
  public var transient:Int;

  public var childClass:ChildClass;

  public var superClass:SuperClass;

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

class AbstractSuperClass
{
  public var abstractSuperField:String;
}

class SuperClass extends AbstractSuperClass
{
  public function new() {}
  public var superField:String;
}

@:final
class ChildClass extends SuperClass
{

  public var childField:String;

}