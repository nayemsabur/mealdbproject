import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class EditProfileScreen extends StatefulWidget {
  final String name;
  final String email;
  final File? profileImage;
  final String? bio;
  final String? birthday;
  final String? phoneNumber;
  final String? location;
  final String? gender;
  final String? username;
  final String? paymentMethod;
  final String? nationality;
  final String? emergencyContact;
  final Function(String, String, File?, String, String, String, String, String, String, String, String, String) onProfileUpdate;

  const EditProfileScreen({
    Key? key,
    required this.name,
    required this.email,
    required this.profileImage,
    required this.bio,
    required this.birthday,
    required this.phoneNumber,
    required this.location,
    required this.gender,
    required this.username,
    required this.paymentMethod,
    required this.nationality,
    required this.emergencyContact,
    required this.onProfileUpdate,
  }) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController bioController;
  late TextEditingController birthdayController;
  late TextEditingController phoneNumberController;
  late TextEditingController locationController;
  late TextEditingController genderController;
  late TextEditingController usernameController;
  late TextEditingController paymentMethodController;
  late TextEditingController nationalityController;
  late TextEditingController emergencyContactController;

  File? profileImage;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.name);
    emailController = TextEditingController(text: widget.email);
    bioController = TextEditingController(text: widget.bio);
    birthdayController = TextEditingController(text: widget.birthday);
    phoneNumberController = TextEditingController(text: widget.phoneNumber);
    locationController = TextEditingController(text: widget.location);
    genderController = TextEditingController(text: widget.gender);
    usernameController = TextEditingController(text: widget.username);
    paymentMethodController = TextEditingController(text: widget.paymentMethod);
    nationalityController = TextEditingController(text: widget.nationality);
    emergencyContactController = TextEditingController(text: widget.emergencyContact);

    profileImage = widget.profileImage;
  }

  Future<void> _pickImage(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: source);

    if (image != null) {
      setState(() {
        profileImage = File(image.path);
      });
    }
  }

  void _saveProfile() {
    widget.onProfileUpdate(
      nameController.text,
      emailController.text,
      profileImage,
      bioController.text,
      birthdayController.text,
      phoneNumberController.text,
      locationController.text,
      genderController.text,
      usernameController.text,
      paymentMethodController.text,
      nationalityController.text,
      emergencyContactController.text,
    );
    Navigator.pop(context); // Go back without disposing of the ProfileScreen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  GestureDetector(
                    onTap: () => _pickImage(ImageSource.gallery),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: profileImage != null
                          ? FileImage(profileImage!)
                          : const NetworkImage('https://example.com/default_avatar.png'), // Default image
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _pickImage(ImageSource.camera),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue, // Background color of the icon
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: bioController,
              decoration: const InputDecoration(labelText: 'Bio'),
            ),
            TextField(
              controller: birthdayController,
              decoration: const InputDecoration(labelText: 'Birthday'),
            ),
            TextField(
              controller: phoneNumberController,
              decoration: const InputDecoration(labelText: 'Phone Number'),
            ),
            TextField(
              controller: locationController,
              decoration: const InputDecoration(labelText: 'Location'),
            ),
            TextField(
              controller: genderController,
              decoration: const InputDecoration(labelText: 'Gender'),
            ),
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: paymentMethodController,
              decoration: const InputDecoration(labelText: 'Payment Method'),
            ),
            TextField(
              controller: nationalityController,
              decoration: const InputDecoration(labelText: 'Nationality'),
            ),
            TextField(
              controller: emergencyContactController,
              decoration: const InputDecoration(labelText: 'Emergency Contact'),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _saveProfile,
                child: const Text('Save Changes'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
