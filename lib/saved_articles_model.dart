import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api.dart';

class ArticleManager {
  static List<Article> allArticles = [];

  static Article getArticleById(String id) {
    return allArticles.firstWhere((article) => article.id == id);
  }
}

class SavedArticlesModel extends ChangeNotifier {
  final List<String> savedArticleIds = [];
  List<Article> _savedArticles = [];
  List<Article> get savedArticles => _savedArticles;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> loadSavedArticles() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedArticleIds = prefs.getStringList('savedArticles');
    if (savedArticleIds != null) {
      _savedArticles = savedArticleIds
          .map((id) => ArticleManager.getArticleById(id))
          .toList();
      notifyListeners();
    }
  }

  // Nouvelle méthode pour sauvegarder les articles sauvegardés dans SharedPreferences
  Future<void> saveSavedArticles() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> savedArticleIds =
        _savedArticles.map((article) => article.id).toList();
    prefs.setStringList('savedArticles', savedArticleIds);
  }

  void addToSaved(Article article) async {
    _savedArticles.add(article);

    final SharedPreferences prefs = await _prefs;
    List<String> savedArticleIds = prefs.getStringList('savedArticles') ?? [];
    savedArticleIds.add(article.id);
    await prefs.setStringList('savedArticles', savedArticleIds);

    notifyListeners();
  }

  void removeFromSaved(Article article) async {
    _savedArticles.remove(article);

    final SharedPreferences prefs = await _prefs;
    List<String> savedArticleIds = prefs.getStringList('savedArticles') ?? [];
    savedArticleIds.remove(article.id);
    await prefs.setStringList('savedArticles', savedArticleIds);

    notifyListeners();
  }
}
