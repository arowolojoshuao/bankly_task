import 'package:bankly_task/main.dart';
import 'package:bankly_task/models/book_entry.dart';
import 'package:bankly_task/screens/details_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:uuid/uuid.dart';

class BookItem extends StatelessWidget {
  static const String PLACEHOLDER = "assets/appicon.png";
  final bool pop;
  final int index;
  final BookEntry entry;

  BookItem({Key key, this.pop, this.index, @required this.entry})
      : super(key: key);

  static final uuid = Uuid();
  final String imgTag = uuid.v4();
  final String titleTag = uuid.v4();
  final String authorTag = uuid.v4();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      child: InkWell(
        onTap: () {
//          Fluttertoast.showToast(
//            msg: entry.title,
//            toastLength: Toast.LENGTH_SHORT,
//            timeInSecForIos: 1,
//          );

          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.rightToLeft,
              child: DetailsPage(
                entry: entry,
                imgTag: imgTag,
                titleTag: titleTag,
                authorTag: authorTag,
              ),
            ),
          );
        },
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
                  width: 80.0,
                  height: 140.0,

                  child: entry.imageLink == null
                      ? Image.asset(
                          PLACEHOLDER,
                          //fit: BoxFit.fitHeight,
                          fit: BoxFit.cover,
                        )
                      : Image.network(
                          entry.imageLink,
                          // fit: BoxFit.fitHeight,
                          fit: BoxFit.cover,
                        ),
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
                      constraints: BoxConstraints(maxWidth: 200),
                      child: Text(
                        (entry.title == null) ? " " : entry.title.toUpperCase(),
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Roboto",
                            color: Colors.black87),
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  _authorComponent(entry.authors),
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
      ),
    );
  }

  String _stringifyList(List<String> list) {
    String result = '';
    list.forEach((element) {
      if (result.length > 0) result += ', ';
      result += element;
    });
    return result.length > 0 ? result : "Anonymous";
  }

  Container _authorComponent(List<String> authors) {
    return Container(
      constraints: BoxConstraints(maxWidth: 200),
      child: Material(
        type: MaterialType.transparency,
        child: Text(
          'by ' + _stringifyList(authors),
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w800,
            color: Colors.grey[700],
          ),
        ),
      ),
    );
  }
}

//Container(
//constraints: BoxConstraints(maxWidth: 200),
//child: Text(
//(entry.authors[0] == null) ? " " : entry.authors[0],
//style: TextStyle(
//fontSize: 12,
//fontWeight: FontWeight.bold,
//fontFamily: "Roboto",
//color: Colors.black87),
//)),
//
