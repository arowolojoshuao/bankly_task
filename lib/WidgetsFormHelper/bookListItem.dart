import 'package:bankly_task/main.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

Widget buildBookListItem(
    BuildContext context, Widget image, String title, String subtitle) {
  return Container(
    height: 150,
    child: Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(3),
            ),
          ),
          elevation: 3,
          child: ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(3),
            ),
            child: Container(
              child: image,
//
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Transform(
                transform: Matrix4.identity()..scale(0.9),
                alignment: Alignment.bottomRight,
                child: Chip(
                  backgroundColor: Colors.grey[200],
                  labelPadding: EdgeInsets.symmetric(horizontal: 12),
                  label: Text(
                    'Fiction',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.pink,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Container(
                child: Material(
                  type: MaterialType.transparency,
                  child: Text(
                    "${title.replaceAll(r"\", "")}",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Roboto",
                        color: Colors.black87),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                child: Material(
                  type: MaterialType.transparency,
                  child: Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: Colors.grey[700],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              new LinearPercentIndicator(
                width: 140.0,
                lineHeight: 6.0,
                percent: 0.5,
                backgroundColor: Colors.grey[200],
                progressColor: hexToColor("#2dcc7a"),
                trailing: new Text(
                  "70%",
                  style: TextStyle(
                    fontSize: 13,
                    color: Theme.of(context).textTheme.caption.color,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget buildImage() {
  return Image.asset(
    "assets/images/one.jpg",
    fit: BoxFit.cover,
    height: 130,
    width: 100,
  );
}

Widget buildFirstImage() {
  return Image.asset(
    "assets/images/middlemessy.jpg",
    fit: BoxFit.cover,
    height: 130,
    width: 100,
  );
}
