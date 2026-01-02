
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../features/authentication/models/user_model.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import '../authentication/auth_repo.dart';


/// Repository class for user-related operations.
class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;



  /// Function to save user data to Firestore.
  Future<void> saveUserRecord(UserModel user) async {
    try {
      print("Saving User: ${user.toJson()}");
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw UNFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const UNFormatException();
    } on PlatformException catch (e) {
      throw UNPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Function to fetch User Details based on userID
  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot = await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).get();
      if(documentSnapshot.exists){
        return UserModel.fromSnapshot(documentSnapshot);
      }else{
        return UserModel.empty();
      }
    } on FirebaseException catch (e) {
      throw UNFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const UNFormatException();
    } on PlatformException catch (e) {
      throw UNPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Function to update User data in Firestore
  Future<void> updateUserData(UserModel updatedUser) async {
    try {
      await _db.collection("Users").doc(updatedUser.id).set(updatedUser.toJson());
    } on FirebaseException catch (e) {
      throw UNFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const UNFormatException();
    } on PlatformException catch (e) {
      throw UNPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Update any field in specifice User Collection
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).update(json);
    } on FirebaseException catch (e) {
      throw UNFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const UNFormatException();
    } on PlatformException catch (e) {
      throw UNPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Function to remove user data from Firestore.
  Future<void> removeUserRecord(String userId) async {
    try {
      await _db.collection("Users").doc(userId).delete();
    } on FirebaseException catch (e) {
      throw UNFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const UNFormatException();
    } on PlatformException catch (e) {
      throw UNPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  ///Update any Image
}

