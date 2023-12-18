import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List<Article>> fetchArticles() async {
  final response = await http.get(Uri.parse(
      'https://sun-societies-2.ghost.io/ghost/api/content/posts/?key=4254ba9a6c405c3d66e7e469a8&include=tags,authors&formats=html,plaintext'));

  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body)['posts'];
    List<Article> articles =
        data.map((model) => Article.fromJson(model)).toList();
    return articles;
  } else {
    throw Exception('Failed to load articles');
  }
}

class Article {
  final String id;
  final String title;
  final String featureImage;
  final DateTime publishedAt;
  final List<String> tags;
  final String? html;
  final String plaintext;
  final String url;
  final int? readingTime;

  Article(
      {required this.id,
      required this.title,
      required this.featureImage,
      required this.publishedAt,
      required this.tags,
      required this.html,
      required this.plaintext,
      required this.url,
      required this.readingTime});

  factory Article.fromJson(Map<String, dynamic> json) {
    final tagsList = json['tags'] as List<dynamic>;
    final tags = tagsList.map((tag) => tag['name'].toString()).toList();
    return Article(
      id: json["id"],
      title: json['title'],
      featureImage: json['feature_image'],
      publishedAt: DateTime.parse(json['published_at']),
      tags: tags,
      html: json['html'],
      plaintext: json['plaintext'],
      url: json['url'],
      readingTime: json["reading_time"],
    );
  }
}
