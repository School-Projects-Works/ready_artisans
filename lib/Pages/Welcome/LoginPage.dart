import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ready_artisans/Components/SmartDialog.dart';
import 'package:ready_artisans/Components/TextInputs.dart';
import 'package:ready_artisans/Database/LocalDatabase.dart';
import 'package:ready_artisans/Providers/NavigationProvider.dart';
import 'package:ready_artisans/Providers/UserProvider.dart';
import 'package:ready_artisans/Styles/AppColors.dart';

import '../../Constants/strings.dart';
import '../../Database/FirebaseApi.dart';
import '../../Models/Users/Users.dart';
import '../../generated/assets.dart';
import '../Home/HomePage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Center(
        child: Card(
          elevation: 5,
          margin: const EdgeInsets.all(10),
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(Assets.imagesLogoSmallT,
                        width: 100, height: 100),
                    Text('LOGIN',
                        style: GoogleFonts.alfaSlabOne(
                            decoration: TextDecoration.underline,
                            fontSize: 30,
                            color: secondaryColor)),
                    const SizedBox(height: 15),
                    CustomTextFields(
                      label: 'Email',
                      prefixIcon: Icons.email,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty || !emailRegEx.hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomTextFields(
                      label: 'Password',
                      prefixIcon: Icons.lock,
                      obscureText: _obscureText,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: primaryColor,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty || value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: RichText(
                          text: TextSpan(
                            text: 'Forgot Password?',
                            style: GoogleFonts.nunito(
                              color: secondaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Provider.of<NavigationProvider>(context,
                                    listen: false)
                                    .setWelcomeIndex(2);
                              },
                          )),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () => login(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: secondaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 10),
                        textStyle: GoogleFonts.nunito(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      child: Text(
                        'Login',
                        style: GoogleFonts.nunito(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 15),
                    RichText(
                        text: TextSpan(
                          text: 'Don\'t have an account?',
                          style: GoogleFonts.nunito(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          children: [
                            TextSpan(
                              text: ' Sign Up',
                              style: GoogleFonts.nunito(
                                color: secondaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Provider.of<NavigationProvider>(context,
                                      listen: false)
                                      .setWelcomeIndex(1);
                                },
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  login() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      CustomDialog.showLoading(message: 'Logging in...Please wait');
      User? user = await FirebaseApi.signIn(email!, password!);
      if (user != null) {
        if (user.emailVerified) {
         Users? users=await  FirebaseApi.getUser(user.uid);
          if (users != null) {
            HiveApi().setUser(users);
            if(mounted){
              Provider.of<UserProvider>(context, listen: false)
                  .setUser(users);
            }
          }
          CustomDialog.dismiss();
          if (mounted) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()));
          }
        } else {
          CustomDialog.dismiss();
          CustomDialog.showInfo(
              message: 'Email is not verified.Please verify your email',
              buttonText: 'Resend Verification',
              onPressed: () async {
                user.sendEmailVerification();
                CustomDialog.dismiss();
                CustomDialog.showSuccess(message: 'Verification email sent');
              });
        }
      }
    }
  }
}