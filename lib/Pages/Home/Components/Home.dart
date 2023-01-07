import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ready_artisans/Components/TextInputs.dart';
import 'package:ready_artisans/Providers/LocationProvider.dart';
import '../../../Components/CustomDropDown.dart';
import '../../../Models/Category.dart';
import '../../../Styles/AppColors.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<String, dynamic>> getFilterList(UserLocation location) {
    return [
      {'name': 'All of ${location.city}', 'value': location.city},
      {'name': 'All of ${location.district}', 'value': location.district},
      {'name': 'All of ${location.region}', 'value': location.region},
      {'name': 'All of ${location.country}', 'value': location.country},
    ];
  }

  UserLocation? userLocation;
  String? filterValue; // this is the value of the selected filter
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var provider = Provider.of<LocationService>(context, listen: false);
      userLocation =
          provider.currentLocation != null ? provider.currentLocation! : null;
      if (userLocation != null) {
        filterValue = getFilterList(userLocation!).first['name'];
      }
    });
  }





  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<LocationService>(builder: (context, location, child) {
      return Container(
        width: size.width,
        height: size.height,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: size.width,
                decoration: const BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'What are you looking for?',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    if (userLocation != null)
                      CustomDropDown(
                        color: secondaryColor,
                        value: filterValue,
                        onChanged: (value) {
                          setState(() {
                            filterValue = value;
                          });
                        },
                        items: location.currentLocation != null
                            ? getFilterList(location.currentLocation!)
                                .map((e) => DropdownMenuItem(
                                    value: e['name'],
                                    child: Text(
                                      e['name'],
                                      style: GoogleFonts.nunito(
                                          color: Colors.black87,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    )))
                                .toList()
                            : [],
                      ),
                    const SizedBox(height: 10),
                    CustomTextFields(
                      isReadOnly: true,
                      onTap: () {
                        //todo navigate to search page
                      },
                      hintText: 'Search',
                      suffixIcon: const Icon(
                        Icons.search,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CarouselSlider(
                  options: CarouselOptions(
                      height: 130,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 10),
                      autoPlayAnimationDuration: const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: false,
                      scrollDirection: Axis.horizontal,
                    viewportFraction: 0.4,

                  ),
                  items: Categories.dummyData.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return InkWell(
                          onTap: () {
                            //todo go to category page
                          },
                          child: Container(
                            width: size.width * .4,
                            height: size.width * .3,
                            margin: const EdgeInsets.symmetric(horizontal: 2),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: primaryColor),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  width: size.width * .4,
                                  height: 90,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(i.image!),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  i.name!,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.nunito(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w800),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Available Artisans',
                style: GoogleFonts.poppins(
                  color: Colors.black87,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

            ],
          ),
        ),
      );
    });
  }
}
