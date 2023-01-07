import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:ready_artisans/Components/CustomDropDown.dart';
import 'package:ready_artisans/Components/SmartDialog.dart';
import 'package:ready_artisans/Database/FirebaseApi.dart';
import 'package:ready_artisans/Providers/NavigationProvider.dart';
import '../../Components/TextInputs.dart';
import '../../Constants/strings.dart';
import '../../Models/Users/Users.dart';
import '../../Styles/AppColors.dart';
import '../../generated/assets.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String? email;
  String? password;
  String? confirmPassword;
  String? name;
  String? phone;
  String? idCard;
  String? address;
  String? gender;
  File? image;
  bool policy = false;

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
          margin: const EdgeInsets.all(10),
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
                thirdPart(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  final _firstForm = GlobalKey<FormState>();
  final _secondForm = GlobalKey<FormState>();
  final _thirdForm = GlobalKey<FormState>();
  Widget firstPart() {
    return Container(
      color: Colors.white,
      child: Form(
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
                        if (password != confirmPassword) {
                          CustomDialog.showError(
                              message: 'Passwords do not match');
                        } else {
                          setState(() {
                            _currentIndex = 1;
                          });
                        }
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
          )),
    );
  }

  Widget secondPart() {
    return Container(
      color: Colors.white,
      child: Form(
        key: _secondForm,
        child: SingleChildScrollView(
          child: Column(children: [
            Image.asset(Assets.imagesLogoSmallT, width: 100, height: 100),
            Text('REGISTER',
                style: GoogleFonts.alfaSlabOne(
                    decoration: TextDecoration.underline,
                    fontSize: 30,
                    color: secondaryColor)),
            const SizedBox(height: 15),
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 50,
                backgroundColor: primaryColor.withOpacity(.4),
                child: ClipOval(
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: image != null
                        ? Image.file(
                            image!,
                            fit: BoxFit.fill,
                          )
                        : Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.camera_alt,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                  Text(
                                    'Select Profile Image',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.nunito(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            CustomTextFields(
              label: 'GH Card (eg. GHA-1234567-8)',
              prefixIcon: Icons.credit_card,
              keyboardType: TextInputType.text,
              isDigitOnly: false,
              isCapitalized: true,
              validator: (value) {
                if (value!.length < 15) {
                  return 'Please enter your Ghana Card Number';
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
            CustomDropDown(
                label: 'Select gender',
                value: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please Select your Gender';
                  } else {
                    return null;
                  }
                },
                items: [
                  DropdownMenuItem(
                      value: 'Male',
                      child: Text(
                        'Male',
                        style: GoogleFonts.nunito(color: Colors.black),
                      )),
                  DropdownMenuItem(
                      value: 'Female',
                      child: Text('Female',
                          style: GoogleFonts.nunito(color: Colors.black))),
                ],
                color: Colors.white),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: () {
                    setState(() {
                      _currentIndex = 0;
                    });
                  },
                  icon: const Icon(
                    FontAwesomeIcons.arrowLeft,
                    color: secondaryColor,
                  ),
                  label: Text('Back',
                      style: GoogleFonts.nunito(
                        color: secondaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                TextButton.icon(
                  onPressed: () {
                    if (_secondForm.currentState!.validate()) {
                      _secondForm.currentState!.save();

                      setState(() {
                        _currentIndex = 2;
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
      ),
    );
  }

  Widget thirdPart() {
    return Container(
      color:  Colors.white,
      child: Form(
        key: _thirdForm,
        child: SingleChildScrollView(
          child: Column(children: [
            Image.asset(Assets.imagesLogoSmallT, width: 100, height: 100),
            Text('REGISTER',
                style: GoogleFonts.alfaSlabOne(
                    decoration: TextDecoration.underline,
                    fontSize: 30,
                    color: secondaryColor)),
            const SizedBox(height: 15),
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
            CustomTextFields(
              label: 'Address',
              maxLines: 3,
              prefixIcon: Icons.location_on,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your address';
                }
                return null;
              },
              onSaved: (value) {
                setState(() {
                  address = value;
                });
              },
            ),
            const SizedBox(height: 20),
            CheckboxListTile(
              value: policy,
              checkColor: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(10)),
              onChanged: (val) {
                setState(() {
                  policy = val!;
                });
              },
              title: RichText(
                  text: TextSpan(
                text: 'I have read and agree to the ',
                style: GoogleFonts.nunito(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                children: [
                  TextSpan(
                    text: 'Terms and Conditions',
                    style: GoogleFonts.nunito(
                      color: secondaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        //todo open terms and conditions
                      },
                  ),
                ],
              )),
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: secondaryColor,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        _currentIndex = 1;
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
      ),
    );
  }

  void _pickImage() {
    var picker = ImagePicker();
    CustomDialog.showCustom(
        ui: Container(
      color: Colors.white,
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Select source of image',
              style: GoogleFonts.nunito(
                  fontSize: 20, fontWeight: FontWeight.bold)),
          const Divider(
            color: Colors.grey,
            thickness: 2,
          ),
          ListTile(
            onTap: () async {
              var pickedFile =
                  await picker.pickImage(source: ImageSource.camera);
              setState(() {
                image = File(pickedFile!.path);
                CustomDialog.dismiss();
              });
            },
            leading: const Icon(Icons.camera_alt),
            title: const Text('Camera'),
          ),
          ListTile(
            onTap: () async {
              var pickedFile =
                  await picker.pickImage(source: ImageSource.gallery);
              setState(() {
                image = File(pickedFile!.path);
                CustomDialog.dismiss();
              });
            },
            leading: const Icon(Icons.image),
            title: const Text('Gallery'),
          ),
          const Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          ListTile(
            onTap: () {
              CustomDialog.dismiss();
            },
            leading: const Icon(Icons.close),
            title: const Text('Cancel'),
          ),
        ],
      ),
    ));
  }

  register() async {
    if (_thirdForm.currentState!.validate()) {
      _thirdForm.currentState!.save();
      if (policy) {
        CustomDialog.showLoading(message: 'Registering... Please wait');
        if (!await FirebaseApi.userExists(idCard)) {
          User? user = await FirebaseApi.signUp(email!, password!);
          if (user != null) {
            user.sendEmailVerification();
            final id = user.uid;
            String profileUrl = '';
            if (image != null) {
              profileUrl = await FirebaseApi.uploadProfileImage(id, image!);
            }
            Users users = Users(
              id: id,
              name: name!,
              email: email!,
              phone: phone!,
              address: address!,
              profile: profileUrl,
              role: 'user',
              idCard: idCard,
              createdAt: DateTime
                  .now()
                  .toUtc()
                  .millisecondsSinceEpoch,
              status: 'active',
            );
            await FirebaseApi.saveUser(id, users.toJson());
            await FirebaseApi.signOut();
            CustomDialog.dismiss();
            CustomDialog.showSuccess(
                message:
                'Registration successful. Please check your email, ($email inbox/spam) for verification');
            _thirdForm.currentState!.reset();
            _firstForm.currentState!.reset();
            _secondForm.currentState!.reset();
            if (mounted) {
              Provider.of<NavigationProvider>(context, listen: false)
                  .setWelcomeIndex(0);
              setState(() {
                _currentIndex = 0;
                gender = null;
                image = null;
              });
            }
          }
        } else {
          CustomDialog.dismiss();
          CustomDialog.showError(
              message: 'User with this ID card already exists');
        }
      }else{
        CustomDialog.showError(message: 'Please agree to the terms and conditions');
      }
    }
  }
}
