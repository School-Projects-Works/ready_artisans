import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:ready_artisans/Components/SmartDialog.dart';
import 'package:ready_artisans/Models/Users/Users.dart';

class FirebaseApi {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final FirebaseStorage _storage = FirebaseStorage.instance;

  static Future<String>getId(String collection)async{
    return _firestore.collection(collection).doc().id;
  }

  static Future<User?> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        CustomDialog.dismiss();
        CustomDialog.showError(message: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        CustomDialog.dismiss();
        CustomDialog.showError(
            message: 'Wrong password provided for that user.');
      }
    }
    return null;
  }

  static Future<User?> signUp(String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        CustomDialog.dismiss();
        CustomDialog.showError(message: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        CustomDialog.dismiss();
        CustomDialog.showError(
            message: 'The account already exists for that email.');
      }
    } catch (e) {
      CustomDialog.dismiss();
      CustomDialog.showError(message: e.toString());
    }
    return null;
  }

  static Future<void> signOut() async {
    await _auth.signOut();
  }

  static Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  static Future<String> uploadProfileImage(String id, File image) async {
    await _storage.ref('profile/$id').putFile(image);
    return await _storage.ref('profile/$id').getDownloadURL();
  }

  static Future<void> saveUser(String id, Map<String, dynamic> data) {
    return _firestore.collection('users').doc(id).set(data);
  }

  static Future<void> updateUser(String id, Map<String, dynamic> data) {
    return _firestore.collection('users').doc(id).update(data);
  }

  static Future<Users?> getUser(String id) {
    var data= _firestore.collection('users').doc(id).get();
    return data.then((value) => Users.fromJson(value.data()!));
  }

  static Future<bool> userExists(String? idCard) {
    return _firestore
        .collection('users')
        .where('id_card', isEqualTo: idCard)
        .get()
        .then((value) => value.docs.isNotEmpty);
  }

  static  getUserStream(String uid) =>
      _firestore.collection('users').doc(uid).snapshots();
}
