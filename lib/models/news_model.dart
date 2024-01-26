class NewsModels {
  String? author;
  String? title;
  String? description;
  String? urlToImage;
  String? publishedAt;
  String? content;

  NewsModels(
      {this.author,
      this.title,
      this.description,
      this.urlToImage,
      this.publishedAt,
      this.content});

  NewsModels.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    title = json['title'];
    description = json['description'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }
}
