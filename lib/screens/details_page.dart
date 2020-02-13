import 'package:bankly_task/components/description_text.dart';
import 'package:bankly_task/main.dart';
import 'package:bankly_task/models/book_entry.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class DetailsPage extends StatelessWidget {
  //DetailsPage({@required this.entry});
  final BookEntry entry;
  final String imgTag;
  final String titleTag;
  final String authorTag;

  DetailsPage({
    Key key,
    @required this.entry,
    @required this.imgTag,
    @required this.titleTag,
    @required this.authorTag,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: hexToColor("#0bc0c2"),
        brightness: Brightness.light,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: IconButton(
                  color: Colors.white,
                  onPressed: () {
                    Share.text(
                      "${entry.title} by ${entry.authors[0]}",
                      "Read/Download ${entry.title} from ${entry.imageLink}.",
                      "text/plain",
                    );
                  },
                  icon: Icon(
                    Feather.share,
                  ),
                ),
              )),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Container(
            height: 200,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Hero(
                  tag: imgTag,
                  child: CachedNetworkImage(
                    imageUrl: "${entry.imageLink}",
                    placeholder: (context, url) => Container(
                      height: 200,
                      width: 130,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    errorWidget: (context, url, error) => Icon(Feather.x),
                    fit: BoxFit.cover,
                    height: 200,
                    width: 130,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 5,
                      ),
                      Hero(
                        tag: titleTag,
                        child: Material(
                          type: MaterialType.transparency,
                          child: Text(
                            "${entry.title.replaceAll(r"\", "")}",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 3,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Hero(
                        tag: authorTag,
                        child: Material(
                          type: MaterialType.transparency,
                          child: Text(
                            "${entry.authors[0]}",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "Book Description",
            style: TextStyle(
              color: hexToColor("#0bc0c2"),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(
            color: Theme.of(context).textTheme.caption.color,
          ),
          SizedBox(
            height: 10,
          ),
          DescriptionTextWidget(
            text: "${entry.description}",
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "Reviews",
            style: TextStyle(
              color: hexToColor("#0bc0c2"),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(color: Theme.of(context).textTheme.caption.color),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
