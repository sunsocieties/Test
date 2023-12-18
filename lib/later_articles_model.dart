import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api.dart';

class ArticleManager {
  static List<Article> allArticles = [];
}

class LaterArticlesModel extends ChangeNotifier {
  final List<Article> _laterArticles = [];
  List<Article> get laterArticles => _laterArticles;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> loadLaterArticles() async {
    final SharedPreferences prefs = await _prefs;
    List<String>? laterArticleIds = prefs.getStringList('laterArticles');

    List<Article> loadedArticles = [];
    if (laterArticleIds != null) {
      List<Article> allArticles = await fetchArticles();
      loadedArticles = allArticles
          .where((article) => laterArticleIds.contains(article.id))
          .toList();
    }

    // Update the _savedArticles list with the loaded articles.
    _laterArticles.clear();
    _laterArticles.addAll(loadedArticles);

    notifyListeners();
  }

  void addToLater(Article article) async {
    _laterArticles.add(article);

    final SharedPreferences prefs = await _prefs;
    List<String> laterArticleIds = prefs.getStringList('laterArticles') ?? [];
    laterArticleIds.add(article.id);
    await prefs.setStringList('laterArticles', laterArticleIds);

    notifyListeners();
  }

  void removeFromLater(Article article) async {
    _laterArticles.remove(article);

    final SharedPreferences prefs = await _prefs;
    List<String> laterArticleIds = prefs.getStringList('laterArticles') ?? [];
    laterArticleIds.remove(article.id);
    await prefs.setStringList('laterArticles', laterArticleIds);

    notifyListeners();
  }
}
