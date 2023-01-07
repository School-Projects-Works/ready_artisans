import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ready_artisans/Components/SmartDialog.dart';
import 'package:ready_artisans/Providers/NavigationProvider.dart';

import '../../Styles/AppColors.dart';
import '../../generated/assets.dart';

class ImagesSection extends StatefulWidget {
  const ImagesSection({Key? key}) : super(key: key);

  @override
  State<ImagesSection> createState() => _ImagesSectionState();
}

class _ImagesSectionState extends State<ImagesSection> {
  File? idBack, idFront, profileImage;
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
                        Text('ID & Image',
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w600)),
                        const SizedBox(height: 10),
                        Text(
                            'Upload a clear front and back image of your Ghana Card as well as a clear image of yourself for verification.Please Note that your Ghana Card Number should match the Card Number used during account creation.',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: size.width,
                    height: 200,
                    margin: const EdgeInsets.all(10),
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(20),
                        image: idFront != null
                            ? DecorationImage(
                                image: FileImage(idFront!),
                                fit: BoxFit.cover,
                              )
                            : const DecorationImage(
                                image: AssetImage(Assets.imagesPlaceholder),
                                fit: BoxFit.cover)),
                    child: TextButton.icon(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.grey,
                      ),
                      onPressed: () {},
                      icon: const Icon(
                        FontAwesomeIcons.camera,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Upload ID Front',
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Container(
                    width: size.width,
                    height: 200,
                    margin: const EdgeInsets.all(10),
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(20),
                        image: idFront != null
                            ? DecorationImage(
                          image: FileImage(idFront!),
                          fit: BoxFit.cover,
                        )
                            : const DecorationImage(
                            image: AssetImage(Assets.imagesPlaceholder),
                            fit: BoxFit.cover)),
                    child: TextButton.icon(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.grey,
                      ),
                      onPressed: () {},
                      icon: const Icon(
                        FontAwesomeIcons.camera,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Upload ID Back',
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Container(
                    width: size.width*.7,
                    height: size.width*.7,
                    margin: const EdgeInsets.all(10),
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(20),
                        image: idFront != null
                            ? DecorationImage(
                          image: FileImage(idFront!),
                          fit: BoxFit.cover,
                        )
                            : const DecorationImage(
                            image: AssetImage(Assets.imagesPlaceholder),
                            fit: BoxFit.cover)),
                    child: TextButton.icon(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.grey,
                      ),
                      onPressed: () {},
                      icon: const Icon(
                        FontAwesomeIcons.camera,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Upload Your Image',
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: size.width,
            height: 40,
            margin: const EdgeInsets.all(10),
            color: Colors.white,
            alignment: Alignment.bottomRight,
            child: TextButton.icon(
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
          ),
        ],
      ),
    );
  }

  void checkAndContinue()async {
    if(idFront == null || idBack == null || profileImage == null){
      CustomDialog.showError(message: 'One or more images have not been uploaded..Please upload all images', );
    }else{
     if(mounted){
       Provider.of<NavigationProvider>(context, listen: false).setNewIndex(1);
     }
    }
  }
}
