import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../utils/colors_data.dart';
import '../../widget/screen_background.dart';
import 'pin_code.dart';
import 'sign_in_screen.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(height:40 ,),
                const Text("Enter Your Email Adderess"),
                const Text("Enter 6 digit verification code"),
                const SizedBox(height: 5,),
                _buildEmailVarificationForm(),
                const SizedBox(height: 5,),
                _buildSignInScreen()
              ],
            ),
          )),
    );
  }

  Widget _buildSignInScreen() {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 5,),
          RichText(
              text: TextSpan(
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    letterSpacing: 0.5,
                  ),
                  text: "Have Account? ",
                  children: [
                    TextSpan(
                        style: const TextStyle(
                          color: AppColors.themeColor,
                        ),
                        recognizer:TapGestureRecognizer()..onTap = _onTapSignIn ,
                        text: "Sign In"),

                  ]))
        ],
      ),
    );
  }

  Widget _buildEmailVarificationForm() {
    return Column(
      children: [
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration:
          const InputDecoration(hintText: "Email", labelText: "Email"),
        ),
        const SizedBox(
          height: 5,
        ),
        ElevatedButton(
            onPressed: _onTapNextScreen,
            child: const Icon(Icons.arrow_circle_right_outlined)),
      ],
    );
  }

  void _onTapNextScreen() {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>
    const PinCodeScreen()
    ),);
  }

  void _onTapSignIn(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>
    const SignInScreen()
    ),);
  }
}
