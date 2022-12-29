import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ready_artisans/Components/CustomDropDown.dart';
import 'package:ready_artisans/Components/TextInputs.dart';
import '../../Providers/LocationProvider.dart';
import '../../Styles/AppColors.dart';

enum FilterValue { all, online, city,region,district,distance }
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var provider=Provider.of<LocationService>(context, listen: false);
      userLocation=provider.currentLocation!;
    });
  }
  UserLocation? userLocation;
  List<String>filter=[
    'Near Me',
    'Within my city',
    'Within my District',
    'Within my Region',
    'All of Ghana',
  ];

  String getAttached(String? value){
    if(value=="Near Me")return 'street';
   if(value=="Within my city")return 'city';
    if(value=="Within my District")return 'district';
    if(value=="Within my Region")return 'region';
    if(value=="All of Ghana")return 'country';
    return '';
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<LocationService>(
      builder: (context, loc, child) {
        return Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: 200.0,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      title: Column(
                        children: [
                         Text('What are you looking for?',
                             style: GoogleFonts.nunito(
                               color: Colors.white,
                               fontSize: 16.0,
                               fontWeight: FontWeight.w600,
                             )),
                          const SizedBox(height: 5),
                          Row(children:  [
                            CustomDropDown(
                             value: loc.getFilter,
                               onChanged: (value) {
                                 loc.setFilter(value);
                               },
                               items: filter.map((e) => DropdownMenuItem(
                                   child: Text(
                                      '$e (${getAttached(e)})',
                                      style: GoogleFonts.nunito(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                      ),

                                   ))).toList(), color: Colors.white),
                            Expanded(
                              child: InkWell(
                                onTap: (){
                                  //todo open search page
                                },
                                child: const CustomTextFields(
                                  hintText: 'Search',
                                  color: Colors.white,

                                  suffixIcon: Icon(Icons.search),
                                ),
                              ),
                            ),
                          ],)
                        ],
                      ),
                      background: Container(
                        color: secondaryColor,
                      )),
                ),
              ];
            },
            body: Center(
              child: Text("Sample Text"),
            ),
          ),
        );
      }
    );
  }
}
