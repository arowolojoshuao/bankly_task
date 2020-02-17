import 'package:bankly_task/components/bookItem.dart';
import 'package:bankly_task/main.dart';
import 'package:bankly_task/providers/api_provider.dart';
import 'package:bankly_task/walkthrough/utils/constants.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/dashboard';

  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  ScrollController sc;
  ApiProvider apiProvider;
  var subscription;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {});

    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      print(result.index); // 0=wifi, 1=mobile, 2=none
      if (result.index != 2) {
        // callItself();
      } else {
        connectionError();
      }
    });
  }

  @override
  dispose() {
    super.dispose();
    subscription.cancel();
  }

  connectionError() {
    showInSnackBar(Constants.NoInternet);
  }

  Future showInSnackBar(String value, {bool isGreeen = false}) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    _scaffoldKey.currentState.showSnackBar(
      new SnackBar(
        duration: Duration(seconds: 2),
        content: new Text(
          value,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: isGreeen ? Colors.green : Colors.red,
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new CircularProgressIndicator(),
      ),
    );
  }

  callItself() async {
    _createListView(apiProvider);
    await Future.delayed(Duration(hours: 1));
    callItself();
  }

  Widget _createListView(ApiProvider apiProvider) {
    sc = ScrollController();
    sc.addListener(() {
      if (sc.position.maxScrollExtent == sc.position.pixels) {
        if (apiProvider.isLoading == false) {
          apiProvider.getResults();
          // Perform event when user reach at the end of list (e.g. do Api call)
        }
      }
    });
    return ListView.separated(
      shrinkWrap: true,
      physics: AlwaysScrollableScrollPhysics(),
      controller: sc,
      itemCount: apiProvider.bookList.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if (index == apiProvider.bookList.length) {
          return ListTile(
            title: _buildProgressIndicator(),
          );
        } else {
          return BookItem(
            entry: apiProvider.bookList[index],
            index: index,
            pop: true,
          );
        }
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider();
      },
    );
  }

//  @override
//  void dispose() {
//    sc.dispose();
//    super.dispose();
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        key: _scaffoldKey,
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
        body: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(30))),
                  padding: EdgeInsets.only(
                      left: 20.0, right: 20.0, top: 10.0, bottom: 3.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Your',
                        style: TextStyle(color: Colors.black87, fontSize: 25),
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

                      // _searchWidget(),

                      SizedBox(
                        height: 10,
                      ),
                      _cardBuild(),
                      SizedBox(
                        height: 5,
                      ),
                      // _tabSection(context),

                      DefaultTabController(
                        length: 4,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              child: TabBar(
                                  labelColor: hexToColor("#0bc0c2"),
                                  indicatorWeight: 4.0,
                                  indicatorPadding: EdgeInsets.only(
                                      left: 20.0,
                                      right: 7.0,
                                      top: 50.0,
                                      bottom: 10.0),
                                  indicatorColor: hexToColor("#0bc0c2"),
                                  labelPadding: EdgeInsets.only(
                                      left: 20.0,
                                      right: 18.0,
                                      top: 10.0,
                                      bottom: 15.0),
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

                                Consumer<ApiProvider>(
                                  builder: (context, apiProvider, _) {
                                    return Container(
                                        child: apiProvider.bookList.isEmpty
                                            ? ListView.builder(
                                                itemCount: 30,
                                                itemBuilder: (context, index) {
                                                  return Shimmer.fromColors(
                                                    baseColor: Colors.grey[600],
                                                    highlightColor:
                                                        Colors.grey[400],
                                                    child: ListTile(
                                                      leading: Container(
                                                        height: 24.0,
                                                        width: 24.0,
                                                        color: Colors.red,
                                                      ),
                                                      title: Container(
                                                        height: 24.0,
                                                        width: 70.0,
                                                        color: Colors
                                                            .red, //Apparently shimmer doesnt work without specifying colour here
                                                      ),
                                                    ),
                                                  );
                                                })
                                            : _createListView(apiProvider));
                                  },
                                ),
                                Consumer<ApiProvider>(
                                  builder: (context, apiProvider, _) {
                                    return Container(
                                        child: apiProvider.bookList.isEmpty
                                            ? ListView.builder(
                                                itemCount: 30,
                                                itemBuilder: (context, index) {
                                                  return Shimmer.fromColors(
                                                    baseColor: Colors.grey[600],
                                                    highlightColor:
                                                        Colors.grey[400],
                                                    child: ListTile(
                                                      leading: Container(
                                                        height: 24.0,
                                                        width: 24.0,
                                                        color: Colors.red,
                                                      ),
                                                      title: Container(
                                                        height: 24.0,
                                                        width: 70.0,
                                                        color: Colors
                                                            .red, //Apparently shimmer doesnt work without specifying colour here
                                                      ),
                                                    ),
                                                  );
                                                })
                                            : _createListView(apiProvider));
                                  },
                                ),
                                Consumer<ApiProvider>(
                                  builder: (context, apiProvider, _) {
                                    return Container(
                                        child: apiProvider.bookList.isEmpty
                                            ? ListView.builder(
                                                itemCount: 30,
                                                itemBuilder: (context, index) {
                                                  return Shimmer.fromColors(
                                                    baseColor: Colors.grey[600],
                                                    highlightColor:
                                                        Colors.grey[400],
                                                    child: ListTile(
                                                      leading: Container(
                                                        height: 24.0,
                                                        width: 24.0,
                                                        color: Colors.red,
                                                      ),
                                                      title: Container(
                                                        height: 24.0,
                                                        width: 70.0,
                                                        color: Colors
                                                            .red, //Apparently shimmer doesnt work without specifying colour here
                                                      ),
                                                    ),
                                                  );
                                                })
                                            : _createListView(apiProvider));
                                  },
                                ),
                                Consumer<ApiProvider>(
                                  builder: (context, apiProvider, _) {
                                    return Container(
                                        child: apiProvider.bookList.isEmpty
                                            ? ListView.builder(
                                                itemCount: 30,
                                                itemBuilder: (context, index) {
                                                  return Shimmer.fromColors(
                                                    baseColor: Colors.grey[600],
                                                    highlightColor:
                                                        Colors.grey[400],
                                                    child: ListTile(
                                                      leading: Container(
                                                        height: 24.0,
                                                        width: 24.0,
                                                        color: Colors.red,
                                                      ),
                                                      title: Container(
                                                        height: 24.0,
                                                        width: 70.0,
                                                        color: Colors
                                                            .red, //Apparently shimmer doesnt work without specifying colour here
                                                      ),
                                                    ),
                                                  );
                                                })
                                            : _createListView(apiProvider));
                                  },
                                ),
                              ]),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ],
        ));
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
    height: 98,
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
                DateFormat.yMMMd().format(DateTime.now()),
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
