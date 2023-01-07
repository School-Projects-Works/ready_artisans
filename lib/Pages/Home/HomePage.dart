import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:ready_artisans/Pages/Home/Components/MyJobs.dart';
import 'package:ready_artisans/Providers/NavigationProvider.dart';
import 'package:ready_artisans/generated/assets.dart';
import '../../Components/CustomDrawer.dart';
import '../../Providers/LocationProvider.dart';
import '../../Styles/AppColors.dart';
import 'Components/Home.dart';
import 'Components/MyOrders.dart';

enum FilterValue { all, online, city,region,district,distance }
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  AnimationController? _animationController;
  var breath=0.0;

@override
void dispose() {
    _animationController!.dispose();
    Hive.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);
    _animationController!.addListener(() {
      setState(() {
        breath = _animationController!.value;
      });
    });

  }



final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(75),
            child: Container(
              color: secondaryColor,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ListTile(
                  contentPadding:  EdgeInsets.zero,
                  leading:IconButton(
                    icon: const Icon(Icons.menu,color: Colors.black,),
                    onPressed: () {
                      if (_scaffoldKey.currentState!.isDrawerOpen) {
                        _scaffoldKey.currentState!.closeDrawer();
                      } else {
                        _scaffoldKey.currentState!.openDrawer();
                      }

                    },
                  ),
                  title: Image.asset(Assets.imagesLogoHT,height: 100-(15*breath), fit: BoxFit.fitHeight,),
                 trailing:IconButton(
                     onPressed: () {},
                     icon: const Icon(
                       Icons.notifications,
                       color: Colors.black,
                     )) ,

                ),
              ),
            ),
          ),
          body: Consumer<NavigationProvider>(
            builder: (context, nav, child) {
              return Scaffold(
                key: _scaffoldKey,
                drawer: const CustomDrawer(),
                body: IndexedStack(
                  index: nav.selectedIndex,
                  children:const [
                    Home(),
                    MyOrders(),
                    MyJobs()
                  ],
                ),
              );
            }
          ),
        );

  }
}
