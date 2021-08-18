import 'package:flutter/material.dart';
import 'package:realestate/utils/constants.dart';
import 'package:realestate/utils/customFunction.dart';
import 'package:realestate/utils/sample_data.dart' as data;
import 'package:realestate/utils/widget_function.dart';
import 'package:realestate/widgets/OptionButton.dart';
import 'package:realestate/widgets/border_box.dart';

class LandingScreen extends StatelessWidget {
  LandingScreen({Key? key}) : super(key: key);
  final houses = data.houses;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    final double padding = 25;
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);
    return Scaffold(
      body: SafeArea(
          child: Container(
              width: size.width,
              height: size.height,
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      addVerticalSpace(padding),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: padding),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BorderBox(
                              width: 50,
                              height: 50,
                              child: Icon(Icons.menu, color: COLOR_BLACK),
                            ),
                            BorderBox(
                              width: 50,
                              height: 50,
                              child: Icon(Icons.settings, color: COLOR_BLACK),
                            ),
                          ],
                        ),
                      ),
                      addVerticalSpace(padding),
                      Padding(
                        padding: sidePadding,
                        child: Text(
                          "City",
                          style: themeData.textTheme.bodyText2,
                        ),
                      ),
                      addVerticalSpace(10),
                      Padding(
                        padding: sidePadding,
                        child: Text(
                          "San Francisco",
                          style: themeData.textTheme.headline2,
                        ),
                      ),
                      Padding(
                        padding: sidePadding,
                        child: Divider(
                          height: padding,
                          color: COLOR_GREY,
                        ),
                      ),
                      addVerticalSpace(10),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            "<\$200,000",
                            "For Sale",
                            "3-4 beds",
                            ">1000 sqft"
                          ]
                              .map((filter) => ChoiceOptions(text: filter))
                              .toList(),
                        ),
                      ),
                      addVerticalSpace(10),
                      Expanded(
                        child: Padding(
                          padding: sidePadding,
                          child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              // itemCount: data.RE_DATA.length,
                              itemCount: houses.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                    onTap: () => Navigator.of(context)
                                        .pushNamed('/second',arguments: houses[index]),
                                    child: RealEstateItem(
                                        itemData: data.RE_DATA[index]));
                              }),
                        ),
                      )
                    ],
                  ),
                  Positioned(
                      bottom: 20,
                      width: size.width,
                      child: Center(
                        child: OptionButton(
                          icon: Icons.map_rounded,
                          text: "Map View",
                          width: size.width * 0.35,
                        ),
                      ))
                ],
              ))),
    );
  }
}

class ChoiceOptions extends StatelessWidget {
  final String text;

  const ChoiceOptions({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: COLOR_GREY.withAlpha(25),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      margin: EdgeInsets.only(left: 30),
      child: Text(
        text,
        style: themeData.textTheme.headline5,
      ),
    );
  }
}

class RealEstateItem extends StatelessWidget {
  final dynamic itemData;

  const RealEstateItem({Key? key, required this.itemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(itemData['image']),
              ),
              Positioned(
                top: 15,
                right: 15,
                child: BorderBox(
                  width: 50,
                  height: 50,
                  child: Icon(Icons.favorite_border, color: COLOR_BLACK),
                ),
              )
            ],
          ),
          addVerticalSpace(15),
          Row(
            children: [
              Text(
                "${formatCurrency(itemData["amount"])}",
                style: themeData.textTheme.headline1,
              ),
              addHorizontalSpace(10),
              Text(
                "${itemData['address']}",
                style: themeData.textTheme.bodyText2,
              )
            ],
          ),
          addVerticalSpace(10),
          Text(
              "${itemData['bedrooms']} bedrooms / ${itemData["bathrooms"]} bathrooms / ${itemData["area"]} sqft ",
              style: themeData.textTheme.headline5)
        ],
      ),
    );
  }
}
