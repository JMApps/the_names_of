import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class BookContentService {
  static final BookContentService _instance = BookContentService.internal();

  factory BookContentService() => _instance;

  BookContentService.internal();

  static Database? _db;
  static const int dbVersion = 1;
  static const String databaseName = 'names_of.db';

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initializeDatabase();
    return _db!;
  }

  Future<Database> initializeDatabase() async {
    final String databasePath = await getDatabasesPath();
    String path = join(databasePath, databaseName);

    Database database = await openDatabase(path);
    int version = await database.getVersion();

    if (version < dbVersion) {
      await database.close();
      await deleteDatabase(path);

      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (e) {
        throw Exception('Error database $e');
      }

      ByteData data = await rootBundle.load(join('assets/databases', databaseName));
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true);

      database = await openDatabase(path);
      await database.setVersion(dbVersion);
    }

    return database;
  }
}
