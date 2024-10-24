import 'package:flutter/material.dart';

import 'report_problem.dart';

class HelpSupportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help & Support'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'How can we help you?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.question_answer),
              title: Text('FAQs'),
              onTap: () {
                // Navigate to FAQs screen or show FAQs here
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.contact_support),
              title: Text('Contact Support'),
              onTap: () {
                // Open email or call option to contact support
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.report_problem),
              title: Text('Report a Problem'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReportProblemScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
