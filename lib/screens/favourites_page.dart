//import 'package:flutter/material.dart';
//import 'package:flutter_sieslibrary/components/BookListItem.dart';
//import 'package:flutter_sieslibrary/database/favourites_dao.dart';
//import 'package:flutter_sieslibrary/database/favourites_db.dart';
//import 'package:flutter_sieslibrary/models/book.dart';
//import 'package:provider/provider.dart';
//
//class FavouritesPage extends StatefulWidget {
//  FavouritesPage({Key key}) : super(key: key);
//  @override
//  _FavouritesPageState createState() => _FavouritesPageState();
//}
//
//class _FavouritesPageState extends State<FavouritesPage> {
//  @override
//  Widget build(BuildContext context) {
//    FavouritesDao favouritesDao = Provider.of<FavouritesDao>(context);
//    return StreamBuilder<List<Favourite>>(
//      stream: Provider.of<FavouritesDao>(context).watchAllFav(),
//      builder: (BuildContext context, AsyncSnapshot<List<Favourite>> snapshot) {
//        if (snapshot.hasData && snapshot.data.isEmpty) {
//          return Center(
//            child: Text('Add some books to favourites to view them offline!'),
//          );
//        }
//
//        if (snapshot.hasData) {
//          return ListView.builder(
//            itemCount: snapshot.data.length,
//            itemBuilder: (BuildContext context, int index) {
//              Favourite item = snapshot.data[index];
//              return Dismissible(
//                key: Key(item.toString()),
//                background: Container(color: Colors.redAccent),
//                onDismissed: (direction) {
//                  favouritesDao.deleteFav(Results.fromJsonDB(item.toJson()));
//                },
//                child: BookListItem(
//                  favourite: item,
//                  index: index,
//                  pop: false,
//                ),
//              );
//            },
//          );
//        }
//        if (snapshot.hasError) {
//          return (Center(
//            child: Text('Some error has occured \n ${snapshot.error}'),
//          ));
//        }
//
//        return Center(
//          child: Container(),
//        );
//      },
//    );
//  }
//
//  @override
//  void initState() {
//    super.initState();
//  }
//}
