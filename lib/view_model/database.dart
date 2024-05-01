import 'package:foodapp_new/model/mark.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Nyarap {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initialize();
    return _database!;
  }

  Future<String> fullPath() async {
    const name = 'mymeal.db';
    final path = await getDatabasesPath();
    return join(path, name);
  }

  Future<Database> _initialize() async {
    final path = await fullPath();
    var database = await openDatabase(path,
        version: 1, onCreate: create, singleInstance: true);
    return database;
  }

  Future<void> create(Database database, int version) async =>
      await database.execute(
          'CREATE TABLE mine(id INTEGER PRIMARY KEY, name TEXT, foto TEXT)');

  Future<void> insert(MyMeals mine) async {
    final db = await database;
    await db.insert('mine', mine.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<MyMeals>> list() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('mine');
    print('Maps : $maps');

    return List.generate(maps.length, (i) {
      return MyMeals(
        idMeal: maps[i]['id'].toString(),
        strMeal: maps[i]['name'],
        strMealThumb: maps[i]['foto'],
      );
    });
  }

  Future<void> update(MyMeals mine) async {
    final db = await database;
    await db.update(
      'mine',
      mine.toMap(),
      where: 'id = ?',
      whereArgs: [mine.idMeal],
    );
  }

  Future<void> delete(int idMeal) async {
    final db = await database;
    await db.delete(
      'mine',
      where: 'id = ?',
      whereArgs: [idMeal],
    );
  }
}
