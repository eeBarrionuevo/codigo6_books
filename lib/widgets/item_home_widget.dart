import 'dart:math';

import 'package:codigo6_books/models/book_model.dart';
import 'package:flutter/material.dart';

class ItemHomeWidget extends StatelessWidget {
  BookModel book;

  ItemHomeWidget({required this.book});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double pyth = sqrt(pow(height, 2) + pow(width, 2));

    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(
                  book.image,
                  width: pyth * 0.12,
                  height: pyth * 0.16,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      book.title,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      book.author,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 6.0,
                    ),
                    Text(
                      book.description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black.withOpacity(0.65),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 12,
          right: 0,
          child: PopupMenuButton(
            onSelected: (int value) {
              if (value == 1) {
              } else {}
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.0),
            ),
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Row(
                    children: const [
                      Icon(Icons.edit, size: 16.0),
                      SizedBox(
                        width: 4.0,
                      ),
                      Text("Actualizar"),
                    ],
                  ),
                  value: 1,
                  onTap: () {
                    print("ACTUALIZARRRRRRRRRRRRRR");
                  },
                ),
                PopupMenuItem(
                  child: Row(
                    children: const [
                      Icon(Icons.delete_outline_rounded, size: 16.0),
                      SizedBox(
                        width: 4.0,
                      ),
                      Text("Eliminar"),
                    ],
                  ),
                  value: 2,
                  onTap: () {
                    print("ELIMINARRRRRRRRRRRRRRRR");
                  },
                ),
              ];
            },
          ),
        ),
      ],
    );
  }
}
