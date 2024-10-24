import 'package:flutter/material.dart';
import 'package:mealdbproject/ui/screens/bottom_navbar/home_screen.dart';

import '../bottom_navbar/bottom_nav_bar.dart';
import 'utils/about_us_utils/app_version.dart';
import 'utils/about_us_utils/contact_us.dart';
import 'utils/about_us_utils/licence.dart';
import 'utils/about_us_utils/term_of_service.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
                MainNavBar()
            ),);
          }, child: Text("Home"))
        ],
        title: const Text('About Us'),
      ),
      body:  Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>
                  LicenseScreen()
              ));
            }, child: Text("Licence")),
            SizedBox(height: 20),
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>
                  TermsConditionsScreen()
              ));
            }, child: Text("Term and condition")),
            SizedBox(height: 20),
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>
                  ContactUsScreen()
              ));
            }, child: Text("contact us")),
            SizedBox(height: 20),
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>
                  AppVersionScreen()
              ));
            }, child: Text("App version")),
            SizedBox(height: 20),

          ],
        ),
      ),
    );
  }
}
