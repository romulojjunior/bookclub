import 'package:incard/data/local/database/migrations/db_migration.dart';
import 'package:incard/domain/utils/log_utils.dart';
import 'package:sqflite/sqflite.dart';

class MigrationV0004 extends DbMigration {
  final String _name = 'MigrationV0004';

  @override
  up(Database db, int oldVersion, int newVersion) {
    LogUtils.d('$_name up.');
    db.execute('''
      CREATE TABLE IF NOT EXISTS cardsHashtags(
        id INTEGER PRIMARY KEY,
        cardId INTEGER NOT NULL,
        hashtagId INTEGER NOT NULL,
        CONSTRAINT fk_cards
          FOREIGN KEY (cardId)
          REFERENCES cards(id)
          ON DELETE CASCADE,
        CONSTRAINT fk_hashtags
          FOREIGN KEY (hashtagId)
          REFERENCES hashtags(id)
          ON DELETE CASCADE
      )
    ''');
    db.execute('''
      CREATE UNIQUE INDEX IF NOT EXISTS cardsHashtagsIndex on cardsHashtags(
        cardId,
        hashtagId
      )
    ''');
  }

  @override
  down(Database db, int oldVersion, int newVersion) {
    LogUtils.d('$_name down.');
    db.execute('DROP INDEX IF EXISTS cardsHashtagsIndex');
    db.execute('DROP TABLE IF EXISTS cardsHashtags');
  }
}
