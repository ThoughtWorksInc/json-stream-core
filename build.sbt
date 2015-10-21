enablePlugins(HaxeJavaPlugin)

enablePlugins(HaxeCSharpPlugin)

enablePlugins(HaxeCppPlugin)

enablePlugins(HaxeFlashPlugin)

enablePlugins(HaxeAs3Plugin)

enablePlugins(HaxePythonPlugin)

enablePlugins(HaxeNekoPlugin)

enablePlugins(HaxePhpPlugin)

enablePlugins(HaxeJsPlugin)

resolvers in ThisBuild += "Typesafe repository releases" at "http://repo.typesafe.com/typesafe/releases/"

for (c <- Seq(Compile, Test)) yield {
  haxeOptions in c ++=
    Seq("-D", "scala")
}

val haxelibs = Map(
  "continuation" -> DependencyVersion.SpecificVersion("1.3.2"),
  "microbuilder-HUGS" -> DependencyVersion.SpecificVersion("2.0.0")
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

releaseCrossBuild := true

haxeOptions in CSharp ++= Seq("-D", "dll")

for (c <- AllTestTargetConfigurations) yield {
  haxeOptions in c ++= Seq("-main", "com.qifun.jsonStream.Main")
}

haxeOptions in Compile ++= Seq("--macro", "com.qifun.util.Patcher.noExternalDoc()")

javacOptions in Compile in compile += "-Xlint:-deprecation"

libraryDependencies += "org.scala-stm" %% "scala-stm" % "0.7"

libraryDependencies += "com.qifun" % "haxe-util" % "0.1.0" % HaxeJava classifier "haxe-java"

libraryDependencies += "com.qifun" %% "haxe-scala-library" % "0.2.1" % HaxeJava classifier "haxe-java"

libraryDependencies += "com.qifun.sbt-haxe" %% "test-interface" % "0.1.0" % Test

libraryDependencies += "com.qifun" %% "haxe-scala-stm" % "0.1.4" % HaxeJava classifier "haxe-java"

libraryDependencies += "org.reactivemongo" %% "reactivemongo-bson" % "0.11.6"

crossScalaVersions := Seq("2.10.4", "2.11.2")

doc in Compile := {
  (doc in Compile).result.value.toEither match {
    case Left(_) => {
      // Ignore error
      (target in doc in Compile).value
    }
    case Right(right) => {
      right
    }
  }
}

organization := "com.qifun"

name := "json-stream"

homepage := Some(url(s"https://github.com/qifun/${name.value}"))

startYear := Some(2014)

licenses := Seq("Apache" -> url("http://www.apache.org/licenses/LICENSE-2.0.html"))

publishTo <<= (isSnapshot) { isSnapshot: Boolean =>
  if (isSnapshot)
    Some("snapshots" at "https://oss.sonatype.org/content/repositories/snapshots")
  else
    Some("releases" at "https://oss.sonatype.org/service/local/staging/deploy/maven2")
}

releasePublishArtifactsAction := PgpKeys.publishSigned.value

import ReleaseTransformations._

releaseProcess := Seq[ReleaseStep](
  checkSnapshotDependencies,
  inquireVersions,
  runClean,
  runTest,
  setReleaseVersion,
  commitReleaseVersion,
  tagRelease,
  releaseStepTask(publish in Haxe),
  publishArtifacts,
  setNextVersion,
  commitNextVersion,
  releaseStepCommand("sonatypeRelease"),
  pushChanges
)

scmInfo := Some(ScmInfo(
  url(s"https://github.com/qifun/${name.value}"),
  s"scm:git:git://github.com/qifun/${name.value}.git",
  Some(s"scm:git:git@github.com:qifun/${name.value}.git")))

pomExtra :=
  <developers>
    <developer>
      <id>Atry</id>
      <name>杨博 (Yang Bo)</name>
      <timezone>+8</timezone>
      <email>pop.atry@gmail.com</email>
    </developer>
    <developer>
      <id>zxiy</id>
      <name>张修羽 (Zhang Xiuyu)</name>
      <timezone>+8</timezone>
      <email>95850845@qq.com</email>
    </developer>
    <developer>
      <id>chank</id>
      <name>方里权 (Fang Liquan)</name>
      <timezone>+8</timezone>
      <email>fangliquan@qq.com</email>
    </developer>
  </developers>

haxelibContributors := Seq("Atry")

haxelibReleaseNote := "Initial release to haxelib"

haxelibTags ++= Seq(
  "cross", "cpp", "cs", "flash", "java", "javascript", "js", "neko", "php", "python", "nme",
  "marshaller", "serialization", "serializer", "utility",
  "json", "bson"
)