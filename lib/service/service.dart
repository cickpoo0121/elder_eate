import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ElderEatDatabase {
  // ElderEatDatabase instance = ElderEatDatabase._init();
  static final ElderEatDatabase instance = ElderEatDatabase._init();
  static Database? _database;
  String dbFile = 'elderEat.db';

  ElderEatDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String dbPath = await getDatabasesPath();
    String fullPath = join(dbPath, dbFile);

    return openDatabase(fullPath, version: 1);
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }

  Future loadUser() async {
    final db = await instance.database;
    // List list = await db.rawQuery('SELECT * FROM foodcategory');
    List list = await db.query('users');

    // var list = await _db.query('eng2th',
    //     columns: ['tentry,ethai'],
    //     where: '"esearch" = ? AND "ecat" = ?',
    //     whereArgs: ['abandon', 'N']);

    if (list.length > 0) {
      print(list);
      // print(list[0]['tentry']);
    } else {
      print('Not found');
    }

    return list;
  }

  // Future register() async {
  //   final db = await instance.database;
  //   List = await db.insert(table, values)
  // }
}
