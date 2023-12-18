import 'dart:convert';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import 'constant.dart';
import 'firebase_api.dart';
import 'firebase_options.dart';
import 'homepage.dart';
import 'later_articles_model.dart';
import 'saved_articles_model.dart';
import 'store_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseApi().initNotifications();

  if (Platform.isIOS || Platform.isMacOS) {
    StoreConfig(
      store: Store.appStore,
      apiKey: appleApiKey,
    );
  } else if (Platform.isAndroid) {
    StoreConfig(
      store: Store.playStore,
      apiKey: googleApiKey,
    );
  }

  await _configureSDK();

  await SavedArticlesModel().loadSavedArticles();
  await LaterArticlesModel().loadLaterArticles();

  runApp(
    MultiProvider(
      providers: [
        // ... other providers
        ChangeNotifierProvider(create: (context) => SavedArticlesModel()),
        ChangeNotifierProvider(create: (context) => LaterArticlesModel()),
      ],
      child: const MyApp(),
    ),
  );

  HttpClient httpClient = HttpClient();
  httpClient.badCertificateCallback =
      (X509Certificate cert, String host, int port) => true;

  HttpClientRequest request =
      await httpClient.postUrl(Uri.parse("https://example.com/api/endpoint"));
  request.headers.set('content-type', 'application/json');
  request.add(utf8.encode(json.encode({"key": "value"})));
  HttpClientResponse response = await request.close();

  String reply = await response.transform(utf8.decoder).join();
  (reply);
}

Future<void> _configureSDK() async {
  await Purchases.setLogLevel(LogLevel.debug);

  PurchasesConfiguration configuration;
  if (StoreConfig.isForAmazonAppstore()) {
    configuration = AmazonConfiguration(StoreConfig.instance.apiKey)
      ..appUserID = null
      ..observerMode = false;
  } else {
    configuration = PurchasesConfiguration(StoreConfig.instance.apiKey)
      ..appUserID = null
      ..observerMode = false;
  }
  await Purchases.configure(configuration);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
