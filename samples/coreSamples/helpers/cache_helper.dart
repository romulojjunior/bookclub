import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class CacheHelper {
  Future<String> read(String name) async {
    final file = await getFile(name);
    return await file.readAsString();
  }

  Future write(String name, String content) async {
    final file = await getFile(name);
    await file.writeAsString(content);
  }

  Future<Map> readAsMap(String name) async {
    String content = await read(name);
    return jsonDecode(content);
  }

  Future writeAsMap(String name, dynamic content) async {
    write(name, jsonEncode(content));
  }

  Future<String> get _localPath async {
    final directory = await getTemporaryDirectory();
    return directory.path;
  }

  Future<File> getFile(name) async {
    final path = await _localPath;
    return File('$path/$name');
  }
}
