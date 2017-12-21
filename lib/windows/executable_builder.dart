library dmake.linux;

import 'dart:io';
import 'dart:async';
import 'package:path/path.dart';

import 'package:dmake/dmake.dart';

Future build(Target target) async {
  if(target is Executable) {
    return new ExecutableBuilder(target).all();
  }
  // TODO
}

class ExecutableBuilder {
  final Executable target;

  ExecutableBuilder(this.target);

  /// Compiles given source files into object files
  Future compile() {
    final String buildDirPath = join(Directory.current.path, 'build');  // TODO compute both parameters
    // TODO
  }

  /// Invokes the linker to link object files
  Future link() {
    // TODO
  }

  Future all() => compile().then((_) => link());
}

class CCompiler {
  final Directory buildDirectory;

  final CSource source;

  CCompiler(this.buildDirectory, this.source);

  Future compile() {

  }
}