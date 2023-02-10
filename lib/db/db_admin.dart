import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBAdmin {
  Database? _myDatabase;

  static final DBAdmin _instance = DBAdmin._();
  DBAdmin._();
  factory DBAdmin() {
    return _instance;
  }

  Future<Database?> _checkDatabase() async {
    if (_myDatabase == null) {
      _myDatabase = await _initDataBase();
    }
    return _myDatabase;
  }

  //Crear las base de datos
  Future<Database> _initDataBase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String pathDatabase = join(directory.path, "DBBooks.db");
    return await openDatabase(
      pathDatabase,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
            "CREATE TABLE BOOK(id INTEGER PRIMARY KEY AUTOINCREMENT , title TEXT, author TEXT, description TEXT, image TEXT)");
      },
    );
  }

  //Consultas

  getBooks() async {
    Database? db = await _checkDatabase();
    List data = await db!.rawQuery("SELECT * FROM Book");
    // print(data);
    data.forEach((element) {
      print(element);
    });
  }

  //Inserciones

  insertBookRaw() async {
    Database? db = await _checkDatabase();
    int value = await db!.rawInsert(
        "INSERT INTO BOOK(title, author, description, image) VALUES ('The Lord of the rings','JRR Tolkien', 'Lorem ipsum', 'http://www...')");
    print(value);
  }

  insertBook() async {
    Database? db = await _checkDatabase();
    db!.insert(
      "BOOK",
      {
        "title": "Yawar Fiesta",
        "author": "Jose Maria Arguedas",
        "description": "Loremmmmmm",
        "image": "http://www...",
      },
    );
  }

  //Actualizaciones

  updateBook() async {
    Database? db = await _checkDatabase();
  }

  //Eliminar

}
