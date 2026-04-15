import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ppkd_b_5/day_39/models/users_models.dart';

class FirebaseService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseFirestore _firebaseFirestore =
      FirebaseFirestore.instance;

  static Future<UserModelsFirebase> registerUser({
    required String email,
    required String password,
    required String username,
  }) async {
    final cred = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final user = cred.user!;
    final model = UserModelsFirebase(
      uid: user.uid,
      email: email,
      password: password,
      username: username,
    );

    await _firebaseFirestore
        .collection('users')
        .doc(user.uid)
        .set(model.toMap());
    return model;
  }

  static Future<UserModelsFirebase?> loginUser({
    required String email,
    required String password,
  }) async {
    final cred = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    final user = cred.user;
    if (user == null) return null;

    final snap = await _firebaseFirestore
        .collection('users')
        .doc(user.uid)
        .get();
    if (!snap.exists) return null;

    return UserModelsFirebase.fromMap({'uid': user.uid, ...snap.data()!});
  }
}
