import 'package:flutter/material.dart';
import 'dart:io';
import '../bottom_navbar/bottom_nav_bar.dart';
import 'utils/edit_profiles.dart';

class ProfileScreen extends StatefulWidget {
  final String initialName;
  final String initialEmail;
  final File? initialProfileImage;
  final String? initialBirthday;
  final String? initialPhoneNumber;
  final String? initialLocation;
  final String? initialGender;
  final String? initialUsername;
  final String? initialPaymentMethod;
  final String? initialNationality;
  final String? initialEmergencyContact;
  final Function(String, String, File?, String?, String?, String?, String?, String?, String?, String?, String?, String?) onProfileUpdate;

  const ProfileScreen({
    Key? key,
    required this.initialName,
    required this.initialEmail,
    this.initialProfileImage,
    this.initialBirthday,
    this.initialPhoneNumber,
    this.initialLocation,
    this.initialGender,
    this.initialUsername,
    this.initialPaymentMethod,
    this.initialNationality,
    this.initialEmergencyContact,
    required this.onProfileUpdate,
  }) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late String name;
  late String email;
  File? profileImage;
  String? bio;
  String? birthday;
  String? phoneNumber;
  String? location;
  String? gender;
  String? username;
  String? paymentMethod;
  String? nationality;
  String? emergencyContact;

  @override
  void initState() {
    super.initState();
    name = widget.initialName;
    email = widget.initialEmail;
    profileImage = widget.initialProfileImage;
    birthday = widget.initialBirthday;
    phoneNumber = widget.initialPhoneNumber;
    location = widget.initialLocation;
    gender = widget.initialGender;
    username = widget.initialUsername;
    paymentMethod = widget.initialPaymentMethod;
    nationality = widget.initialNationality;
    emergencyContact = widget.initialEmergencyContact;
  }

  void _updateProfile(String newName, String newEmail, File? newImage, String? newBio, String? newBirthday, String? newPhoneNumber, String? newLocation, String? newGender, String? newUsername, String? newPaymentMethod, String? newNationality, String? newEmergencyContact) {
    setState(() {
      name = newName;
      email = newEmail;
      profileImage = newImage;
      bio = newBio;
      birthday = newBirthday;
      phoneNumber = newPhoneNumber;
      location = newLocation;
      gender = newGender;
      username = newUsername;
      paymentMethod = newPaymentMethod;
      nationality = newNationality;
      emergencyContact = newEmergencyContact;
    });

    widget.onProfileUpdate(name, email, profileImage, bio, birthday, phoneNumber, location, gender, username, paymentMethod, nationality, emergencyContact);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
            TextButton(onPressed:() {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
                MainNavBar()
            ),);}, child: Text("Home"))
          ],
          title: const Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: profileImage != null
                    ? FileImage(profileImage!)
                    : const NetworkImage('https://example.com/default_avatar.png'),
                backgroundColor: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            Text('Name: $name'),
            Text('Email: $email'),
            Text('Bio: ${bio ?? "Not provided"}'),
            Text('Birthday: ${birthday ?? "Not provided"}'),
            Text('Phone Number: ${phoneNumber ?? "Not provided"}'),
            Text('Location: ${location ?? "Not provided"}'),
            Text('Gender: ${gender ?? "Not provided"}'),
            Text('Username: ${username ?? "Not provided"}'),
            Text('Payment Method: ${paymentMethod ?? "Not provided"}'),
            Text('Nationality: ${nationality ?? "Not provided"}'),
            Text('Emergency Contact: ${emergencyContact ?? "Not provided"}'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EditProfileScreen(
                      name: name,
                      email: email,
                      profileImage: profileImage,
                      bio: bio,
                      birthday: birthday,
                      phoneNumber: phoneNumber,
                      location: location,
                      gender: gender,
                      username: username,
                      paymentMethod: paymentMethod,
                      nationality: nationality,
                      emergencyContact: emergencyContact,
                      onProfileUpdate: _updateProfile,
                    ),
                  ),
                );
              },
              child: const Text('Edit Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
