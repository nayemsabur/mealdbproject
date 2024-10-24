import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mealdbproject/ui/screens/auth_screens/sign_in_screen.dart';
import 'package:mealdbproject/ui/screens/drawers/about_us_screen.dart';
import 'help_and_support.dart';
import 'order_history.dart';
import 'profile_screen.dart';
import 'setting.dart';

class DrawerScreen extends StatelessWidget {
  final String name;
  final String email;
  final String profileImageUrl;

  const DrawerScreen({
    Key? key,
    this.name = 'Nayem',
    this.email = 'nayem@gamil.com',
    this.profileImageUrl = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(
                    initialName: name,
                    initialEmail: email,
                    initialProfileImage: null,
                    onProfileUpdate: (String newName, String newEmail, File? newImage, String? newBio, String? newBirthday, String? newPhoneNumber, String? newLocation, String? newGender, String? newUsername, String? newPaymentMethod, String? newNationality, String? newEmergencyContact) {

                    },
                  ),
                ),
              );
            },
            child: UserAccountsDrawerHeader(
              accountName: Text(name),
              accountEmail: Text(email),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(profileImageUrl),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text('Order History'),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const HistoryScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.help_outline),
            title: const Text('Help & Support'),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const HelpScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.help_outline),
            title: const Text('About Us'),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const AboutUsScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Log Out'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SignInScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
