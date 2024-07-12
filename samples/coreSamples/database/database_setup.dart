import 'package:incard/data/local/database/migrations/v0002_create_hashtags_table.dart';
import 'package:incard/data/local/database/migrations/v0003_create_cards_table.dart';
import 'package:incard/data/local/database/migrations/v0004_create_cards_hashtags_table.dart';
import 'package:incard/domain/utils/log_utils.dart';
import 'package:sqflite/sqflite.dart';

// How To Use
//   sqflite: ^2.0.3+1
//
// getIt.registerSingletonAsync(() async {
//   String dbDir = await getDatabasesPath();
//   String dbPath = '$dbDir/incard.db';
//   int dbVersion = 4;
//   LogUtils.d(dbPath);
//   final database =
//       openDatabase(dbPath, version: dbVersion, onCreate: onCreate, onUpgrade: onUpgrade, onDowngrade: onDowngrade);
//   database.then((db) => db.rawQuery('PRAGMA foreign_keys = ON;'));
//   return database;
// });

onCreate(Database db, int version) {
  MigrationV0002().up(db, version, version);
  MigrationV0003().up(db, version, version);
  MigrationV0004().up(db, version, version);
  LogUtils.d('Database created!');
}

onUpgrade(Database db, int oldVersion, int newVersion) {
  if (oldVersion <= 2) MigrationV0002().up(db, oldVersion, newVersion);
  if (oldVersion <= 3) MigrationV0003().up(db, oldVersion, newVersion);
  if (oldVersion <= 4) MigrationV0004().up(db, oldVersion, newVersion);
}

onDowngrade(Database db, int oldVersion, int newVersion) {
  if (newVersion <= 2) MigrationV0002().down(db, oldVersion, newVersion);
  if (newVersion <= 3) MigrationV0003().down(db, oldVersion, newVersion);
  if (newVersion <= 4) MigrationV0004().down(db, oldVersion, newVersion);
}
