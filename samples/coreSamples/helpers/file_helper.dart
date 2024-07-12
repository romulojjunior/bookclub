import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FileHelper {
  late String _localPath;

  FileHelper({required String directoryPath}) {
    _localPath = directoryPath;
  }

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

  static Future<String> getRootDirectory() async {
    if (Platform.isAndroid) {
      final directory = await getExternalStorageDirectory() ??
          await getApplicationDocumentsDirectory();
      return directory.path;
    }
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  static Future<String> getBackupDirectory() async {
    String rootDir = await getRootDirectory();
    return '$rootDir/backups';
  }

  Future<File> getFile(name) async {
    File file = File('$_localPath/$name');

    bool exists = await file.exists();
    if (!exists) {
      await file.create(recursive: true);
    }

    return file;
  }

  delete(String fileName) async {
    File file = await getFile(fileName);
    await file.delete(recursive: true);
  }

  deleteDirectory() async {
    Directory directory = Directory(_localPath);
    bool canDelete = await directory.exists();

    if (canDelete) {
      await directory.delete(recursive: true);
    }
  }
}
