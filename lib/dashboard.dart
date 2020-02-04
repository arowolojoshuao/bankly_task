import 'dart:io';

import 'package:bankly_task/WidgetsFormHelper/bookListItem.dart';
import 'package:bankly_task/main.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  static const routeName = '/dashboard';

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Future<bool> _onWillPop() {
    return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Are you sure?'),
            content: Text('Do you want to exit an App'),
            actions: <Widget>[
              FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('No'),
              ),
              FlatButton(
                onPressed: () => exit(0),
                /*Navigator.of(context).pop(true)*/
                child: Text('Yes'),
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(244, 243, 243, 1),
        appBar: AppBar(
          backgroundColor: Colors.white,
          brightness: Brightness.light,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black87,
            ),
            onPressed: () {
              print("back button clicked");
            },
          ),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.search,
                    size: 26.0,
                    color: Colors.black87,
                  ),
                )),
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.apps,
                    color: Colors.black87,
                  ),
                )),
          ],
        ),
        body: SafeArea(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildListDelegate([
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(30))),
                        padding: EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 10.0, bottom: 3.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Your',
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 25),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Bookshelf.',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            _cardBuild(),
                            SizedBox(
                              height: 10,
                            ),
                            _tabSection(context),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget promoCard(image) {
    return AspectRatio(
      aspectRatio: 2.62 / 3,
      child: Container(
        margin: EdgeInsets.only(right: 15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(fit: BoxFit.cover, image: AssetImage(image)),
        ),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(begin: Alignment.bottomRight, stops: [
                0.1,
                0.9
              ], colors: [
                Colors.black.withOpacity(.8),
                Colors.black.withOpacity(.1)
              ])),
        ),
      ),
    );
  }
}

Widget _cardBuild() {
  return Container(
    height: 120,
    margin: EdgeInsets.only(top: 0.0, right: 1.0, left: 1.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(12),
      ),
      gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [hexToColor("#29ced1"), hexToColor("#0bc0c2")],
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Study time today',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              Text(
                "",
              ),
            ],
          ),
          SizedBox(height: 4.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '02:56:56 minutes',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 15),
        ],
      ),
    ),
  );
}

Widget _searchWidget() {
  return Container(
    padding: EdgeInsets.all(5),
    decoration: BoxDecoration(
        color: Color.fromRGBO(244, 243, 243, 1),
        borderRadius: BorderRadius.circular(15)),
    child: TextField(
      decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black87,
          ),
          hintText: "Search you're looking for",
          hintStyle: TextStyle(color: Colors.grey, fontSize: 15)),
    ),
  );
}

Widget _tabSection(BuildContext context) {
  return DefaultTabController(
    length: 4,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          child: TabBar(
              labelColor: hexToColor("#0bc0c2"),
              indicatorWeight: 4.0,
              indicatorPadding: EdgeInsets.only(
                  left: 20.0, right: 7.0, top: 50.0, bottom: 10.0),
              indicatorColor: hexToColor("#0bc0c2"),
              labelPadding: EdgeInsets.only(
                  left: 20.0, right: 18.0, top: 10.0, bottom: 15.0),
              isScrollable: true,
              tabs: [
                Text("All",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 17,
                        fontWeight: FontWeight.bold)),
                Text("Fiction",
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontFamily: "Roboto",
                        fontSize: 17,
                        fontWeight: FontWeight.normal)),
                Text("Political",
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 17,
                        fontWeight: FontWeight.normal)),
                Text("Photo",
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 17,
                        fontWeight: FontWeight.normal)),
//                Text("Others",
//                    style: TextStyle(
//                        color: Colors.blueGrey,
//                        fontFamily: "Roboto",
//                        fontWeight: FontWeight.bold)),
              ]),
        ),
        Container(
          //Add this to give height
          height: MediaQuery.of(context).size.height,
          child: TabBarView(children: [
            // Text("Home 1"),
            ListView(
              padding: EdgeInsets.symmetric(horizontal: 1),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1),
                  child: buildBookListItem(context, buildFirstImage(),
                      "The Messy Middle", "Jane Austen"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1),
                  child: buildBookListItem(context, buildImage(),
                      "Holybird New Classic", "Jane Austen"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1),
                  child: buildBookListItem(context, buildFirstImage(),
                      "Holybird New Classic", "Jane Austen"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1),
                  child: buildBookListItem(
                      context, buildImage(), "The Messy Middle", "Jane Austen"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1),
                  child: buildBookListItem(context, buildFirstImage(),
                      "The Messy Middle", "Jane Austen"),
                ),
              ],
            ),
            ListView(
              padding: EdgeInsets.symmetric(horizontal: 1),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1),
                  child: buildBookListItem(
                      context, buildImage(), "The Messy Middle", "Jane Austen"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1),
                  child: buildBookListItem(context, buildFirstImage(),
                      "Holybird New Classic", "Jane Austen"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1),
                  child: buildBookListItem(
                      context, buildImage(), "The Messy Middle", "Jane Austen"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1),
                  child: buildBookListItem(context, buildFirstImage(),
                      "The Messy Middle", "Jane Austen"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1),
                  child: buildBookListItem(
                      context, buildImage(), "The Messy Middle", "Jane Austen"),
                ),
              ],
            ),
            ListView(
              padding: EdgeInsets.symmetric(horizontal: 1),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1),
                  child: buildBookListItem(context, buildFirstImage(),
                      "The Messy Middle", "Jane Austen"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1),
                  child: buildBookListItem(
                      context, buildImage(), "The Messy Middle", "Jane Austen"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1),
                  child: buildBookListItem(context, buildFirstImage(),
                      "The Messy Middle", "Jane Austen"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1),
                  child: buildBookListItem(
                      context, buildImage(), "The Messy Middle", "Jane Austen"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1),
                  child: buildBookListItem(context, buildFirstImage(),
                      "The Messy Middle", "Jane Austen"),
                ),
              ],
            ),
            ListView(
              padding: EdgeInsets.symmetric(horizontal: 1),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1),
                  child: buildBookListItem(
                      context, buildImage(), "The Messy Middle", "Jane Austen"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1),
                  child: buildBookListItem(context, buildImage(),
                      "Holybird New Classic", "Jane Austen"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1),
                  child: buildBookListItem(
                      context, buildImage(), "The Messy Middle", "Jane Austen"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1),
                  child: buildBookListItem(
                      context, buildImage(), "The Messy Middle", "Jane Austen"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1),
                  child: buildBookListItem(
                      context, buildImage(), "The Messy Middle", "Jane Austen"),
                ),
              ],
            ),
          ]),
        ),
      ],
    ),
  );
}
