import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  ForgotPasswordPageState createState() => ForgotPasswordPageState();
}

class ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  FocusNode focusNode = FocusNode();

  final _emailController = TextEditingController();

  String? textController1Validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    }
    return null;
  }

  @override
  void dispose() {
    _emailController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            content:
                Text('Password reset link have been sent to your adress mail '),
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      (e);
      // ignore: use_build_context_synchronously
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
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
          leading: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
            child: IconButton(
              icon: const Icon(
                Icons.close,
                color: Colors.black,
                size: 38,
              ),
              onPressed: () async {
                Navigator.of(context).pop();
              },
            ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 400,
                height: 100,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: const Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
                  child: Text(
                    'Forgot Password  ?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Playfair Display',
                      color: Colors.black,
                      fontSize: 35,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              Container(
                width: 400,
                height: 64,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: const Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                  child: Text(
                    'Enter your email and we will send you a password reset link ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Playfair Display',
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(8, 100, 8, 16),
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
                    hintStyle: const TextStyle(fontWeight: FontWeight.w500),
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
                        const EdgeInsetsDirectional.fromSTEB(24, 24, 0, 24),
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
                padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                child: ElevatedButton(
                  onPressed: () {
                    passwordReset();
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(230, 52),
                    padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                    backgroundColor: const Color(0xFF0026F6),
                    foregroundColor: Colors.white,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  child: const Text(
                    'Reset Password',
                    style: TextStyle(
                      fontFamily: 'Playfair Display',
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
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
