class Books {
  final int id;
  final String title;
  final String author;

  Books({this.id, this.title, this.author});

  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title, 'author': author};
  }
}
