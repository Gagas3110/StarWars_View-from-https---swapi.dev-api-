import 'package:Star_Wars/helper/constant.dart';
import 'package:Star_Wars/helper/locator.dart';
import 'package:Star_Wars/helper/navigator_service.dart';
import 'package:Star_Wars/model/new_model/film_model.dart';
import 'package:Star_Wars/theme/padding.dart';
import 'package:flutter/material.dart';


class FilmItem extends StatelessWidget {
  final String? title;
  final String? releaseDate;
  final String? director;
  final String? producer;
  final Film? res;
  final double? deviceHeight;
  final double? deviceWidth;
  final String? image;
  final void Function()? viewItem;
  final Function(String)? handleMenuClick;
  final Function(String)? onTap;
  final List<String>? openingCrawl;
  const FilmItem(
      {Key? key,
      this.director,
      this.handleMenuClick,
      this.openingCrawl,
      this.producer,
      this.releaseDate,
      this.title,
      this.image,
      this.onTap,
      this.res,
      this.deviceHeight,
      this.deviceWidth,
      this.viewItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: JagoOutterPadding,
      width: deviceWidth,
      constraints: BoxConstraints(
          maxHeight: deviceHeight! * 0.46, minHeight: deviceHeight! * 0.33),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey, width: 4),
          color: Colors.grey.shade100,
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
              GestureDetector(
                  child: Container(
                    width: deviceWidth * 0.37,
                    height: deviceHeight! * 0.33,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.white,
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
                  onTap: () {
                    locator<NavigatorService>()
                        .navigateToWithArgmnt(Constant.MENU_FILM_DETAIL, res);
                  }),
              SizedBox(width: deviceWidth * 0.073),
              Expanded(
                flex: 1,
                child: Container(
                  width: deviceWidth * 0.3,
                  height: deviceHeight! * 0.325,
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
                          SizedBox(height: deviceHeight! * 0.01),
                          Text(
                            'Release Date :',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(releaseDate!),
                          SizedBox(height: deviceHeight! * 0.01),
                          Text(
                            'Director :',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(director!),
                          SizedBox(height: deviceHeight! * 0.01),
                          Text('Producer :',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(producer!),
                          SizedBox(height: deviceHeight! * 0.01),
                          Row(
                            children: [
                              Text('Score :',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(width: deviceHeight! * 0.01),
                              Text('4.5/10')
                            ],
                          ),
                        ]),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: deviceHeight! * 0.02),
          Text(
            'Click Photo For More Detail !',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
