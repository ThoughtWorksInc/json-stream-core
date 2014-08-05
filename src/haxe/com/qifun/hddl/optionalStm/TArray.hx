package com.qifun.hddl.optionalStm;

import haxe.Int64;

#if java
import scala.reflect.ClassTag;

@:multiType(A)
abstract TArray<A>(scala.concurrent.stm.TArray<A>)
{
  public function new(length:Int);

  @:extern
  @:to
  static inline function toObjectTArray<A:{}>(t:scala.concurrent.stm.TArray<A>, length:Int):scala.concurrent.stm.TArray<A>
  {
    var classTag = ClassTagSingleton.MODULE.AnyRef();
    var dynamicTArray:scala.concurrent.stm.TArray<Dynamic> = scala.concurrent.stm.TArray.TArraySingleton.MODULE.ofDim(length, classTag);
    return cast dynamicTArray;
  }

  @:extern
  @:to
  static inline function toInt64TArray(t:scala.concurrent.stm.TArray<Int64>, length:Int):scala.concurrent.stm.TArray<Int64>
  {
    var classTag = ClassTagSingleton.MODULE.Long();
    var dynamicTArray:scala.concurrent.stm.TArray<Dynamic> = scala.concurrent.stm.TArray.TArraySingleton.MODULE.ofDim(length, classTag);
    return cast dynamicTArray;
  }

  @:extern
  @:to
  static inline function toIntTArray(t:scala.concurrent.stm.TArray<Int>, length:Int):scala.concurrent.stm.TArray<Int>
  {
    var classTag = ClassTagSingleton.MODULE.Int();
    var dynamicTArray:scala.concurrent.stm.TArray<Dynamic> = scala.concurrent.stm.TArray.TArraySingleton.MODULE.ofDim(length, classTag);
    return cast dynamicTArray;
  }

  @:extern
  @:to
  static inline function toBoolTArray(t:scala.concurrent.stm.TArray<Bool>, length:Int):scala.concurrent.stm.TArray<Bool>
  {
    var classTag = ClassTagSingleton.MODULE.Boolean();
    var dynamicTArray:scala.concurrent.stm.TArray<Dynamic> = scala.concurrent.stm.TArray.TArraySingleton.MODULE.ofDim(length, classTag);
    return cast dynamicTArray;
  }

  @:extern
  @:to
  static inline function toFloatTArray(t:scala.concurrent.stm.TArray<Float>, length:Int):scala.concurrent.stm.TArray<Float>
  {
    var classTag = ClassTagSingleton.MODULE.Double();
    var dynamicTArray:scala.concurrent.stm.TArray<Dynamic> = scala.concurrent.stm.TArray.TArraySingleton.MODULE.ofDim(length, classTag);
    return cast dynamicTArray;
  }

  @:extern
  @:to
  static inline function toSingleTArray(t:scala.concurrent.stm.TArray<Single>, length:Int):scala.concurrent.stm.TArray<Single>
  {
    var classTag = ClassTagSingleton.MODULE.Float();
    var dynamicTArray:scala.concurrent.stm.TArray<Dynamic> = scala.concurrent.stm.TArray.TArraySingleton.MODULE.ofDim(length, classTag);
    return cast dynamicTArray;
  }

}

#elseif cs

// Workaround for https://github.com/HaxeFoundation/haxe/issues/3127
typedef TArray<T> = cs.NativeArray<T>;

#else

typedef TArray<T> = haxe.ds.Vector<T>;

#end

