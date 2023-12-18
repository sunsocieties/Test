import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import 'contact.dart';
import 'later_articles_page.dart';
import 'native_dialog.dart';
import 'privacy_policy.dart';
import 'saved_articles_page.dart';
import 'signin.dart';
import 'singletons.data.dart';
import 'subscription.dart';
import 'terms.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  AccountPageState createState() => AccountPageState();
}

class AccountPageState extends State<AccountPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _logOut() async {
    setState(() {
      isLoading = true;
    });

    try {
      await Purchases.logOut();
      appData.appUserID = await Purchases.appUserID;
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
  }

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
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
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () async {
              Navigator.of(context).pop();
            },
          ),
          actions: [
            IconButton(
              onPressed: signUserOut,
              icon: const Icon(Icons.logout),
              iconSize: 24,
              color: Colors.black,
            )
          ],
          centerTitle: true,
          elevation: 2,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15, 15, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.00, 0.00),
                      child: Text(
                        'Account',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontFamily: 'Playfair Display',
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: !appData.appUserID.contains("RCAnonymousID:"),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(15, 15, 15, 0),
                  child: Container(
                    width: 400,
                    height: 61,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SigninPage(),
                            ));
                      },
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: const Color(0xFFF1F4F8),
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                              child: Text(
                                'Log in ',
                                style: TextStyle(
                                  fontFamily: 'Playfair Display',
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: appData.appUserID.contains("RCAnonymousID:"),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(15, 15, 15, 0),
                  child: Container(
                    width: 400,
                    height: 61,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        _logOut();
                      },
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: const Color(0xFFF1F4F8),
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                              child: Text(
                                'Log Out ',
                                style: TextStyle(
                                  fontFamily: 'Playfair Display',
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 15, 5),
                child: Container(
                  width: 400,
                  height: 61,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SubscriptionPage(),
                      ));
                    },
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: const Color(0xFFF1F4F8),
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: Text(
                              'Subscription',
                              style: TextStyle(
                                fontFamily: 'Playfair Display',
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 125,
                child: Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
              ),
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15, 15, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Articles',
                      style: TextStyle(
                        fontFamily: 'Playfair Display',
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(15, 15, 15, 0),
                child: Container(
                  width: 400,
                  height: 61,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SavedArticlesPage(),
                      ));
                    },
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: const Color(0xFFF1F4F8),
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                            child: Text(
                              'Saved',
                              style: TextStyle(
                                fontFamily: 'Playfair Display',
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                child: Container(
                  width: 400,
                  height: 61,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const LaterArticlesPage()));
                    },
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: const Color(0xFFF1F4F8),
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                            child: Text(
                              'Read later',
                              style: TextStyle(
                                fontFamily: 'Playfair Display',
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 125,
                child: Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
              ),
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                      child: Text(
                        'About',
                        style: TextStyle(
                          fontFamily: 'Playfair Display',
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(15, 15, 15, 0),
                child: Container(
                  width: 400,
                  height: 61,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: const Color(0xFFF1F4F8),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ContactPage(),
                        ));
                      },
                      child: const Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                            child: Text(
                              'Contact Us',
                              style: TextStyle(
                                fontFamily: 'Playfair Display',
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                child: Container(
                  width: 400,
                  height: 61,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: const Color(0xFFF1F4F8),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const PrivacyPolicyPage(),
                        ));
                      },
                      child: const Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                            child: Text(
                              'Privacy Policy',
                              style: TextStyle(
                                fontFamily: 'Playfair Display',
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                child: Container(
                  width: 400,
                  height: 61,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: const Color(0xFFF1F4F8),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const TermsPage(),
                        ));
                      },
                      child: const Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                            child: Text(
                              'Terms of Service',
                              style: TextStyle(
                                fontFamily: 'Playfair Display',
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(150, 15, 150, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                      child: Text(
                        'Sun Societies',
                        style: TextStyle(
                          fontFamily: 'Playfair Display',
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(160, 5, 158, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Version 1.0.0',
                      style: TextStyle(
                        fontFamily: 'Playfair Display',
                        color: Colors.black,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
