import 'dart:io';
import 'package:codigo6_books/models/book_model.dart';
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

  getBooksRaw() async {
    Database? db = await _checkDatabase();
    List data = await db!.rawQuery("SELECT id, title FROM Book WHERE id = 3");
    // print(data);
    data.forEach((element) {
      print(element);
    });
  }

  Future<List<Map>> getBooks() async {
    Database? db = await _checkDatabase();
    List<Map> data = await db!.query(
      "Book",
      orderBy: "id DESC",
    );
    return data;
  }

  //Inserciones

  insertBookRaw() async {
    Database? db = await _checkDatabase();
    int value = await db!.rawInsert(
        "INSERT INTO BOOK(title, author, description, image) VALUES ('The Lord of the rings','JRR Tolkien', 'Lorem ipsum', 'http://www...')");
    print(value);
  }

  Future<int> insertBook(BookModel model) async {
    Database? db = await _checkDatabase();
    int value = await db!.insert(
      "BOOK",
      model.toJson(),
    );
    return value;
  }

  //Actualizaciones

  updateBookRaw() async {
    Database? db = await _checkDatabase();
    int value = await db!.rawUpdate(
        "UPDATE Book set title = 'El zorro de arriba y el zorro de abajo' WHERE id = 4");
    print(value);
  }

  updateBook() async {
    Database? db = await _checkDatabase();
    int value = await db!.update(
      "Book",
      {
        "title": "1984",
      },
      where: "id = 3",
    );
  }

  //Eliminar

  deleteBookRaw() async {
    Database? db = await _checkDatabase();
    int value = await db!.rawDelete("DELETE FROM Book WHERE id = 7");
    print(value);
  }

  deleteBook() async {
    Database? db = await _checkDatabase();
    int value = await db!.delete(
      "Book",
      where: "id = 8",
    );
    print(value);
  }
}
