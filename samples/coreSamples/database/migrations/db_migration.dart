import 'package:sqflite/sqflite.dart';

abstract class DbMigration {
  up(Database db, int oldVersion, int newVersion);

  down(Database db, int oldVersion, int newVersion);
}
