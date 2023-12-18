import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import 'forgotpassword.dart';
import 'native_dialog.dart';
import 'signup.dart';
import 'singletons.data.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  SigninPageState createState() => SigninPageState();
}

class SigninPageState extends State<SigninPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  bool isLoading = false;
  bool obscurePassword = true;

  String? textController1Validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    }
    return null;
  }

  String? textController2Validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    }
    return null;
  }

  FocusNode focusNode = FocusNode();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final user = FirebaseAuth.instance.currentUser;

  Future<void> _logIn(String email, String password) async {
    setState(() {
      isLoading = true;
    });

    try {
      Purchases.logIn;
      appData.appUserID = await Purchases.appUserID;
    } on PlatformException catch (e) {
      // ignore: use_build_context_synchronously
      await showDialog(
          context: context,
          builder: (BuildContext context) => ShowDialogToDismiss(
              title: "Error",
              content: e.message ?? "Unknown error",
              buttonText: 'OK'));
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void signUserIn() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // ignore: use_build_context_synchronously
      Navigator.pop(context);

      if (e.code == 'user not found') {
        wrongEmailMessage();
      } else if (e.code == 'The password is incorrect') {
        wrongPasswordMessage();
      }
    }
  }

  void wrongEmailMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(title: Text('Incorrect email'));
        });
  }

  void wrongPasswordMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(title: Text('Incorrect password '));
        });
  }

  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
              size: 38,
            ),
            onPressed: () async {
              Navigator.of(context).pop();
            },
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: const AlignmentDirectional(0.00, 0.00),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 10),
                  child: Text(
                    'Sun Societies',
                    style: TextStyle(
                      fontFamily: GoogleFonts.playfairDisplay().fontFamily,
                      color: const Color(0xFF0026F6),
                      fontSize: 36,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: Container(
                  width: 380,
                  height: 750,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                        child: Text(
                          'Sign in to continue',
                          style: TextStyle(
                            fontFamily: 'Playfair Display',
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(8, 30, 8, 16),
                        child: TextFormField(
                          controller: emailController,
                          autofocus: true,
                          autofillHints: const [AutofillHints.email],
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: const TextStyle(
                              fontFamily: 'Playfair Display',
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            hintStyle:
                                const TextStyle(fontWeight: FontWeight.w500),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color.fromARGB(224, 227, 231, 231),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.red,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.red,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding:
                                const EdgeInsetsDirectional.fromSTEB(
                                    24, 24, 0, 24),
                          ),
                          style: const TextStyle(
                            fontFamily: 'Playfair Display',
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: textController1Validator,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 25),
                        child: TextFormField(
                          controller: passwordController,
                          autofocus: true,
                          obscureText: obscurePassword,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: const TextStyle(
                              fontFamily: 'Playfair Display',
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            hintStyle:
                                const TextStyle(fontWeight: FontWeight.w500),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color.fromARGB(224, 227, 231, 231),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.red,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.red,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding:
                                const EdgeInsetsDirectional.fromSTEB(
                                    24, 24, 0, 24),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  obscurePassword = !obscurePassword;
                                });
                              },
                              child: Icon(
                                obscurePassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          style: const TextStyle(
                            fontFamily: 'Playfair Display',
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          validator: textController2Validator,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ForgotPasswordPage(),
                          ));
                        },
                        child: const Align(
                          alignment: AlignmentDirectional(1.00, -1.00),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(8, 5, 8, 25),
                            child: Text(
                              'Forgot password ?',
                              style: TextStyle(
                                fontFamily: 'Playfair Display',
                                fontSize: 15,
                                color: Color.fromARGB(255, 0, 0, 255),
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: ElevatedButton(
                          onPressed: () async {
                            signUserIn();
                            await _logIn(
                                emailController.text, passwordController.text);
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(230, 52),
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24, 0, 24, 0),
                            backgroundColor: const Color(0xFF0026F6),
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                          child: const Text(
                            'Sign in',
                            style: TextStyle(
                              fontFamily: 'Playfair Display',
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignUpWidget(),
                                ),
                              );
                            },
                            child: RichText(
                                text: TextSpan(
                                    text: "Don't have an account ? ",
                                    style: const TextStyle(
                                      fontFamily: 'Playfair Display',
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                    children: <TextSpan>[
                                  TextSpan(
                                      text: 'Sign up',
                                      style: const TextStyle(
                                        fontFamily: 'Playfair Display',
                                        fontSize: 16,
                                        color: Color.fromARGB(255, 0, 0, 255),
                                        decoration: TextDecoration.underline,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const SignUpWidget(),
                                              ));
                                        })
                                ]))),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
