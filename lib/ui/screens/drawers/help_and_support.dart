import 'package:flutter/material.dart';

import '../bottom_navbar/bottom_nav_bar.dart';
import 'utils/help_support_utils/help_support_request.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

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
          title: const Text('Help & Support')),
      body: Column(
        children: [
          Column(
            children: [
              Text("For any help or support"),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>
                    HelpSupportScreen()
                ),);
              }, child: Text("Help and support"))
            ],
          ),
          Column(
            children: [
              Text("Have any problem ?"),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>
                    HelpSupportScreen()
                ),);
              }, child: Text("Report a problem"))
            ],
          ),
        ],
      ),
    );
  }
}
