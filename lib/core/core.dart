library dmake.main;

import 'dart:io';

part 'source.dart';
part 'linker.dart';

abstract class Target {
  CFlags get cflags;

  LinkerFlags get linkerFlags;
}

class Executable implements Target {
  /// Name of the target executable
  final String name;

  final List<Source> sources;

  final CFlags cflags;

  final LinkerFlags linkerFlags;

  const Executable(
      {this.name,
      this.sources: const [],
      this.cflags: const CFlags(),
      this.linkerFlags: const LinkerFlags()});
}

/* TODO
class SharedLibraryBuilder implements Target {
  // TODO
}

class StaticLibraryBuilder implements Target {
  // TODO
}
*/
