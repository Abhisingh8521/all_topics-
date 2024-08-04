// db_helper.dart
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../model/data_model.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'users.db');
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        email TEXT,
        address TEXT,
        gender TEXT
      )
    ''');
  }

  Future<int> insertData(UserProviderModel dataModel) async {
    var dbClient = await database;
    return await dbClient.insert('users', dataModel.toJson());
  }

  Future<List<UserProviderModel>> getAllUsers() async {
    var dbClient = await database;
    List<Map<String, dynamic>> result = await dbClient.query('users');
    return result.map((e) => UserProviderModel.fromJson(e)).toList();
  }

  Future<void> deleteUser(int userId) async {
    var dbClient = await database;
    await dbClient.delete('users', where: 'id = ?', whereArgs: [userId]);
  }

}
