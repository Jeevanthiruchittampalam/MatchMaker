import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart'; // Add this import to format dates

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Controllers for editable fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _bucketListController = TextEditingController();
  // ... Add controllers for other fields as necessary

  // Variables to store non-editable fields
  DateTime? _dob;
  String? _email;
  // ... Add variables for other non-editable fields

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  _loadUserData() async {
    var user = _auth.currentUser;
    if (user != null) {
      var userData = await _firestore.collection('users').doc(user.uid).get();
      if (userData.exists) {
        setState(() {
          // Set the data for editable fields
          _nameController.text = userData.data()?['firstName'] ?? '';
          _bioController.text = userData.data()?['bio'] ?? '';
          _bucketListController.text = userData.data()?['bucketList'] ?? '';
          // ... Set data for other fields

          // Set the data for non-editable fields
          _dob = (userData.data()?['DOB'] as Timestamp?)?.toDate();
          _email = userData.data()?['email'] ?? '';
          // ... Set data for other non-editable fields
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveUserData,
          ),
        ],
      ),
      body: ListView(  // Use ListView to avoid overflow when keyboard appears
        padding: const EdgeInsets.all(16.0),
        children: [
          // Display the profile picture
          // ... Add other widgets to display the profile data
          // Editable fields
          TextField(
            controller: _nameController,
            decoration: InputDecoration(labelText: 'Name'),
          ),
          // ... Add TextFields for other editable fields

          // Non-editable fields displayed as text
          Text('Email: $_email'),
          Text('Date of Birth: ${_dob != null ? DateFormat.yMMMd().format(_dob!) : "Not set"}'),
          // ... Add Text widgets for other non-editable fields
        ],
      ),
    );
  }

  void _saveUserData() {
    var user = _auth.currentUser;
    if (user != null) {
      _firestore.collection('users').doc(user.uid).set({
        'firstName': _nameController.text,
        'bio': _bioController.text,
        // ... Set data for other editable fields
      }, SetOptions(merge: true));
    }
  }
}
