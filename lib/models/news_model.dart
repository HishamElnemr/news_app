class NewsModel {
  final String title;
  final String description;
  final String author;
  final String img;
  final String content;
  final DateTime? update;

  NewsModel( {
    required this.title,
    required this.author,
    required this.content,
    required this.description,
    required this.img,
    required this.update,
  });

  factory NewsModel.fromJson(json) {
    return NewsModel(
      title: json['title'],
      author: json['author'] ?? 'Unknown', 
      content: json['content'] ?? 'No content available',
      description: json['description'] ?? 'No description available',
      img: json['urlToImage'] ?? 'assets/img.png',
      update: DateTime.parse(json['publishedAt']),
    );
  }
}
