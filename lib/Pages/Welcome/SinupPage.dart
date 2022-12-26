import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ready_artisans/Providers/NavigationProvider.dart';

import '../../Components/TextInputs.dart';
import '../../Constants/strings.dart';
import '../../Styles/AppColors.dart';
import '../../generated/assets.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? confirmPassword;
  String? name;
  String? phone;
  String? idCard;
  File? image;

  int _currentIndex = 0;
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Center(
        child: Card(
          elevation: 5,
          margin: const EdgeInsets.all(20),
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: IndexedStack(
              sizing: StackFit.passthrough,
              index: _currentIndex,
              children: [
                firstPart(),
                secondPart(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  final _firstForm = GlobalKey<FormState>();
  final _secondForm = GlobalKey<FormState>();
  Widget firstPart() {
    return Form(
        key: _firstForm,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(Assets.imagesLogoSmallT, width: 100, height: 100),
              Text('REGISTER',
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
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                      color: primaryColor),
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
              const SizedBox(height: 20),
              CustomTextFields(
                label: 'Confirm Password',
                prefixIcon: Icons.lock,
                obscureText: _obscureText,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                      color: primaryColor),
                ),
                validator: (value) {
                  if (value!.isEmpty || value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
                onSaved: (value) {
                  setState(() {
                    confirmPassword = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton.icon(
                  onPressed: () {
                    if (_firstForm.currentState!.validate()) {
                      _firstForm.currentState!.save();
                      setState(() {
                        _currentIndex = 1;
                      });
                    }
                  },
                  icon: const Icon(
                    FontAwesomeIcons.arrowRight,
                    color: secondaryColor,
                  ),
                  label: Text('Continue',
                      style: GoogleFonts.nunito(
                        color: secondaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
              const SizedBox(height: 20),
              RichText(
                  text: TextSpan(
                text: 'Already have an account?',
                style: GoogleFonts.nunito(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                children: [
                  TextSpan(
                    text: ' Login',
                    style: GoogleFonts.nunito(
                      color: secondaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Provider.of<NavigationProvider>(context, listen: false)
                            .setWelcomeIndex(0);
                      },
                  ),
                ],
              )),
            ],
          ),
        ));
  }

  Widget secondPart() {
    return Form(
      key: _secondForm,
      child: SingleChildScrollView(
        child: Column(children: [
          Image.asset(Assets.imagesLogoSmallT, width: 100, height: 100),
          Text('REGISTER',
              style: GoogleFonts.alfaSlabOne(
                  decoration: TextDecoration.underline,
                  fontSize: 45,
                  color: secondaryColor)),
          const SizedBox(height: 15),
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.white,
            child: ClipOval(
              child: SizedBox(
                width: 100,
                height: 100,
                child: image != null
                    ? Image.file(
                        image!,
                        fit: BoxFit.fill,
                      )
                    : Text(
                        'Select Profile Image',
                        style: GoogleFonts.nunito(
                            color: Colors.grey,
                            fontSize: 13,
                            fontWeight: FontWeight.w600),
                      ),
              ),
            ),
          ),
          CustomTextFields(
            label: 'ID Card',
            prefixIcon: Icons.credit_card,
            keyboardType: TextInputType.number,
            isDigitOnly: true,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your ID Card';
              }
              return null;
            },
            onSaved: (value) {
              setState(() {
                idCard = value;
              });
            },
          ),
          const SizedBox(height: 20),
          CustomTextFields(
            label: 'FullName',
            prefixIcon: Icons.person,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
            onSaved: (value) {
              setState(() {
                name = value;
              });
            },
          ),
          const SizedBox(height: 20),
          CustomTextFields(
            label: 'Phone',
            prefixIcon: Icons.phone,
            keyboardType: TextInputType.phone,
            isDigitOnly: true,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your phone number';
              }
              return null;
            },
            onSaved: (value) {
              setState(() {
                phone = value;
              });
            },
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      _currentIndex = 0;
                    });
                  },
                  icon: const Icon(
                    FontAwesomeIcons.arrowLeft,
                    color: Colors.black,
                  )),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => register(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: secondaryColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 10),
                    textStyle: GoogleFonts.nunito(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  child: Text(
                    'Register',
                    style: GoogleFonts.nunito(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          RichText(
              text: TextSpan(
            text: 'Already have an account?',
            style: GoogleFonts.nunito(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            children: [
              TextSpan(
                text: ' Login',
                style: GoogleFonts.nunito(
                  color: secondaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Provider.of<NavigationProvider>(context, listen: false)
                        .setWelcomeIndex(0);
                  },
              ),
            ],
          )),
        ]),
      ),
    );
  }

  register() {}
}
