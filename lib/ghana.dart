import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import 'api.dart';
import 'article.dart';
import 'constant.dart';
import 'later_articles_model.dart';
import 'native_dialog.dart';
import 'paywall.dart';

class GhanaPage extends StatefulWidget {
  const GhanaPage({super.key});

  @override
  GhanaPageState createState() => GhanaPageState();
}

class GhanaPageState extends State<GhanaPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  late Future<List<Article>> futureArticles;
  List<Article> articles = [];

  @override
  void initState() {
    super.initState();
    futureArticles = fetchArticles();

    checkSubscriptionStatus();
  }

  bool isLoading = false;

  Future<bool> checkSubscriptionStatus() async {
    CustomerInfo customerInfo = await Purchases.getCustomerInfo();

    return customerInfo.entitlements.all[entitlementID]?.isActive ?? false;
  }

  Future<void> showPaywall() async {
    Offerings? offerings;

    try {
      offerings = await Purchases.getOfferings();
    } on PlatformException catch (e) {
      // ignore: use_build_context_synchronously
      await showDialog(
          context: context,
          builder: (BuildContext context) => ShowDialogToDismiss(
              title: "Error",
              content: e.message ?? "Unknown error",
              buttonText: 'OK'));
    }

    setState(() {
      isLoading = false;
    });

    if (offerings == null || offerings.current == null) {
      // offerings are empty, show a message to your user
    } else {
      // current offering is available, show paywall
      // ignore: use_build_context_synchronously
      await showModalBottomSheet(
        useRootNavigator: true,
        isDismissible: true,
        isScrollControlled: true,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
        ),
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setModalState) {
            return Paywall(
              offering: offerings!.current!,
            );
          });
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var laterArticlesModel = context.watch<LaterArticlesModel>();
    return GestureDetector(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
              size: 35,
            ),
            onPressed: () async {
              Navigator.of(context).pop();
            },
          ),
          title: Row(
            children: [
              const SizedBox(width: 30),
              Container(
                width: 50,
                height: 33,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'images/Ghana.png',
                ),
              ),
              const SizedBox(width: 1),
              Text(
                'Ghana',
                style: TextStyle(
                  fontFamily: GoogleFonts.playfairDisplay().fontFamily,
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          actions: const [],
          centerTitle: true,
          elevation: 1,
        ),
        body: Center(
          child: FutureBuilder<List<Article>>(
            future: futureArticles,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              } else if (snapshot.hasData) {
                List<Article> articles = snapshot.data!;
                return ListView.builder(
                    itemCount: articles.length,
                    itemBuilder: (context, index) {
                      final article = articles[index];
                      final formattedDate =
                          DateFormat('dd/MM/yyyy').format(article.publishedAt);
                      final firstTag =
                          article.tags.isNotEmpty ? article.tags[0] : '';

                      if (article.tags.contains('Ghana')) {
                        return GestureDetector(
                          onTap: () async {
                            bool isSubscribed = await checkSubscriptionStatus();

                            if (isSubscribed) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ArticlePage(article: articles[index]),
                                ),
                              );
                            } else {
                              // User is not subscribed, show paywall
                              await showPaywall();
                            }
                          },
                          child: Container(
                            height: 315,
                            decoration:
                                const BoxDecoration(color: Colors.white),
                            child: Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(10, 8, 0, 0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: Image.network(
                                              articles[index].featureImage,
                                              width: 385,
                                              height: 145,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Expanded(
                                      child: Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0, 7, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
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
                                                              8, 5, 8, 0),
                                                      child: Row(children: [
                                                        Text(
                                                          firstTag,
                                                          style: TextStyle(
                                                              fontFamily: GoogleFonts
                                                                      .playfairDisplay()
                                                                  .fontFamily,
                                                              color: const Color(
                                                                  0xFFFF0202),
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        const Spacer(),
                                                        Text(formattedDate,
                                                            style: const TextStyle(
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontFamily:
                                                                    'Playfair Display'))
                                                      ]),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                            6, 5, 6, 10),
                                                    child: Text(
                                                      article.title,
                                                      style: TextStyle(
                                                          fontFamily: GoogleFonts
                                                                  .playfairDisplay()
                                                              .fontFamily,
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                            6, 6, 6, 0),
                                                    child: Row(
                                                      children: [
                                                        const Icon(
                                                          Icons
                                                              .access_time_sharp,
                                                          color: Colors.black,
                                                          size: 23,
                                                        ),
                                                        Text(
                                                          ' ${article.readingTime} min',
                                                          style: const TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 15,
                                                              fontFamily:
                                                                  'Playfair Display'),
                                                        ),
                                                        const Spacer(),
                                                        GestureDetector(
                                                          onTap: () {
                                                            if (!laterArticlesModel
                                                                .laterArticles
                                                                .contains(
                                                                    article)) {
                                                              laterArticlesModel
                                                                  .addToLater(
                                                                      article);
                                                            } else {
                                                              laterArticlesModel
                                                                  .removeFromLater(
                                                                      article);
                                                            }
                                                          },
                                                          child: Icon(
                                                            laterArticlesModel
                                                                    .laterArticles
                                                                    .contains(
                                                                        article)
                                                                ? Icons
                                                                    .watch_later
                                                                : Icons
                                                                    .watch_later_outlined,
                                                            color: Colors.black,
                                                            size: 24,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ))
                                            ],
                                          )),
                                    )
                                  ],
                                )),
                          ),
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    });
              }
              return const Text('No data available');
            },
          ),
        ),
      ),
    );
  }
}
