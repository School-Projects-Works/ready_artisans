import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ready_artisans/Providers/NavigationProvider.dart';
import 'package:ready_artisans/Styles/AppColors.dart';

import '../../generated/assets.dart';
import 'ImagesSection.dart';
import 'ServiceDetails.dart';

class NewArtisanPage extends StatelessWidget {
  const NewArtisanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Consumer<NavigationProvider>(
      builder: (context, nav, child) {
        return Scaffold(
        appBar: AppBar(
          backgroundColor: secondaryColor,
          elevation: 0,
          title: Image.asset(Assets.imagesLogoHT,height: 100, fit: BoxFit.fitHeight,),
        ),
          body: IndexedStack(
            index: nav.newIndex,
            children: const [
              ImagesSection(),
              ServiceDetails()
            ],
          ),
        );
      }
    );
  }
}
