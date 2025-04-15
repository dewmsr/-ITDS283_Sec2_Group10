import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/user.dart';
import '../models/appointment.dart';
import '../models/medicine_mod.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('users.db');
    return _database!;
  }

  Future<Database> _initDB(String dbName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, dbName);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        first_name TEXT NOT NULL,
        last_name TEXT NOT NULL,
        email TEXT NOT NULL UNIQUE,
        phone TEXT NOT NULL,
        password TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE appointments(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        location TEXT,
        note TEXT,
        start_time TEXT NOT NULL,
        end_time TEXT NOT NULL,
        is_all_day INTEGER,
        reminder TEXT,
        status TEXT DEFAULT 'pending'
      )
    ''');

    await db.execute('''
  CREATE TABLE medicines (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    amount INTEGER,
    times_per_day INTEGER,
    time_slots TEXT,
    time_strings TEXT,
    relation TEXT,
    note TEXT,
    reminder TEXT,
    date TEXT,
    status TEXT DEFAULT 'pending'
  )
''');
  }

  Future<int> insertUser(UserModel user) async {
    final db = await database;
    return await db.insert('users', user.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<UserModel?> getUserByEmail(String email) async {
    final db = await database;
    final maps = await db.query('users', where: 'email = ?', whereArgs: [email]);

    if (maps.isNotEmpty) {
      return UserModel.fromMap(maps.first);
    }
    return null;
  }

  Future<List<UserModel>> getAllUsers() async {
    final db = await database;
    final result = await db.query('users');
    return result.map((map) => UserModel.fromMap(map)).toList();
  }

  Future<UserModel?> getUserById(int id) async {
    final db = await database;
    final maps = await db.query('users', where: 'id = ?', whereArgs: [id]);

    if (maps.isNotEmpty) {
      return UserModel.fromMap(maps.first);
    }
    return null;
  }

  Future<int> insertAppointment(AppointmentModel appointment) async {
    final db = await database;
    return await db.insert('appointments', appointment.toMap());
  }

  Future<List<AppointmentModel>> getAllAppointments() async {
    final db = await database;
    final result = await db.query('appointments');
    return result.map((e) => AppointmentModel.fromMap(e)).toList();
  }

  Future<void> updateAppointmentStatus(int id, String status) async {
    final db = await database;
    await db.update(
      'appointments',
      {'status': status},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> insertMedicine(MedicineModel med) async {
    final db = await database;
    return await db.insert('medicines', med.toMap());
  }

  Future<List<MedicineModel>> getAllMedicines() async {
    final db = await database;
    final result = await db.query('medicines');
    return result.map((e) => MedicineModel.fromMap(e)).toList();
  }

  Future<List<MedicineModel>> getTodayMedicines() async {
    final db = await database;
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day).toIso8601String();
    final result = await db.query(
      'medicines',
      where: 'date = ?',
      whereArgs: [today],
    );
    return result.map((e) => MedicineModel.fromMap(e)).toList();
  }

  Future<void> updateMedicineStatus(int id, String status) async {
    final db = await database;
    await db.update(
      'medicines',
      {'status': status},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteDatabaseManually() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'users.db');
    await deleteDatabase(path);
    print("✅ Database deleted successfully: \$path");
  }
}
