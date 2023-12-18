import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import 'constant.dart';
import 'singletons.data.dart';

class Paywall extends StatefulWidget {
  final Offering offering;

  const Paywall({super.key, required this.offering});

  @override
  PaywallState createState() => PaywallState();
}

class PaywallState extends State<Paywall> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 248.0,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(25.0))),
              child: Center(
                child: Column(children: [
                  Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10, 5, 350, 0),
                      child: IconButton(
                        icon: const Icon(
                          Icons.close,
                          color: Colors.black,
                          size: 46,
                        ),
                        onPressed: () async {
                          Navigator.of(context).pop();
                        },
                      )),
                  const SizedBox(height: 30),
                  Image.asset(
                    'images/Sun.png',
                    width: 100,
                    height: 100,
                  ),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(70, 10, 70, 0),
                    child: SizedBox(
                      height: 20,
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 16, bottom: 16, left: 16.0, right: 16.0),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  'Subscription',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: GoogleFonts.playfairDisplay().fontFamily,
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: Colors.black),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 16, bottom: 16, left: 16.0, right: 16.0),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  textAlign: TextAlign.center,
                  footerText,
                  style: TextStyle(
                      fontFamily: GoogleFonts.playfairDisplay().fontFamily,
                      fontSize: 21,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsetsDirectional.fromSTEB(70, 10, 70, 0),
              child: SizedBox(
                height: 20,
                child: Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              itemCount: widget.offering.availablePackages.length,
              itemBuilder: (BuildContext context, int index) {
                var myProductList = widget.offering.availablePackages;
                return Card(
                  color: Colors.white,
                  child: ListTile(
                      onTap: () async {
                        try {
                          CustomerInfo customerInfo =
                              await Purchases.purchasePackage(
                                  myProductList[index]);

                          EntitlementInfo? entitlement =
                              customerInfo.entitlements.all[entitlementID];
                          appData.entitlementIsActive =
                              entitlement?.isActive ?? false;
                        } catch (e) {
                          (e);
                        }

                        setState(() {});
                        // ignore: use_build_context_synchronously
                        Navigator.pop(context);
                      },
                      title: Text(
                        myProductList[index].storeProduct.title,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 19,
                          fontFamily: GoogleFonts.playfairDisplay().fontFamily,
                        ),
                      ),
                      subtitle: Text(
                        myProductList[index].storeProduct.description,
                        style: const TextStyle(fontSize: 15),
                      ),
                      trailing:
                          Text(myProductList[index].storeProduct.priceString,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ))),
                );
              },
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, bottom: 0, left: 16.0, right: 16.0),
              child: GestureDetector(
                onTap: () {},
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                      text: "Already subscribed ? ",
                      style: TextStyle(
                        fontFamily: 'Playfair Display',
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Restore Purchases',
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 255),
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                          ),
                        )
                      ]),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, bottom: 0, left: 16.0, right: 16.0),
              child: GestureDetector(
                onTap: () {},
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                      text: "Terms of Service ",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                          text: '  •  ', // Gray and bold bullet point
                          style: TextStyle(
                            color: Colors.black, // Gray color
                            fontWeight: FontWeight.w800, // Bold
                          ),
                        ),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(
                            fontFamily: 'Playfair Display',
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ]),
                ),
              ),
            ),
            const SizedBox(height: 45),
          ],
        ),
      ),
    );
  }
}
