import 'package:flutter/material.dart';

import 'HomePage.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  SplashscreenState createState() => SplashscreenState();
}

class SplashscreenState extends State<Splashscreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    loadDataFromAPI();
  }

  void loadDataFromAPI() async {
    try {
      setState(() {});

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } catch (e) {}
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: const SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: AlignmentDirectional(0.00, 0.00),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 295, 0, 0),
                child: Text(
                  'Sun Societies',
                  style: TextStyle(
                    fontFamily: 'Playfair Display',
                    color: Color(0xFF0026F6),
                    fontSize: 45,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
