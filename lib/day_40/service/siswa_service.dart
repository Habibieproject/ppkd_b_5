import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ppkd_b_5/day_40/models/siswa_models.dart';

class SiswaService {
  static CollectionReference get _siswaCollection =>
      FirebaseFirestore.instance.collection('siswa');

  static Future<void> addSiswa(SiswaModelFirebase data) async {
    final doc = await _siswaCollection.add(data.toMap());
    final String newId = doc.id;
    await _siswaCollection.doc(newId).update({'id': newId});
  }

  static Stream<List<SiswaModelFirebase>> getAllSiswa() {
    return _siswaCollection.snapshots().map(
      (snapshot) => snapshot.docs
          .map(
            (doc) =>
                SiswaModelFirebase.fromDoc(doc.data() as Map<String, dynamic>),
          )
          .toList(),
    );
  }

  static Future<void> updateSiswa(String id, SiswaModelFirebase data) async {
    await _siswaCollection.doc(id).update(data.toMap());
  }

  static Future<void> deleteSiswa(String id) async {
    await _siswaCollection.doc(id).delete();
  }
}
