import 'dart:async';
import 'dart:io';

import 'package:bankly_task/models/user.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper; //Singleton Database
  static Database _database; //Singleton Database
  // creating the user table fields
  String userTable = 'user_table';
  String colId = 'id';
  String colFirstName = 'firstname';
  String colLastName = 'lastname';
  String colPhoneNumber = 'phonenumber';
  String colEmail = 'email';
  String colPassword = 'password';

  //String get date => _date;

  DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper
          ._createInstance(); // this is executed only once, singleton object
    }
    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    //Get the directory path for both android and IOS to store database
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'banklytask.db';
    //open/create the database at a given path
    var usersDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return usersDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE  $userTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colFirstName TEXT,$colLastName TEXT, $colPhoneNumber TEXT, $colEmail TEXT UNIQUE, '
        '$colPassword TEXT)');
  }

  // Fetch Operation: Get al note objects from database
  Future<List<Map<String, dynamic>>> getUserMapList() async {
    Database db = await this.database;
    // var result = await db.rawQuery('SELECT * FROM $userTable order by $colDate ASC');
    var result = await db.query(userTable, orderBy: '$colId ASC');
    return result;
  }

  // Insert Operation: Insert a User object to database
  Future<int> insertUser(User user) async {
    Database db = await this.database;
    var result = await db.insert(userTable, user.toMap());
    return result;
  }

  // Update Operation: Update a User object and save it to database
  Future<int> updateUser(User user) async {
    Database db = await this.database;
    var result = await db.update(userTable, user.toMap(),
        where: '$colId = ?', whereArgs: [user.id]);
    return result;
  }

  // Delete operation: Delete a user object from the database
  Future<int> deleteUser(int id) async {
    Database db = await this.database;
    int result =
        await db.rawDelete('DELETE FROM $userTable WHERE $colId = $id');
    return result;
  }

  // Get the number of users objects in the database
  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) from $userTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  Future<int> getEmailCount(String userEmail) async {
    Database db = await this.database;
    List<Map<String, dynamic>> x = await db.rawQuery(
        "SELECT COUNT (*) from $userTable WHERE $colEmail ='$userEmail'");
    int result = Sqflite.firstIntValue(x);
    return result;
  }

//  Future<Category> getCategoryCount(String catName) async
//  {
//    Database db = await this.database;
//   var  x = await db.rawQuery("SELECT * from cat_table WHERE cat_name ='$catName'");
//   // int result = Sqflite.firstIntValue(x);
//   // int result = x.length;
//
//  }

  Future<int> getEmailAndPasswordCount(
      String userEmail, String password) async {
    Database db = await this.database;
    List<Map<String, dynamic>> x = await db.rawQuery(
        "SELECT COUNT (*) from $userTable WHERE $colEmail ='$userEmail' And $colPassword = '$password'");
    int result = Sqflite.firstIntValue(x);
    print(result);
    return result;
  }

  Future<User> loginEmailAndPassword(String userEmail, String password) async {
    Database db = await this.database;

    var result = await db.rawQuery(
        "SELECT * FROM user_table WHERE email = '$userEmail' and password = '$password'");
    if (result.length == 0) return null;
    return User.fromMapObject(result.first);
  }

  Future<List<User>> getUserList() async {
    var userMapList = await getUserMapList();
    int count = userMapList.length;
    List<User> userList = List<User>();
    // For loop to create a 'User list' from a 'Map List'
    for (int i = 0; i < count; i++) {
      userList.add(User.fromMapObject(userMapList[i]));
    }
    return userList;
  }

  Future close() async {
    var dbClient = await this.database;
    return dbClient.close();
  }
}
