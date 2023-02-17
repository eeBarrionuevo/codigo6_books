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

  // fromJson

  Map<String, dynamic> toJson() => {
        "title": title,
        "author": author,
        "image": image,
        "description": description,
      };
}
