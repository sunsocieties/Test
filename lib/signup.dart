import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import 'account.dart';
import 'native_dialog.dart';
import 'singletons.data.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({super.key});

  @override
  SignUpWidgetState createState() => SignUpWidgetState();
}

class SignUpWidgetState extends State<SignUpWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  FocusNode focusNode = FocusNode();

  bool obscurePassword = true;
  bool obscureConfirmedPassword = true;
  bool isLoading = false;

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

  String? textController3Validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    }

    return null;
  }

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmedpasswordController = TextEditingController();

  Future signUp() async {
    if (passwordConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
    }
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmedpasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmedpasswordController.dispose();
    focusNode.dispose();

    super.dispose();
  }

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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => focusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(FocusNode())
          : FocusScope.of(context).unfocus(),
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
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const AccountPage(),
              ));
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
                padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
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
                          'Create an account to continue',
                          style: TextStyle(
                            fontFamily: 'Playfair Display',
                            color: Colors.black,
                            fontSize: 24,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(8, 30, 8, 10),
                        child: TextFormField(
                          controller: _emailController,
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
                            const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 16),
                        child: TextFormField(
                          controller: _passwordController,
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
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 25),
                        child: TextFormField(
                          controller: _confirmedpasswordController,
                          autofocus: true,
                          obscureText: obscureConfirmedPassword,
                          decoration: InputDecoration(
                            labelText: 'Confirm Password',
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
                                  obscureConfirmedPassword =
                                      !obscureConfirmedPassword;
                                });
                              },
                              child: Icon(
                                obscureConfirmedPassword
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
                          validator: textController3Validator,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: ElevatedButton(
                          onPressed: () async {
                            signUp();
                            await _logIn(_emailController.text.trim(),
                                _passwordController.text.trim());
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
                            'Sign Up',
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
                                    text: "Already have an account ? ",
                                    style: const TextStyle(
                                      fontFamily: 'Playfair Display',
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                    children: <TextSpan>[
                                  TextSpan(
                                      text: 'Sign in',
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
