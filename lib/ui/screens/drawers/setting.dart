import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../bottom_navbar/bottom_nav_bar.dart';
import 'utils/app_setting.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final appSettings = Provider.of<AppSettings>(context);
    String _selectedTheme = appSettings.themeMode == ThemeMode.dark ? 'Dark' : 'System';
    bool isListView = appSettings.isListView;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MainNavBar(),
                ),
              );
            },
            child: const Text("Home"),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Theme Mode Setting
            ListTile(
              title: const Text('Theme Mode'),
              trailing: DropdownButton<String>(
                value: _selectedTheme,
                items: const [
                  DropdownMenuItem(value: 'System', child: Text('System')),
                  DropdownMenuItem(value: 'Dark', child: Text('Dark')),
                ],
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    if (newValue == 'Dark') {
                      appSettings.updateThemeMode(ThemeMode.dark);
                    } else {
                      appSettings.updateThemeMode(ThemeMode.system);
                    }
                    setState(() {
                      _selectedTheme = newValue;
                    });
                  }
                },
              ),
            ),

            ListTile(
              title: const Text('View Mode'),
              trailing: DropdownButton<String>(
                value: isListView ? 'List' : 'Grid',
                items: const [
                  DropdownMenuItem(value: 'List', child: Text('List')),
                  DropdownMenuItem(value: 'Grid', child: Text('Grid')),
                ],
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    appSettings.toggleViewMode();
                    setState(() {});
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
