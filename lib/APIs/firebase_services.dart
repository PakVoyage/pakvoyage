// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pak_voyage/Models/tour.dart';
import 'package:pak_voyage/Models/user_model.dart';
import 'package:pak_voyage/Screens/Sign%20in/Ui/sign_in_screen.dart';

class FirebaseServices {
  // Accessing Firebase FireStore
  static final firestore = FirebaseFirestore.instance;
  // Accessing Firebase Auth
  static final auth = FirebaseAuth.instance;
  // current user
  static User get user => auth.currentUser!;
  // Accessing current User Id
  static final userID = FirebaseAuth.instance.currentUser!.uid;

  static UsersModel userDetail = UsersModel(
    name: '',
    email: '',
    password: '',
    profilePic: '',
    pushToken: '',
    id: '',
    myTours: [''],
  );

  static getUserDetail() async {
    try {
      var docSnapshot = await firestore.collection('users').doc(user.uid).get();
      if (docSnapshot.exists) {
        userDetail = UsersModel.fromJson(docSnapshot.data()!);
        log('Updated User ID: ${userDetail.id}');
      } else {
        log('User document does not exist');
      }
    } catch (e) {
      log('Error fetching user details: $e');
    }
  }

  // Clear user details
  static void clearUserDetail() {
    userDetail = UsersModel(
        name: '',
        email: '',
        password: '',
        profilePic: '',
        pushToken: '',
        id: '',
        myTours: []);
    log("User details cleared");
  }

  // Create User
  static Future<void> signUpUser(
      BuildContext context, String name, String email, String password) async {
    try {
      log('Attempting to sign up user with email: $email');

      // Attempt to create a user with email and password
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      log('User created: ${userCredential.user?.uid}');
      String userID = userCredential.user?.uid ?? '';

      // Create user details model
      var userDetails = UsersModel(
          name: name,
          email: email,
          password: password,
          profilePic: '',
          pushToken: '',
          id: userID,
          myTours: []);

      // Save user data to Firestore
      await firestore.collection('users').doc(userID).set(userDetails.toJson());
      log('User data saved to Firestore');

      // Show success message

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User successfully signed up!')),
      );
      getUserDetail();
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => SignInView(),
          ));
    } on FirebaseAuthException catch (e) {
      log('FirebaseAuthException: ${e.code}');
      if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text(
                  'The email address is already in use by another account.')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to sign up: ${e.message}')),
        );
      }
    } catch (e) {
      log('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: $e')),
      );
    }
  }

  static Future<List<Map<String, dynamic>>> getIslamabadPlaces(
      String city) async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('city')
          .doc(city)
          .collection('mustVisitAttractions')
          .get();

      List<Map<String, dynamic>> data = snapshot.docs.map((doc) {
        return doc.data() as Map<String, dynamic>;
      }).toList();

      return data;
    } catch (e) {
      print('Failed to fetch data: $e');
      return [];
    }
  }

  static Future<List<Map<String, dynamic>>> getEmergency(String city) async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('city')
          .doc(city)
          .collection('emergency')
          .get();

      List<Map<String, dynamic>> data = snapshot.docs.map((doc) {
        return doc.data() as Map<String, dynamic>;
      }).toList();

      return data;
    } catch (e) {
      print('Failed to fetch data: $e');
      return [];
    }
  }

  static Future<List<Map<String, dynamic>>> getTransportation(
      String city) async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('city')
          .doc(city)
          .collection('transportation')
          .get();

      List<Map<String, dynamic>> data = snapshot.docs.map((doc) {
        return doc.data() as Map<String, dynamic>;
      }).toList();

      return data;
    } catch (e) {
      print('Failed to fetch data: $e');
      return [];
    }
  }

  static Future<List<Map<String, dynamic>>> getCuisine(String city) async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('city')
          .doc(city)
          .collection('topdiningplaces')
          .get();

      List<Map<String, dynamic>> data = snapshot.docs.map((doc) {
        return doc.data() as Map<String, dynamic>;
      }).toList();

      return data;
    } catch (e) {
      print('Failed to fetch data: $e');
      return [];
    }
  }

  // Get Tours

  static Future<List<TourModel>> getAllTours() async {
    try {
      // Reference to the Firestore collection
      final CollectionReference toursCollection =
          FirebaseFirestore.instance.collection('tours');

      // Get the collection snapshot
      final QuerySnapshot querySnapshot = await toursCollection.get();

      // Convert the documents to TourModel objects
      final List<TourModel> tours = querySnapshot.docs.map((doc) {
        return TourModel.fromDocument(doc);
      }).toList();
      print('Fetched tours data: ');
      return tours;
    } catch (e) {
      print('Error fetching tours data: $e');
      return [];
    }
  }
}
