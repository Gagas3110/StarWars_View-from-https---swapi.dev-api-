import 'package:flutter/material.dart';

class PlanetItem extends StatelessWidget {
  final double deviceHeight;
  final double deviceWidth;
  final String name;
  final String rotationPeriod;
  final String orbital;
  final String diameter;
  final String gravity;
  final String image;
  const PlanetItem({
    Key? key,
    required this.deviceHeight,
    required this.deviceWidth,
    required this.name,
    required this.rotationPeriod,
    required this.orbital,
    required this.diameter,
    required this.gravity,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: deviceWidth * 0.06),
      padding: EdgeInsets.only(
          top: deviceHeight * 0.01,
          left: deviceWidth * 0.03,
          right: deviceWidth * 0.03),
      height: deviceHeight * 0.55,
      width: deviceWidth * 0.6,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey, width: 4),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(0, 1),
            )
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: deviceHeight * 0.3,
              width: deviceWidth,
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  border: Border.all(color: Colors.grey, width: 4),
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: Offset(0, 1),
                    )
                  ]),
              child: Image.asset(
                image,
                fit: BoxFit.fill,
              )),
          Divider(
            height: deviceHeight * 0.03,
            thickness: 3,
          ),
          Center(
            child: Text(
              'Detail :',
              style: TextStyle(color: Colors.blue, fontStyle: FontStyle.italic),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Name',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: deviceWidth * 0.17,
                    ),
                    Text(
                      ': ' + name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Rotation Period',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: deviceWidth * 0.03,
                    ),
                    Text(
                      ': ' + rotationPeriod,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Orbital Period',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: deviceWidth * 0.06,
                    ),
                    Text(
                      ': ' + orbital,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Diameter',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: deviceWidth * 0.123,
                    ),
                    Text(
                      ': ' + diameter,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Gravity',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: deviceWidth * 0.15,
                    ),
                    Text(
                      ': ' + gravity,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
