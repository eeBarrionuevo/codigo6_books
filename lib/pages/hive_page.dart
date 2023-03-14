import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HivePage extends StatelessWidget {
  final _bookBox = Hive.box('books_box');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                print(_bookBox.values);
                print(_bookBox.keys);
              },
              child: Text(
                "Get data",
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                int value = await _bookBox.add({
                  "id": 1,
                  "name": "El Señor de los Anillos 2",
                  "author": "JRR Tolkien"
                });
                print(value);
              },
              child: Text(
                "Add",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _bookBox.put(2, {
                  "id": 1,
                  "name": "El Señor de los Anillos 2x",
                  "author": "JRR Tolkien x"
                });
              },
              child: Text(
                "Update",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _bookBox.delete(0);
              },
              child: Text(
                "Delete",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
