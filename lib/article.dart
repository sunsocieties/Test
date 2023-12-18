import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import 'api.dart';
import 'constant.dart';
import 'native_dialog.dart';
import 'paywall.dart';
import 'saved_articles_model.dart';
import 'singletons.data.dart';

class ArticlePage extends StatefulWidget {
  final Article article;

  const ArticlePage({super.key, required this.article});

  @override
  ArticlePageState createState() => ArticlePageState();
}

class ArticlePageState extends State<ArticlePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading = false;

  @override
  void initState() {
    initPlatformState();

    super.initState();
    checkSubscriptionStatus();
  }

  Future<void> checkSubscriptionStatus() async {
    setState(() {
      isLoading = true;
    });

    CustomerInfo customerInfo = await Purchases.getCustomerInfo();

    if (customerInfo.entitlements.all[entitlementID] != null &&
        customerInfo.entitlements.all[entitlementID]?.isActive == true) {
      setState(() {
        isLoading = false;
      });
    } else {
      await showPaywall();
    }
  }

  Future<void> initPlatformState() async {
    appData.appUserID = await Purchases.appUserID;

    Purchases.addCustomerInfoUpdateListener((customerInfo) async {
      appData.appUserID = await Purchases.appUserID;

      CustomerInfo customerInfo = await Purchases.getCustomerInfo();
      EntitlementInfo? entitlement =
          customerInfo.entitlements.all[entitlementID];
      appData.entitlementIsActive = entitlement?.isActive ?? false;

      setState(() {});
    });
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
    var savedArticlesModel = context.watch<SavedArticlesModel>();
    String firstTag =
        widget.article.tags.isNotEmpty ? widget.article.tags[0] : "";
    String author =
        widget.article.tags.isNotEmpty ? widget.article.tags[1] : "";
    String formattedDate =
        DateFormat('dd/MM/yyyy').format(widget.article.publishedAt);

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(
              Icons.close,
              color: Colors.black,
              size: 38,
            ),
            onPressed: () async {
              Navigator.of(context).pop();
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
              child: GestureDetector(
                onTap: () {
                  if (!savedArticlesModel.savedArticles
                      .contains(widget.article)) {
                    savedArticlesModel.addToSaved(widget.article);
                  } else {
                    savedArticlesModel.removeFromSaved(widget.article);
                  }
                },
                child: Icon(
                  savedArticlesModel.savedArticles.contains(widget.article)
                      ? Icons
                          .bookmark // Afficher l'icône pleine si l'article est sauvegardé
                      : Icons.bookmark_border,
                  color: Colors.black,
                  size: 36,
                ),
              ),
            ),
          ],
          centerTitle: true,
          elevation: 0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12, 10, 5, 10),
                  child: Container(
                    width: 100,
                    height: 30,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Row(children: [
                      Text(firstTag,
                          style: TextStyle(
                            fontFamily:
                                GoogleFonts.playfairDisplay().fontFamily,
                            color: const Color(0xFFFF0202),
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                          )),
                      const SizedBox(width: 230),
                      Text(
                        formattedDate,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 15, 10, 16),
                  child: Container(
                    width: 100,
                    height: 89,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Text(
                      widget.article.title,
                      style: TextStyle(
                        fontFamily: GoogleFonts.playfairDisplay().fontFamily,
                        color: Colors.black,
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  child: Container(
                    width: 100,
                    height: 250,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(0),
                      child: Image.network(
                        widget.article.featureImage,
                        width: 300,
                        height: 200,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(70, 40, 70, 0),
                  child: SizedBox(
                    height: 20,
                    child: Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                  child: Container(
                    width: 100,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                15, 0, 5, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'By ',
                                  style: TextStyle(
                                    fontFamily: GoogleFonts.playfairDisplay()
                                        .fontFamily,
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  author,
                                  style: TextStyle(
                                    fontFamily: GoogleFonts.playfairDisplay()
                                        .fontFamily,
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(70, 0, 70, 0),
                  child: SizedBox(
                    height: 20,
                    child: Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12, 15, 12, 0),
                  child: Text(
                    widget.article.plaintext,
                    style: TextStyle(
                        fontFamily: GoogleFonts.playfairDisplay().fontFamily,
                        color: Colors.black,
                        fontSize: 19,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
