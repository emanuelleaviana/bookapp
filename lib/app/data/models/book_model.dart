import 'dart:convert';

List<Book> bookFromJson(String str) =>
    List<Book>.from(json.decode(str).map((x) => Book.fromJson(x)));

String bookToJson(List<Book> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Book {
  Book({
    this.id,
    this.author,
    this.description,
    this.title,
  });

  String? id;
  String? author;
  String? description;
  String? title;

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        id: json["id"].toString(),
        author: json["author"],
        description: json["description"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "author": author,
        "description": description,
        "title": title,
      };
}
