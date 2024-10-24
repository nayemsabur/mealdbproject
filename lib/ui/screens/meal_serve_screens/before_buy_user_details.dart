import 'package:flutter/material.dart';
import 'package:mealdbproject/ui/screens/bottom_navbar/bottom_nav_bar.dart';

class BeforeBuyUserDetails extends StatefulWidget {
  const BeforeBuyUserDetails({super.key});

  @override
  State<BeforeBuyUserDetails> createState() => _BeforeBuyUserDetailsState();
}
TextEditingController _firstNameTEController = TextEditingController();
TextEditingController _lastNameTEController = TextEditingController();
TextEditingController _emailTEController = TextEditingController();
TextEditingController _countryTEController = TextEditingController();
TextEditingController _cityTEController = TextEditingController();
TextEditingController _postTEController = TextEditingController();
TextEditingController _streetTEController = TextEditingController();
TextEditingController _mobileTEController = TextEditingController();
GlobalKey<FormState> _fromkey = GlobalKey<FormState>();

class _BeforeBuyUserDetailsState extends State<BeforeBuyUserDetails> {

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          key: _fromkey,
          child: Column(
            children: [
              TextFormField(
                controller: _emailTEController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Enter Your Email",
                  labelText: "Email",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
              const SizedBox(height: 5,),
              TextFormField(
                controller: _mobileTEController,
                obscureText: true,
                decoration:
                const InputDecoration(hintText: "Mobile",
                  labelText: "Mobile",
                ),),
              const SizedBox(height: 5,),
              TextFormField(
                controller: _firstNameTEController,
                obscureText: true,
                decoration:
                const InputDecoration(hintText: "First Name",
                  labelText: "First Name",
                ),),
              const SizedBox(height: 5,),
              TextFormField(
                controller: _lastNameTEController,
                obscureText: true,
                decoration:
                const InputDecoration(hintText: "Last Name",
                  labelText: "Last Name",
                ),),
              const SizedBox(height: 5,),
              TextFormField(
                controller: _countryTEController,
                obscureText: true,
                decoration:
                const InputDecoration(hintText: "Country",
                  labelText: "Country",
                ),),
              const SizedBox(height: 5,),
              TextFormField(
                controller: _cityTEController,
                obscureText: true,
                decoration:
                const InputDecoration(hintText: "City",
                  labelText: "City",
                ),),
              const SizedBox(height: 5,),
              TextFormField(
                controller: _postTEController,
                obscureText: true,
                decoration:
                const InputDecoration(hintText: "Post Code",
                  labelText: "Post Code",
                ),),
              const SizedBox(height: 5,),
              TextFormField(
                controller: _streetTEController,
                obscureText: true,
                decoration:
                const InputDecoration(hintText: "Street",
                  labelText: "Street",
                ),),
            AlertDialog(
               actions: [
                 Column(
                   children: [
                     Text(""),
                     Row(
                       children: [
                         TextButton(onPressed: (){
                           Navigator.pop(context);
                           _showSnackBar(context, 'Purchase Successful ');
                         }, child: const Text("Cancel")),
                         TextButton(onPressed: (){
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>
                           MainNavBar()
                           ),);
                         }, child: const Text("Confirm")),
                       ],
                     ),
                   ],
                 )
               ],
             )
            ],
          ),
        ),
      ),
    );
  }
}
