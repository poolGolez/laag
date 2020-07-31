import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DbHelper {
  static Future<void> insert(String table, Map<String, dynamic> data) async {
    final dbPath = await sql.getDatabasesPath();
    final dbLocation = path.join(dbPath, 'places.db');
    final sqlDb = await sql.openDatabase(dbLocation, onCreate: (db, version) {
      return db.execute(
          "CREATE TABLE places(id TEXT PRIMARY KEY, title TEXT, image TEXT);");
    }, version: 1);

    await sqlDb.insert('places', data);
  }
}
