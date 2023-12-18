import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'api.dart';
import 'article.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  final controller = TextEditingController();

  List<Article> articles = [];
  List<Article> previousSuggestions = [];

  void searchArticle(String query) async {
    List<Article> allArticles = await fetchArticles();

    if (query.isEmpty) {
      setState(() {
        articles = allArticles;
      });
    } else {
      final suggestions = articles.where((article) {
        final articleTitle = article.title.toLowerCase();
        final input = query.toLowerCase();

        return articleTitle.contains(input);
      }).toList();

      setState(() {
        articles = suggestions.isNotEmpty ? suggestions : previousSuggestions;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchArticles().then((fetchedArticles) {
      setState(() {
        articles = fetchedArticles;
      });
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(
              Icons.close,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () async {
              Navigator.of(context).pop();
            },
          ),
          elevation: 0,
        ),
        body: Column(
          children: [
            Container(
                margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: TextField(
                  controller: controller,
                  onChanged: (query) {
                    if (query.isNotEmpty) {
                      previousSuggestions = articles;
                    }
                    searchArticle(query);
                  },
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Search',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: const BorderSide(color: Colors.grey),
                      )),
                )),
            Expanded(
                child: ListView.builder(
                    itemCount: articles.length,
                    itemBuilder: (context, index) {
                      final article = articles[index];
                      final formattedDate =
                          DateFormat('dd/MM/yyyy').format(article.publishedAt);
                      final firstTag =
                          article.tags.isNotEmpty ? article.tags[0] : '';

                      return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ArticlePage(article: articles[index])),
                            );
                          },
                          child: Container(
                              width: 100,
                              height: 155,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                  child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(10, 7, 0, 7),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: Image.network(
                                              article.featureImage,
                                              width: 120,
                                              height: 145,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 100,
                                          child: VerticalDivider(
                                            thickness: 1,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Expanded(
                                            child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                              Align(
                                                alignment:
                                                    const AlignmentDirectional(
                                                        -1.00, -1.00),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0, 10, 0, 0),
                                                  child: Text(
                                                    firstTag,
                                                    style: const TextStyle(
                                                      fontFamily:
                                                          'Playfair Display',
                                                      color: Color(0xFFFF0202),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                article.title,
                                                style: const TextStyle(
                                                  fontFamily:
                                                      'Playfair Display',
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Align(
                                                alignment:
                                                    const AlignmentDirectional(
                                                        1.00, 1.00),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0, 10, 10, 2),
                                                  child: Text(
                                                    formattedDate,
                                                    style: const TextStyle(
                                                      fontFamily:
                                                          'Playfair Display',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ]))
                                      ]))));
                    }))
          ],
        ),
      );
}
