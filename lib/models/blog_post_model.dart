class BlogPost {
  final String id;
  final String title;
  final String body;
  final DateTime date;
  final String? image;

  BlogPost({
    required this.title,
    required this.id,
    required this.body,
    required this.date,
    this.image,
  });
}
