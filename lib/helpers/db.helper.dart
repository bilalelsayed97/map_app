import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqlite_api.dart';

class DBhelper {
  static Future<Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(
      path.join(dbPath, 'places.db'),
      onCreate: (db, version) {
        return db.execute(//sql query
            'CREATE TABLE user_places(id TEXT PRIMARY KEY,title TEXT,image TEXT)');
      },
      version: 1,
    );
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DBhelper.database();
    db.insert(table, data, conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DBhelper.database();
    return db.query(table);
  }
}
