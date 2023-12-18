import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  ContactPageState createState() => ContactPageState();
}

class ContactPageState extends State<ContactPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
                Icons.close_rounded,
                color: Colors.black,
                size: 40,
              ),
              onPressed: () async {
                Navigator.of(context).pop();
              },
            ),
            actions: const [],
            centerTitle: true,
            elevation: 0,
          ),
          body: SafeArea(
              child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'images/Sun.png',
                          width: 100,
                          height: 100,
                        ),
                        const SizedBox(height: 90),
                        Text(
                          'Contact Us',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w900,
                              fontSize: 30),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'If you have any inquiries or questions, please feel free to contact us at the provided email address. We are here to assist and address any concerns you may have.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 20),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.mail_outline,
                              color: Colors.black,
                              size: 25,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'contact@sunsocieties.com',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily:
                                    GoogleFonts.playfairDisplay().fontFamily,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        )
                      ]))),
        ));
  }
}
