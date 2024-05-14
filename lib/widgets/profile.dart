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

  // Controllers for all the fields
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _adjectiveController = TextEditingController();
  final TextEditingController _maxAgeController = TextEditingController();
  final TextEditingController _minAgeController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _bucketListController = TextEditingController();
  final TextEditingController _catchphraseController = TextEditingController();
  final TextEditingController _dateIdeasController = TextEditingController();
  final TextEditingController _desertIslandController = TextEditingController();
  final TextEditingController _dietController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _favoriteActivitiesController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _fitnessHabitsController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _inspirationalFigureController = TextEditingController();
  final TextEditingController _languagesSpokenController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _locationPreferenceController = TextEditingController();
  final TextEditingController _lookingForController = TextEditingController();
  final TextEditingController _meaningOfLifeController = TextEditingController();
  final TextEditingController _nextCountryController = TextEditingController();
  final TextEditingController _nounController = TextEditingController();
  final TextEditingController _personalityColorController = TextEditingController();
  final TextEditingController _petsController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _photoChillController = TextEditingController();
  final TextEditingController _photoCrazyController = TextEditingController();
  final TextEditingController _photoMemeController = TextEditingController();
  final TextEditingController _photoSmileController = TextEditingController();
  final TextEditingController _photoVibeController = TextEditingController();
  final TextEditingController _primaryGoalController = TextEditingController();
  final TextEditingController _professionController = TextEditingController();
  final TextEditingController _profilePictureURLController = TextEditingController();
  final TextEditingController _reincarnationAnimalController = TextEditingController();
  final TextEditingController _relationshipDealBreakerController = TextEditingController();
  final TextEditingController _religionController = TextEditingController();
  final TextEditingController _schoolController = TextEditingController();
  final TextEditingController _secondFavFruitController = TextEditingController();
  final TextEditingController _sexualPreferenceController = TextEditingController();
  final TextEditingController _superPowerController = TextEditingController();
  final TextEditingController _themeSongController = TextEditingController();
  final TextEditingController _weirdestDreamController = TextEditingController();
  final TextEditingController _zodiacController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  @override
  void dispose() {
    _dobController.dispose();
    _adjectiveController.dispose();
    _maxAgeController.dispose();
    _minAgeController.dispose();
    _bioController.dispose();
    _bucketListController.dispose();
    _catchphraseController.dispose();
    _dateIdeasController.dispose();
    _desertIslandController.dispose();
    _dietController.dispose();
    _emailController.dispose();
    _favoriteActivitiesController.dispose();
    _firstNameController.dispose();
    _fitnessHabitsController.dispose();
    _genderController.dispose();
    _heightController.dispose();
    _inspirationalFigureController.dispose();
    _languagesSpokenController.dispose();
    _locationController.dispose();
    _locationPreferenceController.dispose();
    _lookingForController.dispose();
    _meaningOfLifeController.dispose();
    _nextCountryController.dispose();
    _nounController.dispose();
    _personalityColorController.dispose();
    _petsController.dispose();
    _phoneNumberController.dispose();
    _photoChillController.dispose();
    _photoCrazyController.dispose();
    _photoMemeController.dispose();
    _photoSmileController.dispose();
    _photoVibeController.dispose();
    _primaryGoalController.dispose();
    _professionController.dispose();
    _profilePictureURLController.dispose();
    _reincarnationAnimalController.dispose();
    _relationshipDealBreakerController.dispose();
    _religionController.dispose();
    _schoolController.dispose();
    _secondFavFruitController.dispose();
    _sexualPreferenceController.dispose();
    _superPowerController.dispose();
    _themeSongController.dispose();
    _weirdestDreamController.dispose();
    _zodiacController.dispose();
    super.dispose();
  }

  _loadUserData() async {
    var user = _auth.currentUser;
    if (user != null) {
      try {
        var userData = await _firestore.collection('users').doc(user.uid).get();
        if (userData.exists && userData.data() != null) {
          setState(() {
            _dobController.text = (userData.data()!['DOB'] as Timestamp?)?.toDate().toString() ?? '';
            _adjectiveController.text = userData.data()!['adjectiveThatPersonifiesMe'] ?? '';
            _maxAgeController.text = userData.data()!['agePreference']?['max'] ?? '';
            _minAgeController.text = userData.data()!['agePreference']?['min'] ?? '';
            _bioController.text = userData.data()!['bio'] ?? '';
            _bucketListController.text = userData.data()!['bucketList'] ?? '';
            _catchphraseController.text = userData.data()!['catchphrase'] ?? '';
            _dateIdeasController.text = userData.data()!['dateIdeas'] ?? '';
            _desertIslandController.text = userData.data()!['desertIslandBlank'] ?? '';
            _dietController.text = userData.data()!['diet'] ?? '';
            _emailController.text = userData.data()!['email'] ?? '';
            _favoriteActivitiesController.text = userData.data()!['favoriteActivities'] ?? '';
            _firstNameController.text = userData.data()!['firstName'] ?? '';
            _fitnessHabitsController.text = userData.data()!['fitnessHabits'] ?? '';
            _genderController.text = userData.data()!['gender'] ?? '';
            _heightController.text = userData.data()!['height'] ?? '';
            _inspirationalFigureController.text = userData.data()!['inspirationalFigure'] ?? '';
            _languagesSpokenController.text = userData.data()!['languagesSpoken'] ?? '';
            _locationPreferenceController.text = userData.data()!['locationPreference']?.toString() ?? '';
            _lookingForController.text = userData.data()!['lookingFor'] ?? '';
            _meaningOfLifeController.text = userData.data()!['meaningOfLife'] ?? '';
            _nextCountryController.text = userData.data()!['nextCountryToTravelTo'] ?? '';
            _nounController.text = userData.data()!['nounThatSymbolizesMe'] ?? '';
            _personalityColorController.text = userData.data()!['personalityColor'] ?? '';
            _petsController.text = userData.data()!['pets'] ?? '';
            _phoneNumberController.text = userData.data()!['phoneNumber'] ?? '';
            _photoChillController.text = userData.data()!['photoChill'] ?? '';
            _photoCrazyController.text = userData.data()!['photoCrazy'] ?? '';
            _photoMemeController.text = userData.data()!['photoMeme'] ?? '';
            _photoSmileController.text = userData.data()!['photoSmile'] ?? '';
            _photoVibeController.text = userData.data()!['photoVibe'] ?? '';
            _primaryGoalController.text = userData.data()!['primaryGoal'] ?? '';
            _professionController.text = userData.data()!['profession'] ?? '';
            _profilePictureURLController.text = userData.data()!['profilePictureURL'] ?? '';
            _reincarnationAnimalController.text = userData.data()!['reincarnationAnimal'] ?? '';
            _relationshipDealBreakerController.text = userData.data()!['relationshipDealBreaker'] ?? '';
            _religionController.text = userData.data()!['religion'] ?? '';
            _schoolController.text = userData.data()!['school'] ?? '';
            _secondFavFruitController.text = userData.data()!['secondFavFruit'] ?? '';
            _sexualPreferenceController.text = userData.data()!['sexualPreference'] ?? '';
            _superPowerController.text = userData.data()!['superPower'] ?? '';
            _themeSongController.text = userData.data()!['themeSong'] ?? '';
            _weirdestDreamController.text = userData.data()!['weirdestDream'] ?? '';
            _zodiacController.text = userData.data()!['zodiac'] ?? '';
            if (userData.data()!['location'] != null) {
              _locationController.text = "${(userData.data()!['location'] as GeoPoint).latitude}, ${(userData.data()!['location'] as GeoPoint).longitude}";
            }
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
      Map<String, dynamic> updatedData = {
        'DOB': Timestamp.fromDate(DateTime.parse(_dobController.text)),
        'adjectiveThatPersonifiesMe': _adjectiveController.text,
        'agePreference': {
          'max': _maxAgeController.text,
          'min': _minAgeController.text,
        },
        'bio': _bioController.text,
        'bucketList': _bucketListController.text,
        'catchphrase': _catchphraseController.text,
        'dateIdeas': _dateIdeasController.text,
        'desertIslandBlank': _desertIslandController.text,
        'diet': _dietController.text,
        'email': _emailController.text,
        'favoriteActivities': _favoriteActivitiesController.text,
        'firstName': _firstNameController.text,
        'fitnessHabits': _fitnessHabitsController.text,
        'gender': _genderController.text,
        'height': _heightController.text,
        'inspirationalFigure': _inspirationalFigureController.text,
        'languagesSpoken': _languagesSpokenController.text,
        'locationPreference': int.tryParse(_locationPreferenceController.text) ?? 0,
        'lookingFor': _lookingForController.text,
        'meaningOfLife': _meaningOfLifeController.text,
        'nextCountryToTravelTo': _nextCountryController.text,
        'nounThatSymbolizesMe': _nounController.text,
        'personalityColor': _personalityColorController.text,
        'pets': _petsController.text,
        'phoneNumber': _phoneNumberController.text,
        'photoChill': _photoChillController.text,
        'photoCrazy': _photoCrazyController.text,
        'photoMeme': _photoMemeController.text,
        'photoSmile': _photoSmileController.text,
        'photoVibe': _photoVibeController.text,
        'primaryGoal': _primaryGoalController.text,
        'profession': _professionController.text,
        'profilePictureURL': _profilePictureURLController.text,
        'reincarnationAnimal': _reincarnationAnimalController.text,
        'relationshipDealBreaker': _relationshipDealBreakerController.text,
        'religion': _religionController.text,
        'school': _schoolController.text,
        'secondFavFruit': _secondFavFruitController.text,
        'sexualPreference': _sexualPreferenceController.text,
        'superPower': _superPowerController.text,
        'themeSong': _themeSongController.text,
        'weirdestDream': _weirdestDreamController.text,
        'zodiac': _zodiacController.text,
      };

      // Parse the location
      if (_locationController.text.isNotEmpty) {
        List<String> latLng = _locationController.text.split(',');
        if (latLng.length == 2) {
          double latitude = double.tryParse(latLng[0].trim()) ?? 0.0;
          double longitude = double.tryParse(latLng[1].trim()) ?? 0.0;
          updatedData['location'] = GeoPoint(latitude, longitude);
        }
      }

      await _firestore.collection('users').doc(user.uid).set(updatedData);
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
          TextField(
            controller: _dobController,
            decoration: const InputDecoration(labelText: 'DOB'),
          ),
          TextField(
            controller: _adjectiveController,
            decoration: const InputDecoration(labelText: 'Adjective That Personifies Me'),
          ),
          TextField(
            controller: _maxAgeController,
            decoration: const InputDecoration(labelText: 'Max Age Preference'),
          ),
          TextField(
            controller: _minAgeController,
            decoration: const InputDecoration(labelText: 'Min Age Preference'),
          ),
          TextField(
            controller: _bioController,
            decoration: const InputDecoration(labelText: 'Bio'),
          ),
          TextField(
            controller: _bucketListController,
            decoration: const InputDecoration(labelText: 'Bucket List'),
          ),
          TextField(
            controller: _catchphraseController,
            decoration: const InputDecoration(labelText: 'Catchphrase'),
          ),
          TextField(
            controller: _dateIdeasController,
            decoration: const InputDecoration(labelText: 'Date Ideas'),
          ),
          TextField(
            controller: _desertIslandController,
            decoration: const InputDecoration(labelText: 'Desert Island Blank'),
          ),
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          TextField(
            controller: _favoriteActivitiesController,
            decoration: const InputDecoration(labelText: 'Favorite Activities'),
          ),
          TextField(
            controller: _fitnessHabitsController,
            decoration: const InputDecoration(labelText: 'Fitness Habits'),
          ),
          TextField(
            controller: _genderController,
            decoration: const InputDecoration(labelText: 'Gender'),
          ),
          TextField(
            controller: _heightController,
            decoration: const InputDecoration(labelText: 'Height'),
          ),
          TextField(
            controller: _inspirationalFigureController,
            decoration: const InputDecoration(labelText: 'Inspirational Figure'),
          ),
          TextField(
            controller: _languagesSpokenController,
            decoration: const InputDecoration(labelText: 'Languages Spoken'),
          ),
          TextField(
            controller: _locationController,
            decoration: const InputDecoration(labelText: 'Location'),
          ),
          TextField(
            controller: _locationPreferenceController,
            decoration: const InputDecoration(labelText: 'Location Preference'),
          ),
          TextField(
            controller: _lookingForController,
            decoration: const InputDecoration(labelText: 'Looking For'),
          ),
          TextField(
            controller: _meaningOfLifeController,
            decoration: const InputDecoration(labelText: 'Meaning Of Life'),
          ),
          TextField(
            controller: _nextCountryController,
            decoration: const InputDecoration(labelText: 'Next Country To Travel To'),
          ),
          TextField(
            controller: _nounController,
            decoration: const InputDecoration(labelText: 'Noun That Symbolizes Me'),
          ),
          TextField(
            controller: _personalityColorController,
            decoration: const InputDecoration(labelText: 'Personality Color'),
          ),
          TextField(
            controller: _petsController,
            decoration: const InputDecoration(labelText: 'Pets'),
          ),
          TextField(
            controller: _phoneNumberController,
            decoration: const InputDecoration(labelText: 'Phone Number'),
          ),
          TextField(
            controller: _photoChillController,
            decoration: const InputDecoration(labelText: 'Photo Chill'),
          ),
          TextField(
            controller: _photoCrazyController,
            decoration: const InputDecoration(labelText: 'Photo Crazy'),
          ),
          TextField(
            controller: _photoMemeController,
            decoration: const InputDecoration(labelText: 'Photo Meme'),
          ),
          TextField(
            controller: _photoSmileController,
            decoration: const InputDecoration(labelText: 'Photo Smile'),
          ),
          TextField(
            controller: _photoVibeController,
            decoration: const InputDecoration(labelText: 'Photo Vibe'),
          ),
          TextField(
            controller: _primaryGoalController,
            decoration: const InputDecoration(labelText: 'Primary Goal'),
          ),
          TextField(
            controller: _profilePictureURLController,
            decoration: const InputDecoration(labelText: 'Profile Picture URL'),
          ),
          TextField(
            controller: _reincarnationAnimalController,
            decoration: const InputDecoration(labelText: 'Reincarnation Animal'),
          ),
          TextField(
            controller: _relationshipDealBreakerController,
            decoration: const InputDecoration(labelText: 'Relationship Deal Breaker'),
          ),
          TextField(
            controller: _religionController,
            decoration: const InputDecoration(labelText: 'Religion'),
          ),
          TextField(
            controller: _secondFavFruitController,
            decoration: const InputDecoration(labelText: 'Second Favorite Fruit'),
          ),
          TextField(
            controller: _sexualPreferenceController,
            decoration: const InputDecoration(labelText: 'Sexual Preference'),
          ),
          TextField(
            controller: _superPowerController,
            decoration: const InputDecoration(labelText: 'Super Power'),
          ),
          TextField(
            controller: _themeSongController,
            decoration: const InputDecoration(labelText: 'Theme Song'),
          ),
          TextField(
            controller: _weirdestDreamController,
            decoration: const InputDecoration(labelText: 'Weirdest Dream'),
          ),
          TextField(
            controller: _zodiacController,
            decoration: const InputDecoration(labelText: 'Zodiac'),
          ),
        ],
      ),
    );
  }
}
