import 'package:dmake/dmake.dart';
import 'package:dmake/windows.dart';

main(List<String> arguments) async {
  final commonCFlags =  cflags(includePaths: [
    r"C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\include"
  ], defines: [define('DEBUG')]);

  final target = new Executable(name: 'hello', sources: <Source>[
    new CSource('main.c'),
  ]);

  await build(target);
}
