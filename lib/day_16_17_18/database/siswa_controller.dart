import 'package:ppkd_b_5/day_16_17_18/database/sqflite.dart';
import 'package:ppkd_b_5/day_16_17_18/models/siswa_model.dart';

class SiswaController {
  static Future<void> registerSiswa(SiswaModel siswa) async {
    final dbs = await DBHelper.db();
    await dbs.insert('siswa', siswa.toMap());
    print(siswa.toMap());
  }

  static Future<List<SiswaModel>> getAllSiswa() async {
    final dbs = await DBHelper.db();
    final List<Map<String, dynamic>> results = await dbs.query("siswa");
    print(results.map((e) => SiswaModel.fromMap(e)).toList());
    return results.map((e) => SiswaModel.fromMap(e)).toList();
  }

  static Future<int> updateSiswa(SiswaModel siswa) async {
    final dbs = await DBHelper.db();
    if (siswa.id == null) {
      throw Exception("ID Wajid ada");
    }
    return dbs.update(
      'siswa',
      siswa.toMap(),
      where: 'id = ?',
      whereArgs: [siswa.id],
    );
  }

  static Future<int> deleteSiswa(int id) async {
    final dbs = await DBHelper.db();
    return dbs.delete('siswa', where: 'id = ?', whereArgs: [id]);
  }
}

/*FLow kerja
1. Buat DBHelper (Database, Table)
2. Membuat Model
3. Membuat function CRUD
4. Terapkan di UI
*/
