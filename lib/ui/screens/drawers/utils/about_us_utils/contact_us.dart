import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsScreen extends StatelessWidget {
  // Function to open the email app
  _sendEmail() async {
    final Uri emailUri = Uri(
        scheme: 'mailto',
        path: 'support@yourcompany.com',
        queryParameters: {
          'subject': 'App Support'
        }
    );
    if (await canLaunch(emailUri.toString())) {
      await launch(emailUri.toString());
    } else {
      print('Could not launch $emailUri');
    }
  }

  // Function to make a phone call
  _makePhoneCall() async {
    final Uri phoneUri = Uri(scheme: 'tel', path: '+1234567890');
    if (await canLaunch(phoneUri.toString())) {
      await launch(phoneUri.toString());
    } else {
      print('Could not make the call');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Contact Us',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'If you have any questions, feel free to reach out to us:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('support@yourcompany.com'),
              onTap: _sendEmail,
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('+123 456 7890'),
              onTap: _makePhoneCall,
            ),
          ],
        ),
      ),
    );
  }
}
