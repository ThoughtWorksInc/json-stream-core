enablePlugins(AllHaxePlugins)

resolvers in ThisBuild += "Typesafe repository releases" at "http://repo.typesafe.com/typesafe/releases/"

val haxelibs = Map(
  "continuation" -> DependencyVersion.SpecificVersion("1.3.2"),
  "microbuilder-HUGS" -> DependencyVersion.SpecificVersion("2.0.1")
)

haxelibDependencies ++= haxelibs

for (c <- AllTargetConfigurations ++ AllTestTargetConfigurations) yield {
  haxeOptions in c ++= haxelibOptions(haxelibs)
}

for (c <- AllTargetConfigurations ++ AllTestTargetConfigurations) yield {
  haxeOptions in c ++= Seq("-dce", "no")
}

for (c <- Seq(CSharp, TestCSharp)) yield {
  haxeOptions in c ++= Seq("-D", "CF", "-D", "WITHOUTUNITY")
}

releaseUseGlobalVersion := false

releaseCrossBuild := false

haxeOptions in CSharp ++= Seq("-D", "dll")

for (c <- AllTestTargetConfigurations) yield {
  haxeOptions in c ++= Seq("-main", "jsonStream.Main")
}

haxeOptions in Compile ++= Seq("--macro", "com.qifun.util.Patcher.noExternalDoc()")

javacOptions in Compile in compile += "-Xlint:-deprecation"

libraryDependencies += "com.qifun" % "haxe-util" % "0.1.0" % HaxeJava classifier "haxe-java"

libraryDependencies += "com.qifun.sbt-haxe" %% "test-interface" % "0.1.0" % Test

doc in Compile <<= doc in Haxe

organization := "com.thoughtworks.microbuilder"

name := "json-stream-core"

homepage := Some(url(s"https://github.com/ThoughtWorksInc/${name.value}"))

startYear := Some(2014)

autoScalaLibrary := false

crossPaths := false

licenses := Seq("Apache" -> url("http://www.apache.org/licenses/LICENSE-2.0.html"))

releasePublishArtifactsAction := PgpKeys.publishSigned.value

import ReleaseTransformations._

scmInfo := Some(ScmInfo(
  url(s"https://github.com/ThoughtWorksInc/${name.value}"),
  s"scm:git:git://github.com/ThoughtWorksInc/${name.value}.git",
  Some(s"scm:git:git@github.com:ThoughtWorksInc/${name.value}.git")))


developers := List(
  Developer(
    "Atry",
    "杨博 (Yang Bo)",
    "pop.atry@gmail.com",
    url("https://github.com/Atry")
  ),
  Developer(
    "zxiy",
    "张修羽 (Zhang Xiuyu)",
    "95850845@qq.com",
    url("https://github.com/zxiy")
  ),
  Developer(
    "chank",
    "方里权 (Fang Liquan)",
    "fangliquan@qq.com",
    url("https://github.com/chank")
  )
)

haxelibContributors := Seq("Atry")

haxelibReleaseNote := "Fix compilation error for Flash target"

haxelibTags ++= Seq(
  "cross", "cpp", "cs", "flash", "java", "javascript", "js", "neko", "php", "python", "nme",
  "marshaller", "serialization", "serializer", "utility",
  "json", "bson"
)

releaseProcess := {
  releaseProcess.value.patch(releaseProcess.value.indexOf(publishArtifacts), Seq[ReleaseStep](releaseStepTask(publish in Haxe)), 0)
}

releaseProcess := {
  releaseProcess.value.patch(releaseProcess.value.indexOf(pushChanges), Seq[ReleaseStep](releaseStepCommand("sonatypeRelease")), 0)
}

releaseProcess -= runClean

releaseProcess -= runTest
