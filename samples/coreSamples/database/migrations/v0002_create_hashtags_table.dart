import 'package:incard/data/local/database/migrations/db_migration.dart';
import 'package:incard/domain/utils/log_utils.dart';
import 'package:sqflite/sqflite.dart';

class MigrationV0002 extends DbMigration {
  final String _name = 'MigrationV0002';

  @override
  up(Database db, int oldVersion, int newVersion) {
    LogUtils.d('$_name up.');
    const sql = '''
      CREATE TABLE IF NOT EXISTS hashtags(
        id INTEGER PRIMARY KEY,
        name TEXT UNIQUE NOT NULL,
        color TEXT NOT NULL,
        language Text DEFAULT 'en' NOT NULL,
        isEnable INT DEFAULT 1 NOT NULL,
        createdAt TEXT NOT NULL,
        updatedAt TEXT
      )
    ''';
    db.execute(sql);
  }

  @override
  down(Database db, int oldVersion, int newVersion) {
    LogUtils.d('$_name down.');
    const sql = 'DROP TABLE IF EXISTS hashtags';
    db.execute(sql);
  }
}
