part of dmake.main;

class Define {
  final String macro;

  final String value;

  const Define(this.macro, [this.value]);

  factory Define.parse(final String definition) {
    final int pos = definition.indexOf('=');
    String macro = definition;
    String value;
    if (pos != -1) {
      definition.substring(0, pos);
      value = definition.substring(pos);
    }

    if (macro.length == 0)
      throw new Exception('Macro in a definition cannot be null!');

    return new Define(macro, value);
  }
}

Define define(String macro, [String value]) => new Define(macro, value);

class CFlags {
  /// Include paths
  final List<String> includePaths;

  /// Defines
  final List<Define> defines;

  const CFlags({this.includePaths: const [], this.defines: const []});

  void addI(String path) => includePaths.add(path);

  void define(String macro, [String value]) =>
      defines.add(new Define(macro, value));

  void combine(CFlags flags) {
    includePaths.addAll(flags.includePaths);
    defines.addAll(flags.defines);
  }
}

CFlags cflags(
        {List<String> includePaths: const [],
        List<Define> defines: const []}) =>
    new CFlags(includePaths: includePaths, defines: defines);

abstract class Source implements CFlags {
  String get path;

  /// Include paths
  List<String> get includePaths;
}

class CSource extends CFlags implements Source {
  final String path;

  const CSource(this.path,
      {List<String> includePaths: const [], List<Define> defines: const []})
      : super(includePaths: includePaths, defines: defines);
}

CSource c(String path) => new CSource(path);

class CppSource extends CFlags implements Source {
  final String path;

  const CppSource(this.path,
      {List<String> includePaths: const [], List<Define> defines: const []})
      : super(includePaths: includePaths, defines: defines);
}
