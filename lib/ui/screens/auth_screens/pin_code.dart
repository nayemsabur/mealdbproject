import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../utils/colors_data.dart';
import '../../widget/screen_background.dart';
import 'reset_password.dart';
import 'sign_in_screen.dart';

class PinCodeScreen extends StatefulWidget {
  const PinCodeScreen({super.key});

  @override
  State<PinCodeScreen> createState() => _PinCodeScreenState();
}

class _PinCodeScreenState extends State<PinCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(height:40 ,),
                const Text("Enter 6 digit verification code",style: TextStyle(fontSize: 24),),
                const SizedBox(height: 24,),
                _buildEmailVarificationForm(),
                const SizedBox(height: 16,),
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
        PinCodeTextField(
          length: 6,
          obscureText: false,
          animationType: AnimationType.fade,
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(5),
            fieldHeight: 50,
            fieldWidth: 40,
            activeFillColor: Colors.white,
          ),
          animationDuration: const Duration(milliseconds: 300),
          appContext: context,
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
    const ReCreatePassword()
    ),);
  }

  void _onTapSignIn(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>
    const SignInScreen()
    ),);
  }
}
