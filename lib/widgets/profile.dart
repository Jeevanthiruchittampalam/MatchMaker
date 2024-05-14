import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _inspirationalFigureController = TextEditingController();
  final TextEditingController _languagesSpokenController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _lookingForController = TextEditingController();
  final TextEditingController _meaningOfLifeController = TextEditingController();
  final TextEditingController _nextCountryController = TextEditingController();
  final TextEditingController _nounController = TextEditingController();
  final TextEditingController _petsController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _photoChillController = TextEditingController();
  final TextEditingController _photoCrazyController = TextEditingController();
  final TextEditingController _photoMemeController = TextEditingController();
  final TextEditingController _photoSmileController = TextEditingController();
  final TextEditingController _photoVibeController = TextEditingController();
  final TextEditingController _professionController = TextEditingController();
  final TextEditingController _profilePictureURLController = TextEditingController();
  final TextEditingController _reincarnationAnimalController = TextEditingController();
  final TextEditingController _relationshipDealBreakerController = TextEditingController();
  final TextEditingController _religionController = TextEditingController();
  final TextEditingController _schoolController = TextEditingController();
  final TextEditingController _secondFavFruitController = TextEditingController();
  final TextEditingController _superPowerController = TextEditingController();
  final TextEditingController _themeSongController = TextEditingController();
  final TextEditingController _weirdestDreamController = TextEditingController();
  final TextEditingController _zodiacController = TextEditingController();

  String? _selectedPersonalityColor;
  String? _selectedGender;
  String? _selectedSexualPreference;
  List<String> _selectedLookingFor = [];
  double _locationPreference = 0;
  String? _selectedPrimaryGoal;
  String? _selectedFitnessHabits;

  final List<String> _colorOptions = [
    'Yellow',
    'Navy',
    'Red',
    'Black',
    'Pink',
    'Purple',
    'Green',
    'Aquamarine',
    'Orange',
    'White'
  ];

  final Map<String, Color> _colorMap = {
    'Yellow': Color(0xFFFFEA00),
    'Navy': Color(0xFF00217D),
    'Red': Color(0xFFFF0000),
    'Black': Color(0xFF000000),
    'Pink': Color(0xFFEC00FF),
    'Purple': Color(0xFF7F00FF),
    'Green': Color(0xFF228B22),
    'Aquamarine': Color(0xFF7FFFD4),
    'Orange': Color(0xFFDF751D),
    'White': Color(0xFFFFFFFF),
  };

  final List<String> _genderOptions = ['Male', 'Female', 'Other'];
  final List<String> _lookingForOptions = [
    'The Love Of My Life',
    'Long Term Relationship',
    'Short-Term Relationship',
    'Fling',
    'NPC Interaction',
    'Friend'
  ];
  final List<String> _primaryGoalOptions = [
    'Live My Best Life',
    'Have A Family',
    'Save The World',
    'Destroy The World',
    'Make Money',
    'Help People',
    'Uncover The Secrets of The Universe',
    'Chill'
  ];
  final List<String> _fitnessHabitsOptions = [
    'God Mode',
    'Athlete',
    'I Dabble',
    'Now and Then',
    'Not My Thing'
  ];

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
    _heightController.dispose();
    _inspirationalFigureController.dispose();
    _languagesSpokenController.dispose();
    _locationController.dispose();
    _lookingForController.dispose();
    _meaningOfLifeController.dispose();
    _nextCountryController.dispose();
    _nounController.dispose();
    _petsController.dispose();
    _phoneNumberController.dispose();
    _photoChillController.dispose();
    _photoCrazyController.dispose();
    _photoMemeController.dispose();
    _photoSmileController.dispose();
    _photoVibeController.dispose();
    _professionController.dispose();
    _profilePictureURLController.dispose();
    _reincarnationAnimalController.dispose();
    _relationshipDealBreakerController.dispose();
    _religionController.dispose();
    _schoolController.dispose();
    _secondFavFruitController.dispose();
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
            _dobController.text = (userData.data()!['DOB'] as Timestamp?)?.toDate().toString().split(' ')[0] ?? '';
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
            _selectedFitnessHabits = userData.data()!['fitnessHabits'] ?? '';
            _selectedGender = userData.data()!['gender'] ?? '';
            _heightController.text = userData.data()!['height'] ?? '';
            _inspirationalFigureController.text = userData.data()!['inspirationalFigure'] ?? '';
            _languagesSpokenController.text = userData.data()!['languagesSpoken'] ?? '';
            _locationPreference = userData.data()!['locationPreference']?.toDouble() ?? 0;
            _selectedLookingFor = List<String>.from(userData.data()!['lookingFor'] ?? []);
            _lookingForController.text = _selectedLookingFor.join(', ');
            _meaningOfLifeController.text = userData.data()!['meaningOfLife'] ?? '';
            _nextCountryController.text = userData.data()!['nextCountryToTravelTo'] ?? '';
            _nounController.text = userData.data()!['nounThatSymbolizesMe'] ?? '';
            _selectedPersonalityColor = userData.data()!['personalityColor'] ?? '';
            _selectedSexualPreference = userData.data()!['sexualPreference'] ?? '';
            _selectedPrimaryGoal = userData.data()!['primaryGoal'] ?? '';
            _petsController.text = userData.data()!['pets'] ?? '';
            _phoneNumberController.text = userData.data()!['phoneNumber'] ?? '';
            _photoChillController.text = userData.data()!['photoChill'] ?? '';
            _photoCrazyController.text = userData.data()!['photoCrazy'] ?? '';
            _photoMemeController.text = userData.data()!['photoMeme'] ?? '';
            _photoSmileController.text = userData.data()!['photoSmile'] ?? '';
            _photoVibeController.text = userData.data()!['photoVibe'] ?? '';
            _professionController.text = userData.data()!['profession'] ?? '';
            _profilePictureURLController.text = userData.data()!['profilePictureURL'] ?? '';
            _reincarnationAnimalController.text = userData.data()!['reincarnationAnimal'] ?? '';
            _relationshipDealBreakerController.text = userData.data()!['relationshipDealBreaker'] ?? '';
            _religionController.text = userData.data()!['religion'] ?? '';
            _schoolController.text = userData.data()!['school'] ?? '';
            _secondFavFruitController.text = userData.data()!['secondFavFruit'] ?? '';
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
        'fitnessHabits': _selectedFitnessHabits,
        'gender': _selectedGender,
        'height': _heightController.text,
        'inspirationalFigure': _inspirationalFigureController.text,
        'languagesSpoken': _languagesSpokenController.text,
        'locationPreference': _locationPreference,
        'lookingFor': _selectedLookingFor,
        'meaningOfLife': _meaningOfLifeController.text,
        'nextCountryToTravelTo': _nextCountryController.text,
        'nounThatSymbolizesMe': _nounController.text,
        'personalityColor': _selectedPersonalityColor,
        'pets': _petsController.text,
        'phoneNumber': _phoneNumberController.text,
        'photoChill': _photoChillController.text,
        'photoCrazy': _photoCrazyController.text,
        'photoMeme': _photoMemeController.text,
        'photoSmile': _photoSmileController.text,
        'photoVibe': _photoVibeController.text,
        'primaryGoal': _selectedPrimaryGoal,
        'profession': _professionController.text,
        'profilePictureURL': _profilePictureURLController.text,
        'reincarnationAnimal': _reincarnationAnimalController.text,
        'relationshipDealBreaker': _relationshipDealBreakerController.text,
        'religion': _religionController.text,
        'school': _schoolController.text,
        'secondFavFruit': _secondFavFruitController.text,
        'sexualPreference': _selectedSexualPreference,
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
    Color backgroundColor = _colorMap[_selectedPersonalityColor] ?? Colors.white;
    bool isDarkBackground = _selectedPersonalityColor == 'Navy' || _selectedPersonalityColor == 'Black';
    Color textColor = isDarkBackground ? Colors.white : Colors.black;

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
      body: Container(
        color: backgroundColor,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            _buildTextField(_firstNameController, 'First Name', textColor),
            _buildTextField(_schoolController, 'School', textColor),
            _buildTextField(_dietController, 'Diet', textColor),
            _buildTextField(_professionController, 'Profession', textColor),
            _buildTextField(_dobController, 'DOB (YYYY-MM-DD)', textColor, keyboardType: TextInputType.datetime),
            _buildTextField(_adjectiveController, 'Adjective That Personifies Me', textColor),
            _buildTextField(_maxAgeController, 'Max Age Preference', textColor),
            _buildTextField(_minAgeController, 'Min Age Preference', textColor),
            _buildTextField(_bioController, 'Bio', textColor),
            _buildTextField(_bucketListController, 'Bucket List', textColor),
            _buildTextField(_catchphraseController, 'Catchphrase', textColor),
            _buildTextField(_dateIdeasController, 'Date Ideas', textColor),
            _buildTextField(_desertIslandController, 'Desert Island Blank', textColor),
            _buildTextField(_emailController, 'Email', textColor),
            _buildTextField(_favoriteActivitiesController, 'Favorite Activities', textColor),
            _buildDropdownButtonFormField(_selectedGender, 'Gender', _genderOptions, (value) {
              setState(() {
                _selectedGender = value;
              });
            }, textColor),
            _buildTextField(_heightController, 'Height', textColor),
            _buildTextField(_inspirationalFigureController, 'Inspirational Figure', textColor),
            _buildTextField(_languagesSpokenController, 'Languages Spoken', textColor),
            _buildTextField(_locationController, 'Location', textColor),
            Text(
              'Location Preference: ${_locationPreference.round()} km',
              style: TextStyle(fontSize: 16, color: textColor),
            ),
            Slider(
              value: _locationPreference,
              min: 0,
              max: 100,
              divisions: 100,
              label: _locationPreference.round().toString(),
              onChanged: (value) {
                setState(() {
                  _locationPreference = value;
                });
              },
            ),
            _buildTextField(_lookingForController, 'Looking For', textColor, readOnly: true, onTap: () async {
              final List<String>? results = await showDialog<List<String>>(
                context: context,
                builder: (BuildContext context) {
                  return MultiSelectDialog(
                    items: _lookingForOptions,
                    initialSelectedItems: _selectedLookingFor,
                  );
                },
              );

              if (results != null) {
                setState(() {
                  _selectedLookingFor = results;
                  _lookingForController.text = _selectedLookingFor.join(', ');
                });
              }
            }),
            _buildTextField(_meaningOfLifeController, 'Meaning Of Life', textColor),
            _buildTextField(_nextCountryController, 'Next Country To Travel To', textColor),
            _buildTextField(_nounController, 'Noun That Symbolizes Me', textColor),
            _buildDropdownButtonFormField(_selectedPersonalityColor, 'Personality Color', _colorOptions, (value) {
              setState(() {
                _selectedPersonalityColor = value;
              });
            }, textColor),
            _buildTextField(_petsController, 'Pets', textColor),
            _buildTextField(_phoneNumberController, 'Phone Number', textColor),
            _buildTextField(_photoChillController, 'Photo Chill', textColor),
            _buildTextField(_photoCrazyController, 'Photo Crazy', textColor),
            _buildTextField(_photoMemeController, 'Photo Meme', textColor),
            _buildTextField(_photoSmileController, 'Photo Smile', textColor),
            _buildTextField(_photoVibeController, 'Photo Vibe', textColor),
            _buildDropdownButtonFormField(_selectedPrimaryGoal, 'Primary Goal', _primaryGoalOptions, (value) {
              setState(() {
                _selectedPrimaryGoal = value;
              });
            }, textColor),
            _buildDropdownButtonFormField(_selectedFitnessHabits, 'Fitness Habits', _fitnessHabitsOptions, (value) {
              setState(() {
                _selectedFitnessHabits = value;
              });
            }, textColor),
            _buildTextField(_profilePictureURLController, 'Profile Picture URL', textColor),
            _buildTextField(_reincarnationAnimalController, 'Reincarnation Animal', textColor),
            _buildTextField(_relationshipDealBreakerController, 'Relationship Deal Breaker', textColor),
            _buildTextField(_religionController, 'Religion', textColor),
            _buildTextField(_secondFavFruitController, 'Second Favorite Fruit', textColor),
            _buildDropdownButtonFormField(_selectedSexualPreference, 'Sexual Preference', _genderOptions, (value) {
              setState(() {
                _selectedSexualPreference = value;
              });
            }, textColor),
            _buildTextField(_superPowerController, 'Super Power', textColor),
            _buildTextField(_themeSongController, 'Theme Song', textColor),
            _buildTextField(_weirdestDreamController, 'Weirdest Dream', textColor),
            _buildTextField(_zodiacController, 'Zodiac', textColor),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String labelText, Color textColor, {TextInputType? keyboardType, bool readOnly = false, void Function()? onTap}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(labelText: labelText, labelStyle: TextStyle(color: textColor)),
      style: TextStyle(color: textColor),
      keyboardType: keyboardType,
      readOnly: readOnly,
      onTap: onTap,
    );
  }

  Widget _buildDropdownButtonFormField(String? value, String labelText, List<String> options, void Function(String?)? onChanged, Color textColor) {
    return DropdownButtonFormField<String>(
      value: options.contains(value) ? value : null,
      decoration: InputDecoration(labelText: labelText, labelStyle: TextStyle(color: textColor)),
      items: options.map((option) {
        return DropdownMenuItem(
          value: option,
          child: Text(option, style: TextStyle(color: textColor)),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}

class MultiSelectDialog extends StatefulWidget {
  final List<String> items;
  final List<String> initialSelectedItems;

  MultiSelectDialog({
    required this.items,
    required this.initialSelectedItems,
  });

  @override
  _MultiSelectDialogState createState() => _MultiSelectDialogState();
}

class _MultiSelectDialogState extends State<MultiSelectDialog> {
  late List<String> _selectedItems;

  @override
  void initState() {
    super.initState();
    _selectedItems = widget.initialSelectedItems;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select Items'),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.items.map((item) {
            return CheckboxListTile(
              value: _selectedItems.contains(item),
              title: Text(item),
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (isChecked) {
                setState(() {
                  if (isChecked!) {
                    _selectedItems.add(item);
                  } else {
                    _selectedItems.remove(item);
                  }
                });
              },
            );
          }).toList(),
        ),
      ),
      actions: [
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('OK'),
          onPressed: () {
            Navigator.of(context).pop(_selectedItems);
          },
        ),
      ],
    );
  }
}
