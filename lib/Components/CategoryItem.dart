import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Models/Services/ServicesProvider.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {Key? key, this.data, this.categoryName, this.categoryImage})
      : super(key: key);
  final List<ServicesProvider>? data;
  final String? categoryName;
  final String? categoryImage;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.2,
      width: size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(
                    image: AssetImage(categoryImage!),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                categoryName!,
                style: GoogleFonts.nunito(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  //todo: navigate to category page
                },
                child: Text(
                  'View All',
                  style: GoogleFonts.nunito(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 50,
                width: size.width*0.4,
                color: Colors.grey,

              );
            },
            itemCount: data!.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
          ),
        ],
      ),
    );
  }
}
