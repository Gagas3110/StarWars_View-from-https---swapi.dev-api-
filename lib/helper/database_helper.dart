import 'dart:async';
import 'dart:io' as io;

import 'package:Star_Wars/providers/user.dart';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper  _instance = new DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;

  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "main.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
        "CREATE TABLE User(login TEXT PRIMARY KEY, token TEXT, userType TEXT, personName TEXT, oid TEXT)");
    print("Created tables");
  }

  Future<int> saveUser(Users users) async {
    var dbClient = await db;
    int res = await dbClient!.insert("User", users.toMap());
    return res;
  }

  Future<dynamic> updateToken(String token, String login) async {
    var dbClient = await db;
    await dbClient!.update("User", {"token": token}, where: "login = $login");
    print("update success");
    var res = await dbClient.query("User");
    return res;
  }

  Future<int> deleteUsers() async {
    var dbClient = await db;
    int res = await dbClient!.delete("User");
    return res;
  }

  Future<bool> isLoggedIn() async {
    var dbClient = await db;
    var res = await dbClient!.query("User");
    return res.length > 0 ? true : false;
  }

  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    var dbClient = await db;
    //Database db = await instance.database;
    var res = await dbClient!.query("User");
    return res;
  }
}
