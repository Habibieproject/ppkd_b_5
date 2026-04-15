import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class SiswaModelFirebase {
  String? id;
  String? nama;
  String? kelas;
  String? jurusan;
  int? age;
  SiswaModelFirebase({this.id, this.nama, this.kelas, this.jurusan, this.age});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nama': nama,
      'kelas': kelas,
      'jurusan': jurusan,
      'age': age,
    };
  }

  factory SiswaModelFirebase.fromMap(Map<String, dynamic> map) {
    return SiswaModelFirebase(
      id: map['id'] != null ? map['id'] as String : null,
      nama: map['nama'] != null ? map['nama'] as String : null,
      kelas: map['kelas'] != null ? map['kelas'] as String : null,
      jurusan: map['jurusan'] != null ? map['jurusan'] as String : null,
      age: map['age'] != null ? map['age'] as int : null,
    );
  }

  factory SiswaModelFirebase.fromDoc(Map<String, dynamic> doc) {
    return SiswaModelFirebase(
      id: doc['id'] as String?,
      nama: doc['nama'] as String?,
      kelas: doc['kelas'] as String?,
      jurusan: doc['jurusan'] as String?,
      age: doc['age'] as int?,
    );
  }

  // String toJson() => json.encode(toMap());

  factory SiswaModelFirebase.fromJson(String source) =>
      SiswaModelFirebase.fromMap(json.decode(source) as Map<String, dynamic>);
}
