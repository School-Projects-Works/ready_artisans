import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ready_artisans/Components/CustomDropDown.dart';
import 'package:ready_artisans/Components/TextInputs.dart';

import '../../Models/Category.dart';
import '../../Providers/NavigationProvider.dart';
import '../../Styles/AppColors.dart';

class ServiceDetails extends StatefulWidget {
  const ServiceDetails({Key? key}) : super(key: key);

  @override
  State<ServiceDetails> createState() => _ServiceDetailsState();
}

class _ServiceDetailsState extends State<ServiceDetails> {
  String? selectedService;
  String? title;
  String? description;
  String? tags;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      width: size.width,
      height: size.height,
      child: Column(
        children: [
          SizedBox(
            width: size.width,
            height: size.height -152,
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      width: size.width,
                      padding: const EdgeInsets.all(20),
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Text('Services Details',
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600)),
                          const SizedBox(height: 10),
                          Text(
                              'Please provide the details of the services you offer. This will help us match you with the right customers.',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    ListTile(
                      title: Text('Which of these services do you offer?',
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                      subtitle: CustomDropDown(
                        color: Colors.white,
                        value: selectedService,
                        onSaved: (value) {
                          setState(() {
                            selectedService = value;
                          });
                        },
                        items: Categories.dummyData
                            .map((e) => DropdownMenuItem(
                                  value: e.name,
                                  child: Text(e.name!, style: GoogleFonts.poppins()),
                                ))
                            .toList(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ListTile(
                      title: Text('Provide specific title for your service',
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                      subtitle: CustomTextFields(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please provide a title';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          setState(() {
                            title = value;
                          });
                        },
                        label: 'E.g. Plumber',
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
          Container(
            width: size.width,
            height: 40,
            margin: const EdgeInsets.all(10),
            color: Colors.white,
            alignment: Alignment.bottomRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                    onPressed: () {
                     if(mounted){
                       Provider.of<NavigationProvider>(context, listen: false).setNewIndex(0);
                     }
                    },
                    icon: const Icon(FontAwesomeIcons.arrowLeft,
                        color: secondaryColor),
                    label: Text(
                      'Previous',
                      style: GoogleFonts.nunito(
                          fontSize: 18,
                          color: secondaryColor,
                          fontWeight: FontWeight.bold),
                    )),

                TextButton.icon(
                    onPressed: checkAndContinue,
                    icon: const Icon(FontAwesomeIcons.arrowRight,
                        color: secondaryColor),
                    label: Text(
                      'Continue',
                      style: GoogleFonts.nunito(
                          fontSize: 18,
                          color: secondaryColor,
                          fontWeight: FontWeight.bold),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void checkAndContinue() {
  }
}
