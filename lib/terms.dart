import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsPage extends StatefulWidget {
  const TermsPage({super.key});

  @override
  TermsPageState createState() => TermsPageState();
}

class TermsPageState extends State<TermsPage> {
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
          body: SingleChildScrollView(
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
                        const SizedBox(height: 20),
                        const Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(70, 10, 70, 0),
                          child: SizedBox(
                            height: 20,
                            child: Divider(
                              thickness: 1,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        Text(
                          'Terms of Service',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w900,
                              fontSize: 30),
                        ),
                        const Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(70, 10, 70, 0),
                          child: SizedBox(
                            height: 20,
                            child: Divider(
                              thickness: 1,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '1.Registration',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFFFF0202),
                            fontFamily:
                                GoogleFonts.playfairDisplay().fontFamily,
                            fontWeight: FontWeight.w800,
                            fontSize: 26,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '1.2. Registration Information: When registering, you must provide accurate, complete, and up-to-date information, including your full name, email address, date of birth, and a secure password. You are solely responsible for the accuracy of this information. We are committed to protecting your data in accordance with our Privacy Policy',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '1.3. Authenticity of Information: You agree not to use false information or fraudulently represent another person during registration. Any use of inaccurate or misleading registration data may result in the immediate termination of your account.',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '1.4. Confidentiality of Login Information: You are responsible for maintaining the confidentiality of your username and password. You agree not to share your login information with third parties and to take reasonable measures to prevent unauthorized access to your account.',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '1.5. Reporting Intrusions: If you suspect or detect unauthorized access to your account, you must immediately inform Sun Societies so that appropriate measures can be taken to protect your account.',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '1.6. Legal Use: You commit to using the Application only for legal purposes and in accordance with these Terms of Use. You must not use the Application for illegal, fraudulent, defamatory, offensive, or harmful activities.',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '1.7. Multiple Accounts: You agree not to create or manage multiple accounts on the Application, except with explicit authorization from Sun Societies.',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '1.8. User Responsibility: You understand that all activities that occur under your account are your responsibility, whether or not you have authorized these activities. You are also responsible for the security of your account and must take all necessary measures to protect it.',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '1.9. Minimum Age: By accepting these Terms of Use, you confirm that you are at least the legal age required to use the Application in accordance with the laws applicable in your jurisdiction of residence. If you are below the required age, you must obtain consent from your parents or legal guardians to use the Application.',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '1.10. Identity Verification: Sun Societies reserves the right to request additional information to verify your identity and eligibility to use the Application, including requesting proof of age or other relevant documents.',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '1.11. Account Termination:You can terminate your account at any time by following the termination procedures described in the Application. Termination of your account will result in the loss of access to all the features of the Application.',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(70, 40, 70, 0),
                          child: SizedBox(
                            height: 20,
                            child: Divider(
                              thickness: 2,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '2. Subscriptions',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFFFF0202),
                            fontFamily:
                                GoogleFonts.playfairDisplay().fontFamily,
                            fontWeight: FontWeight.w800,
                            fontSize: 26,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '2.1. Types of Subscriptions: Sun Societies offers two types of paid subscriptions: monthly and annual. Monthly and annual subscriptions are designed to provide you with flexibility in choosing according to your preferences and usage.',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '2.2. Subscription Costs: The cost of each subscription type is clearly indicated in the Application. Prices may vary based on the subscription period and the user’s geographical location',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '2.3. Payment Terms: Payment for your subscription will be automatically deducted from your iTunes account (for iOS users) or your Google Play account (for Android users) upon confirmation of the purchase. Payment terms are managed by the respective platforms and are subject to their terms of service.',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '2.4. Automatic Renewal: All subscriptions are automatically renewed unless you disable this option at least 24 hours before the current period ends. Automatic renewal ensures uninterrupted access to the Application without the need for manual re-subscription.',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '2.5. Subscription Management: You can manage your subscriptions, including automatic renewal, by accessing your account settings on the App Store (for iOS users) or Google Play (for Android users). You have the option to cancel a subscription at any time.',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '2.6. Cancellation of Subscriptions: If you choose to cancel an ongoing subscription, you will continue to have access to the Application with the features of the current subscription until the end of the current subscription period. No partial refunds will be granted for mid-period cancellations.',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '2.7. Rate Changes: Sun Societies reserves the right to change subscription rates at any time. Any rate change will be notified to users in advance, typically through notifications within the Application or via email.',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '2.8. Refunds: Refunds are processed in accordance with the refund policy of the App Store (for iOS users) or Google Play (for Android users). Sun Societies cannot guarantee refunds for subscriptions',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '2.9. Payment Through Third Parties: If you make a payment through third parties such as mobile operators, internet service providers, or other third parties, the payment terms of these third parties may apply in addition to these Terms of Use',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '2.10. Suspension or Termination: Sun Societies reserves the right to suspend or terminate a subscription if a user violates these Terms of Use or abuses the Application, in accordance with our termination policy',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(70, 40, 70, 0),
                          child: SizedBox(
                            height: 20,
                            child: Divider(
                              thickness: 2,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '3. Use of the Application',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFFFF0202),
                            fontFamily:
                                GoogleFonts.playfairDisplay().fontFamily,
                            fontWeight: FontWeight.w800,
                            fontSize: 26,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '3.1. Purpose of the Application:The “Sun Societies” Application is designed to provide you with access to news information in the form of articles. You can use it to read articles and, if you wish, share these articles on other platforms. The use of the Application is subject to these Terms of Use.',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '3.2. Respect for Copyright: You acknowledge that all content present in the Application, including articles, is protected by copyright and other intellectual property laws. You can share articles on other platforms, but you must respect copyright and provide appropriate credit to the author and the source of the article you are sharing',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '3.3. Legal Use: You commit to using the Application only for legal purposes. You must not use the Application to publish, share, or promote illegal, defamatory, offensive, obscene, or any other unlawful content. Sun Societies reserves the right to remove any content in violation of these rules.',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '3.4. Prohibition of Fraud: The use of the Application for any form of fraud, phishing, spam, or similar activities is strictly prohibited. You may not use the Application to unlawfully or unauthorizedly collect personal information from other users.',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '3.5. Commercial Use: Unless expressly authorized by Sun Societies, the use of the Application for commercial purposes, including advertising or promoting products or services, is prohibited.',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '3.6. Alteration or Interference: You must not alter, modify, or attempt to compromise the security of the Application, its servers, or its networks.',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '3.7. Respect for Other Users: Although direct communication with other users is not enabled in this Application, you are required to respect the rights and privacy of other users. Any offensive, harassing, or harmful behavior towards other users is strictly prohibited',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '3.8. External Links: The Application may contain links to external websites or resources. Sun Societies is not responsible for the content or security of these external sites and does not guarantee their accuracy, reliability, or availability.',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '3.9. Violation of Terms: Non-compliance with these Terms of Use may result in the termination of your account and a ban from accessing the Application.',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '3.10. Reporting Issues: If you observe inappropriate behavior or offensive content, please report it to Sun Societies so that appropriate measures can be taken.',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(70, 40, 70, 0),
                          child: SizedBox(
                            height: 20,
                            child: Divider(
                              thickness: 2,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '4. Content',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFFFF0202),
                            fontFamily:
                                GoogleFonts.playfairDisplay().fontFamily,
                            fontWeight: FontWeight.w800,
                            fontSize: 26,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '4.1. Property Rights: All content present in the “Sun Societies” Application, including articles, images, videos, graphics, logos, and other elements, is protected by copyright, trademark, and other intellectual property laws. These property rights belong to Sun Societies or its licensors. You acknowledge that you do not acquire any ownership rights to the content by using the Application.',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '4.2. Use of Content: You are authorized to use the content of the Application for personal, non-commercial purposes only. You may read, download, and share articles, provided that you respect copyright and provide appropriate credit to the author and the source of the article.',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '4.3. Prohibited Use: You may not use the content of the Application in a manner contrary to these Terms of Use or applicable laws. This includes reproduction, distribution, modification, creation of derivative works, sale, publication, or any other unauthorized use of the content.',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '4.4. Content Modifications: Sun Societies reserves the right to modify or remove any content from the Application at any time without prior notice. We do not guarantee the accuracy, completeness, or continuous availability of the content.',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '4.5. External Links: The Application may contain links to external websites or resources. Sun Societies is not responsible for the content or security of these external sites and does not guarantee their accuracy, reliability, or availability',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '4.6. Third-Party Content: Some content presented in the Application may come from third parties, such as external news sources. Sun Societies does not control this third-party content and assumes no responsibility for its accuracy, legality, or quality.',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '4.7. Reporting Inappropriate Content: If you encounter inappropriate content or copyright infringement in the Application, please report it to Sun Societies for appropriate action.',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '4.8. Content Retraction Right: Sun Societies reserves the right to remove or refuse to publish any content that, in our sole discretion, violates these Terms of Use or is deemed inappropriate',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(70, 40, 70, 0),
                          child: SizedBox(
                            height: 20,
                            child: Divider(
                              thickness: 2,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '5. Termination',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFFFF0202),
                            fontFamily:
                                GoogleFonts.playfairDisplay().fontFamily,
                            fontWeight: FontWeight.w800,
                            fontSize: 26,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '5.1. Termination by the User: You have the right to terminate your account at any time by following the termination procedures provided in the Application. Termination of your account will result in the loss of access to all features of the Application. You remain responsible for any previous account activity.',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '5.2. Termination by Sun Societies: Sun Societies reserves the right to terminate your account or restrict your access to the Application, at its sole discretion, without prior notice, if you violate these Terms of Use or engage in abusive or inappropriate behavior. Termination may result in the deletion of any content you have submitted or shared in the Application.',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '5.3. Effects of Termination: In the event of the termination of your account, you will no longer have access to the Application and its content. Provisions of these Terms of Use that, by their nature, should survive termination, will remain in effect after termination, including, but not limited to, provisions related to intellectual property, disclaimers, and disputes.',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '5.4. Account Security: You are responsible for the security of your account and login information. If you discover or suspect unauthorized use of your account, you must promptly notify Sun Societies so that measures can be taken to protect your account.',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '5.5. Legal Consequences: The termination of your account does not affect your liability to Sun Societies for any prior violations of these Terms of Use or for any unlawful acts committed during the use of the Application. Sun Societies reserves the right to initiate legal proceedings for violations of these Terms of Use.',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '5.6. Data Deletion: After the termination of your account, your data will be deleted in accordance with our Privacy Policy.',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '5.7. Account Reactivation: In certain cases, Sun Societies may allow the reactivation of a terminated account, subject to specific conditions. Please contact customer support for information on account reactivation.',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '5.8. Termination Notification: In the event of termination of your account by Sun Societies, we will provide you with a written notification explaining the reasons for termination, unless prohibited by law',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(70, 40, 70, 0),
                          child: SizedBox(
                            height: 20,
                            child: Divider(
                              thickness: 2,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '6. Limitation of Liability',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFFFF0202),
                            fontFamily:
                                GoogleFonts.playfairDisplay().fontFamily,
                            fontWeight: FontWeight.w800,
                            fontSize: 26,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '6.1. Disclaimer of Warranties: The use of the “Sun Societies” Application is at your own risk. We provide the Application “as is” and “as available,” without any express or implied warranties. Sun Societies does not guarantee that the Application will be error-free, uninterrupted, secure, or free from viruses or other harmful components.',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '6.2. Content Accuracy: While we strive to provide accurate and up-to-date information, Sun Societies does not warrant the accuracy, completeness, or reliability of the content in the Application. You acknowledge that some information may be outdated or incorrect.',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '6.3. User Responsibility: You understand and agree that you are solely responsible for your use of the Application and any harm resulting from such use. Sun Societies, its employees, officers, directors, and partners shall not be liable for any direct, indirect, special, consequential, or punitive damages arising from the use of the Application.',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '6.4. Interruptions or Malfunctions: Sun Societies shall not be liable for temporary interruptions or malfunctions of the Application, regardless of the cause, including technical failures, maintenance operations, updates, or network issues. We will endeavor to minimize such interruptions, but they may occur unexpectedly.',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '6.5. Third-Party Content: The Application may contain content from third parties, including articles from external sources. Sun Societies does not guarantee the quality, legality, or accuracy of such third-party content. You agree to access such content at your own risk.',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '6.6. Legal Liability Limitation:To the extent permitted by applicable law, Sun Societies’ total liability to you, whether under contract, tort (including negligence), or otherwise, is limited to the amount you have paid, if any, for the Application subscription.',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '6.7. Acts of God: Sun Societies shall not be liable for delays, failures, or damages resulting from events beyond its control, including natural disasters, acts of terrorism, strikes, conflicts, network outages, or government actions.',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '6.8. Indemnification: You agree to indemnify and hold Sun Societies, its employees, officers, directors, and partners harmless from any liability, claim, demand, costs, expenses, or legal actions arising from your use of the Application or the violation of these Terms of Use.',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '6.9. Severability: If any part of this limitation of liability section is deemed invalid or unenforceable under applicable law, the remaining portion shall remain in effect to the extent permitted.',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '6.10. Applicable Jurisdiction: This limitation of liability section shall be interpreted and enforced in accordance with the laws of France. »',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(70, 40, 70, 0),
                          child: SizedBox(
                            height: 20,
                            child: Divider(
                              thickness: 2,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '7. Modification of Terms',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFFFF0202),
                            fontFamily:
                                GoogleFonts.playfairDisplay().fontFamily,
                            fontWeight: FontWeight.w800,
                            fontSize: 26,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '7.1. Right to Modify: Sun Societies reserves the right to modify these Terms of Use at any time. The modifications will become effective upon their publication in the Application, and it is your responsibility to regularly review the Terms of Use to stay informed of updates.',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '7.2. Notification of Changes: We will do our best to inform you of significant changes made to the Terms of Use. However, it is your responsibility to regularly check the Terms of Use to stay informed of any changes',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '7.3. Consent to Changes: Your continued use of the Application after the publication of modifications constitutes your acceptance of these changes. If you do not agree with the modifications, you have the right to terminate your account in accordance with Section 5 of these Terms of Use.',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '7.4. Review of Changes: If you have concerns or objections regarding the changes made to the Terms of Use, you are encouraged to contact us to discuss your concerns. We will make reasonable efforts to address your feedback appropriately',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '7.5. Non-Retroactive Effect: Changes to the Terms of Use will not be retroactive and will not affect vested rights or obligations arising from events before the effective date of the modifications.',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '7.6. Publication of Changes: Changes to the Terms of Use will be published in the Application in a clear and accessible manner for users.',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '7.7. Commitment to Fairness: We are committed to fairness and transparency in the process of modifying the Terms of Use. We will consider user feedback and strive to minimize disruption to existing users when implementing changes.',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '7.8. Notification of Significant Changes: In the event of significant changes that could have a substantial impact on your use of the Application, we will proactively notify you through in-App notifications or other appropriate means.',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '7.9. Legal Compliance: All modifications to the Terms of Use will comply with applicable laws and regulations. We will also consider industry best practices and consumer protection standards.',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '7.10. Periodic Review: Sun Societies will regularly review the Terms of Use to keep them up-to-date and aligned with developments in the Application, legislation, and user needs.',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const SizedBox(height: 40),
                      ]))),
        ));
  }
}
