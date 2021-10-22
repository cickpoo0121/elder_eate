import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqlService {
  SqlService._init();
  static final SqlService instance = SqlService._init();

  static Database? _database;
  String dbFile = 'elderEat.db';

  Future<Database> get database async {
    String dbPath = await getDatabasesPath();
    String fullPaht = join(dbPath, dbFile);
    print(fullPaht);

    // DB existed?
    bool existed = await databaseExists(fullPaht);

    if (!existed) {
      // no DB
      //copy DB
      // check whether the db folder exists
      try {
        Directory(dirname(fullPaht)).create(recursive: true);
      } catch (_) {
        print('Cannot find folder');
      }

      // copy from asset folder
      print('Copping db...');
      ByteData data = await rootBundle.load(join('assets/db', dbFile));
      // convert data to int
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(fullPaht).writeAsBytes(bytes, flush: true);
      print('DB copied');
    } else {
      print('DB existed');
      // return _database as Database;
    }
    _database = await openDatabase(fullPaht);
    return _database as Database;
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }

  // ========= user service ===========

  Future userLoad() async {
    final db = await instance.database;
    final result = await db.query('users');

    if (result.length > 0) {
      print(result);
    } else {
      print('Not found');
    }

    return result;
  }

  Future userRegister() async {
    final db = await instance.database;
    final user = GetStorage().read('user');

    final data = {
      'Username': user['username'],
      'Age': user['age'],
      'Sex': user['sex'],
      'Weight': user['weight'],
      'Height': user['height'],
      'Disease': user['disease'],
      'Line_ID': user['line'],
    };

    // print(user['age']);

    // inspect(todosSave);
    final result = await db.insert('users', data,
        conflictAlgorithm: ConflictAlgorithm.replace);

    return true;
  }

  Future userUpdate(int id, String username, double weight, double height,
      int age, String disease) async {
    final db = await instance.database;
    // print(id);
    // print(username);
    // print(weight);
    // print(height);
    final data = {
      'Username': username,
      'Age': age,
      'Weight': weight,
      'Height': height,
      'Disease': disease
    };
    final result =
        await db.update('users', data, where: 'User_ID=?', whereArgs: [id]);

    return true;
  }

  // ========= user service ===========
  Future foodSearch(keyWord) async {
    final db = await instance.database;
    final result = await db.rawQuery(
        'SELECT * FROM foodmenu WHERE Food_Name like ?', ['%$keyWord%']);
    // final result = await db
    //     .query('foodmenu', where: 'Food_Name like %?%', whereArgs: [keyWord]);

    if (result.length > 0) {
      // print(result);
    } else {
      print('Not found');
    }
    return result;
  }

  Future foodLoadId(id) async {
    final db = await instance.database;
    final result =
        await db.query('foodmenu', where: 'Food_Menu_ID=?', whereArgs: [id]);
    if (result.length > 0) {
      return result;
    } else {
      print('Not found');
    }
  }

  // =========== Daily eat ============

  dailyLoad() async {
    final db = await instance.database;
    // final result = await db.query(
    //   'dailyeate',
    //   orderBy: 'Daily_Eat_ID DESC',
    // );
    final result = await db.rawQuery(
        'SELECT *,foodmenu.Food_Category_ID FROM dailyeate  INNER JOIN foodmenu  on dailyeate.Food_Menu=foodmenu.Food_Menu_ID ORDER by dailyeate.Daily_Eat_ID DESC');

    // print(result);
    if (result.length > 0) {
      // print(result);
    } else {
      print('Not found');
    }

    return result;
  }

  Future dailyAdd(data) async {
    final db = await instance.database;
    final result = await db.insert('dailyeate', data);

    return true;
  }
}