import 'package:finance_app/core/model/user_data.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class UserDatabaseManager {
  static UserDatabaseManager?
      _userDatabaseManager; //Singleton object of the class
  static Database? _database;
  String userTable = 'userTable';
  String userFirstName = 'firstName';
  String userLastName = 'lastName';
  String userId = 'id';

  UserDatabaseManager._createInstance();
  factory UserDatabaseManager() {
    //initializing the object
    _userDatabaseManager ??= UserDatabaseManager._createInstance();
    return _userDatabaseManager!;
  }
  // Getter for our database
  Future<Database> get database async {
    _database ??= await initializeDatabase();
    return _database!;
  }

  // Function to initialize the database
  Future<Database> initializeDatabase() async {
    // Getting a location using getDatabasesPath
    var databasePath = await getDatabasesPath();
    String path = "${databasePath}fdapp_database.db";
    // Open or create database at a given path.
    var userDatabase =
        await openDatabase(path, version: 1, onCreate: _createTable);
    debugPrint("Database Created");
    return userDatabase;
  }

  // Function for creating a Table
  void _createTable(Database db, int version) async {
    if (_database == null) {
      await db.execute(
          'CREATE TABLE $userTable ($userFirstName TEXT, $userId INTEGER PRIMARY KEY AUTOINCREMENT, $userLastName TEXT)');
      debugPrint("table Created");
    }
  }

  // Functions for CRUD operations
  //Fetch operation
  Future<UserData?> getUser(int id) async {
    Database db = await database;

    List<Map> maps = await db.query(userTable,
        columns: [userId, userFirstName, userLastName],
        where: '$userId = ?',
        whereArgs: [id]);
    if (maps.isNotEmpty) {
      return UserData.fromMap(maps.first);
    }
    return null;
  }

  //Fetch operation
  Future<UserData?> getFirstUser() async {
    Database db = await database;

    List<Map> maps = await db.query(userTable,
        columns: [userId, userFirstName, userLastName],
        limit: 1
    );
    if (maps.isNotEmpty) {
      return UserData.fromMap(maps.first);
    }
    return null;
  }

  // Insert Operation
  Future<int> insertUserData(UserData user) async {
    Database db = await database;
    var result = await db.insert('userTable', user.toMap());
    debugPrint("user added");
    return result;
  }

  // Delete Operation
  Future<int> deletePerson(int id) async {
    Database db = await database;
    var result =
        await db.rawDelete('DELETE FROM $userTable WHERE $userId = ?', [id]);
    return result;
  }

  // Delete Operation
  Future<int> deleteAllPersons() async {
    Database db = await database;
    var result =
    await db.rawDelete('DELETE FROM $userTable');
    return result;
  }

}
