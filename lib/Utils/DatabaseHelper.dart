import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../Models/Place.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  DatabaseHelper._internal();

  factory DatabaseHelper() {
    return _instance;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'places.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE places(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        placeName TEXT,
        imageUrl TEXT,
        parkingRating REAL,
        pavementRating REAL,
        servicesRating REAL,
        toiletsRating REAL
      )
    ''');
  }

  Future<int> addPlace(Place place) async {
    final db = await database;
    return await db.insert('places', place.toMap());
  }

  Future<List<Place>> getPlaces() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('places');

    return List.generate(maps.length, (i) {
      return Place(
        placeName: maps[i]['placeName'],
        imageUrl: maps[i]['imageUrl'],
        parkingRating: maps[i]['parkingRating'],
        pavementRating: maps[i]['pavementRating'],
        servicesRating: maps[i]['servicesRating'],
        toiletsRating: maps[i]['toiletsRating'],
      );
    });
  }

  Future<int> removePlace(int id) async {
    final db = await database;
    return await db.delete(
      'places',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
