import 'package:Star_Wars/theme/colors.dart';
import 'package:Star_Wars/theme/padding.dart';
import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

class ShimmerItem extends StatelessWidget {
  final String? title;
  final String? releaseDate;
  final String? director;
  final String? producer;
  final String? image;
  final void Function()? viewItem;
  final Function(String)? handleMenuClick;
  final List<String>? openingCrawl;
  const ShimmerItem(
      {Key? key,
      this.director,
      this.handleMenuClick,
      this.openingCrawl,
      this.producer,
      this.releaseDate,
      this.title,
      this.image,
      this.viewItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Shimmer.fromColors(
      enabled: true,
      period: Duration(milliseconds: 10000),
      baseColor: Colors.grey[700]!.withOpacity(0.8),
      highlightColor: Colors.grey[100]!,
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        padding: JagoOutterPadding,
        width: deviceWidth,
        constraints: BoxConstraints(maxHeight: 350, minHeight: 260),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.black,
            border: Border.all(color: Colors.blueAccent, width: 3.0),
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
            Row(
              children: [
                Container(
                  width: 150,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.black,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: Offset(0, 1),
                      )
                    ],
                  ),
                  child: Image.asset(
                    image!,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(width: 30),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: 120,
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title!,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Colors.blueGrey,
                                  fontStyle: FontStyle.italic),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Release Date :',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(releaseDate!),
                            SizedBox(height: 5),
                            Text(
                              'Director :',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(director!),
                            SizedBox(height: 5),
                            Text('Producer :',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(producer!),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Text('Score :',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                SizedBox(width: 5),
                                Text('4.5/10')
                              ],
                            ),
                          ]),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      ListTileTheme(
                        contentPadding: EdgeInsets.all(0),
                        child: ExpansionTile(
                          title: Padding(
                            padding: EdgeInsets.zero,
                            child: Text(
                              'Opening Crawl',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          expandedCrossAxisAlignment: CrossAxisAlignment.start,
                          expandedAlignment: Alignment.centerLeft,
                          children: filmWidgetList(openingCrawl!),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<Widget> filmWidgetList(List<String> list) {
  List<Widget> dget = [];
  list.forEach((a) {
    dget.add(
      Padding(
        padding: const EdgeInsets.all(3.0),
        child: Text(
          a.trim(),
          textAlign: TextAlign.right,
          style: TextStyle(
            fontSize: 10.0,
            color: TrustPostPrimary,
          ),
        ),
      ),
    );
  });
  return dget;
}
