import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

class DbHelper {
  static Future<void> insert(String table, Map<String, dynamic> data) async {
    final db = await _getDatabase();
    await db.insert('places', data);
  }

  static Future<List<Map<String, dynamic>>> all(String table) async {
    final db = await _getDatabase();
    return db.query('places');
  }

  static Future<Database> _getDatabase() async {
    final dbPath = await sql.getDatabasesPath();
    final dbLocation = path.join(dbPath, 'places.db');
    return sql.openDatabase(dbLocation, onCreate: (db, version) {
      return db.execute(
          "CREATE TABLE places(id TEXT PRIMARY KEY, title TEXT, image TEXT);");
    }, version: 1);
  }
}
