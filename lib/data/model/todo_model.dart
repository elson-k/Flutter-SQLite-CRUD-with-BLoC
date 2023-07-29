class Todo {
  final String id;
  final String title;

  const Todo({required this.id, required this.title});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
    };
  }
}
