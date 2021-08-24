import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> copyDB() async {
  var dbPath = await getDatabasesPath();
  var path = join(dbPath, 'quiz_db.db');

  var exists = await databaseExists(dbPath);
  if (!exists) {
    try {
      await Directory(dirname(dbPath)).create(recursive: true);
    } catch (_) {}
    ByteData data = await rootBundle.load(join('assets/databases/', 'quiz_db.db'));
    List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    await File(path).writeAsBytes(bytes);
  } else {
    print('Database already exists');
  }
  return await openDatabase(path);
}