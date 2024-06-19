import 'package:foodapp_new/model/mark.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class NewDB {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initialize();
    return _database!;
  }

  Future<String> fullPath() async {
    const name = 'newdb.db';
    final path = await getDatabasesPath();
    return join(path, name);
  }

  Future<Database> _initialize() async {
    final path = await fullPath();
    var database = await openDatabase(path,
        version: 1, onCreate: create, singleInstance: true);
    return database;
  }

  Future<void> create(Database database, int version) async {
    await database.execute(
        'CREATE TABLE mine_new(id INTEGER PRIMARY KEY, name TEXT, category TEXT, area TEXT, resep TEXT, foto TEXT)');
  }

  Future<void> insert(MyMeals mine_new) async {
    final db = await database;
    await db.insert('mine_new', mine_new.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<MyMeals>> list() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('mine_new');
    print('Maps : $maps');

    if (maps.isEmpty) {
      print('data kosong');
    }
    return List.generate(maps.length, (i) {
      return MyMeals(
        idMeal: maps[i]['id'].toString(),
        strMeal: maps[i]['name'].toString(),
        strCategory: maps[i]['category'].toString(),
        strArea: maps[i]['area'].toString(),
        strInstructions: maps[i]['resep'].toString(),
        strMealThumb: maps[i]['foto'].toString(),
      );
    });
  }

  Future<void> update(MyMeals mine) async {
    final db = await database;
    await db.update(
      'mine_new',
      mine.toMap(),
      where: 'id = ?',
      whereArgs: [mine.idMeal],
    );
  }

  Future<void> delete(String idMeal) async {
    final db = await database;
    await db.delete(
      'mine_new',
      where: 'id = ?',
      whereArgs: [idMeal],
    );
  }
}
