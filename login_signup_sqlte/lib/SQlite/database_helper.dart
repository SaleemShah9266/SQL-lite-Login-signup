import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  final databaseName = "auth.db";

  // Table creation SQL statement
  String userTable = '''
  CREATE TABLE user(
  usrId INTEGER PRIMARY KEY AUTOINCREMENT,
  fullName TEXT,
  usrName TEXT UNIQUE,
  usrPassword TEXT
  )
  ''';

  // Initialize the database
  Future<Database> initDB() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databaseName);
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(userTable);
      },
    );
  }

  // Authentication method
  Future<bool> authenticate(User usr) async {
    final Database db = await initDB();
    var result = await db.rawQuery(
        "SELECT * FROM user WHERE usrName = ? AND usrPassword = ?",
        [usr.usrName, usr.usrPassword]);

    return result.isNotEmpty;
  }

  // Signup method
  Future<int> createUser(User usr) async {
    final Database db = await initDB();
    return db.insert("user", usr.toMap());
  }

  // Get current user details
  Future<User?> getUser(String usrName) async {
    final Database db = await initDB();
    var result =
        await db.query("user", where: "usrName = ?", whereArgs: [usrName]);
    return result.isNotEmpty ? User.fromMap(result.first) : null;
  }
}

// Example User class (for illustration)
class User {
  int? usrId;
  String fullName;
  String usrName;
  String usrPassword;

  User(
      {this.usrId,
      required this.fullName,
      required this.usrName,
      required this.usrPassword});

  // Convert User object to Map
  Map<String, dynamic> toMap() {
    return {
      'usrId': usrId,
      'fullName': fullName,
      'usrName': usrName,
      'usrPassword': usrPassword,
    };
  }

  // Create User object from Map
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      usrId: map['usrId'],
      fullName: map['fullName'],
      usrName: map['usrName'],
      usrPassword: map['usrPassword'],
    );
  }
}
