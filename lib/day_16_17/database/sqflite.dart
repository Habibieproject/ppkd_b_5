import 'package:path/path.dart';
import 'package:ppkd_b_5/day_16_17/models/user_model.dart';
// import 'package:sqflite/sqlite_api.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Future<Database> db() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'my_app.db'),
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE user (id INTEGER PRIMARY KEY AUTOINCREMENT, email TEXT, password TEXT)',
        );
        await db.execute(
          'CREATE TABLE siswa (id INTEGER PRIMARY KEY AUTOINCREMENT, nama TEXT, kelas TEXT)',
        );
      },
      version: 2,
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          await db.execute(
            'CREATE TABLE siswa (id INTEGER PRIMARY KEY AUTOINCREMENT, nama TEXT, kelas TEXT)',
          );
        }
      },
    );
  }

  static Future<void> registerUser(UserModel user) async {
    final dbs = await db();

    await dbs.insert('user', user.toMap());
    print(user.toMap());
  }

  static Future<UserModel?> loginUser({
    required String email,
    required String password,
  }) async {
    final dbs = await db();
    final List<Map<String, dynamic>> results = await dbs.query(
      "user",
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    if (results.isNotEmpty) {
      final data = UserModel.fromMap(results.first);
      print(data.id);
      print(data.email);
      print(data.password);
      print(UserModel.fromMap(results.first));
      return UserModel.fromMap(results.first);
    }
    return null;
  }
}
