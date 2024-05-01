import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _schoolController = TextEditingController();
  final TextEditingController _dietController = TextEditingController();
  final TextEditingController _professionController = TextEditingController();
  // Add more controllers for other fields as necessary

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _schoolController.dispose();
    _dietController.dispose();
    _professionController.dispose();
    // Dispose other controllers
    super.dispose();
  }

  _loadUserData() async {
    var user = _auth.currentUser;
    if (user != null) {
      try {
        var userData = await _firestore.collection('users').doc(user.uid).get();
        if (userData.exists && userData.data() != null) {
          setState(() {
            _firstNameController.text = userData.data()?['firstName'] ?? '';
            _schoolController.text = userData.data()?['school'] ?? '';
            _dietController.text = userData.data()?['diet'] ?? '';
            _professionController.text = userData.data()?['profession'] ?? '';
            // Set text for other controllers
          });
        }
      } catch (e) {
        print("Error fetching user data: $e");
      }
    }
  }

  _saveUserData() async {
    var user = _auth.currentUser;
    if (user != null) {
      await _firestore.collection('users').doc(user.uid).update({
        'firstName': _firstNameController.text,
        'school': _schoolController.text,
        'diet': _dietController.text,
        'profession': _professionController.text,
        // Update other fields as necessary
      });
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Profile Updated Successfully')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _saveUserData,
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          TextField(
            controller: _firstNameController,
            decoration: const InputDecoration(labelText: 'First Name'),
          ),
          TextField(
            controller: _schoolController,
            decoration: const InputDecoration(labelText: 'School'),
          ),
          TextField(
            controller: _dietController,
            decoration: const InputDecoration(labelText: 'Diet'),
          ),
          TextField(
            controller: _professionController,
            decoration: const InputDecoration(labelText: 'Profession'),
          ),
          // Add TextFields for other fields as needed
        ],
      ),
    );
  }
}
