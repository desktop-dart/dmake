part of dmake.main;

class LinkerFlags {
  /// Library paths
  final List<String> libraryPaths;

  /// Libraries
  final List<String> libraries;

  const LinkerFlags({this.libraryPaths: const [], this.libraries: const []});
}
