class BookModel {
  String title;
  String author;
  String image;
  String description;

  BookModel({
    required this.title,
    required this.author,
    required this.image,
    required this.description,
  });

  factory BookModel.fromJson(Map<String, dynamic> mapa) => BookModel(
        title: mapa["title"],
        author: mapa["author"],
        image: mapa["image"],
        description: mapa["description"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "author": author,
        "image": image,
        "description": description,
      };
}
