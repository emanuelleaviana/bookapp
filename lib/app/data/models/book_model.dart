class BookModel {
  final String tittle;
  final String author;
  final String description;
  final double id;

  BookModel({
    required this.tittle,
    required this.author,
    required this.description,
    required this.id,
  });

  factory BookModel.fromMap(item, {required Map<String, dynamic> map}) {
    return BookModel(
        tittle: map['tittle'],
        author: map['author'],
        description: map['description'],
        id: map['id']);
  }
}
