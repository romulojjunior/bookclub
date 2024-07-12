import 'package:incard/data/local/database/migrations/db_migration.dart';
import 'package:incard/domain/utils/log_utils.dart';
import 'package:sqflite/sqflite.dart';

class MigrationV0003 extends DbMigration {
  final String _name = 'MigrationV0003';

  @override
  up(Database db, int oldVersion, int newVersion) {
    LogUtils.d('$_name up.');
    const sql = '''
      CREATE TABLE IF NOT EXISTS cards(
        id INTEGER PRIMARY KEY,
        textFront TEXT NOT NULL,
        textBack TEXT NOT NULL,
        language TEXT DEFAULT 'en' NOT NULL,
        isEnable INT DEFAULT 1 NOT NULL,
        countViews INT DEFAULT 0 NOT NULL,
        countErrors INT DEFAULT 0 NOT NULL,
        countHits INT DEFAULT 0 NOT NULL,
        createdAt TEXT NOT NULL,
        updatedAt TEXT
      )
    ''';
    db.execute(sql);
  }

  @override
  down(Database db, int oldVersion, int newVersion) {
    LogUtils.d('$_name down.');
    const sql = 'DROP TABLE IF EXISTS cards';
    db.execute(sql);
  }
}
