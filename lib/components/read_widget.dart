import 'package:bankly_task/screens/read_web_view.dart';
import 'package:bankly_task/util/util_methods.dart';
import 'package:flutter/material.dart';

class ReadWidget extends StatelessWidget {
  final String volumeId;
  final bool availability;
  final String previewLink;

  ReadWidget({this.volumeId, this.previewLink, this.availability});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        //Read or Preview button
        FlatButton(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: Text('Read'),
              ),
            ),
            onPressed: availability
                ? () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ReadWebView(
                        volumeId: volumeId,
                      );
                    }));
                  }
                : null),
        IconButton(
          icon: Icon(
            Icons.open_in_new,
          ),
          onPressed: previewLink.isNotEmpty && previewLink != null
              ? () async {
                  UtilMethods.launchURL(previewLink);
                }
              : null,
        )
      ],
    );
  }
}
