import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrivacyPolicyPage extends StatefulWidget {
  const PrivacyPolicyPage({super.key});

  @override
  PrivacyPolicyPageState createState() => PrivacyPolicyPageState();
}

class PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
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
            title: Text(
              'Privacy Policy',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontFamily: GoogleFonts.playfairDisplay().fontFamily,
                fontWeight: FontWeight.w900,
              ),
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
                          'Sun Societies app and data controller',
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
                          'Types of Data collected',
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
                          'Sun Societies places a high premium on the privacy of its users and collects only email addresses for a variety of purposes, including: 1. Communication: We use email addresses to engage with you about our services and to seamlessly process transactions related to our offerings. 2.Consent and Instructions: Your email address is utilized for any purpose explicitly consented to by you or in adherence to your specific instructions. This ensures that we align our actions with your preferences and choices.3.Innovation: We leverage the collected data to develop and enhance new products, services, content, and other offerings. This not only improves our current offerings but also allows us to tailor our services to meet evolving user needs.4.Safety: We prioritize the safety and security of our users. The collection of email addresses contributes to the overall safety measures implemented to protect our users’ accounts and information. Each email is associated with a User ID (UID) that allows us to identify users. 5. Account Recovery: In the event that users forget their passwords or encounter difficulties accessing their accounts, the email addresses provided become instrumental in enabling a secure and efficient account recovery process. It’s crucial to emphasize that the email addresses collected are voluntarily provided by users themselves. As part of our unwavering commitment to user privacy, personal data is not disclosed to any external entities. Moreover, in line with our user-centric approach, we assure users that their personal data will be promptly deleted from our database upon their explicit request. This dedication to user control and transparent data practices underscores our commitment to maintaining a secure and trustworthy user experience',
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
                          'Mode and place of processing the Data',
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
                          'Methods of processing',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 21),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Sun Societies places a paramount emphasis on the security of data and implements robust measures to safeguard against unauthorized access, disclosure, alteration, or destruction. These security measures are meticulously designed to ensure the confidentiality, integrity, and availability of the data we handle. Through the implementation of advanced security protocols, we strive to prevent any unauthorized parties from accessing, disclosing, or making unauthorized changes to the data under our care. This comprehensive approach extends to protecting against any potential unauthorized destruction of data, reinforcing our commitment to maintaining the utmost security standards. By adopting these measures, we aim to instill trust in our users, assuring them that their data is handled with the highest level of security and diligence.',
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
                          'Data processing within our system is conducted through Firebase(Google) and RevenueCat. All Firebase services have successfully undergone the ISO 27001 and SOC 1 evaluation process, as well as SOC 2 and SOC 3, with some also completing the ISO 27017 and ISO 27018 certification processes. The only firebase service we use is the authentification. The privacy protection frameworks have provided a mechanism for complying with data protection requirements when transferring personal data from the EEA, the UK, or Switzerland to the United States and beyond. In light of the European Court of Justice’s decision on data transfers, invalidating the EU-US Privacy Shield, Firebase has opted to rely on standard contractual clauses for relevant data transfers, which, in accordance with the decision, can continue to be a valid legal mechanism for transferring data under the GDPR. The European Commission approved new versions of standard contractual clauses on June 4, 2021, which they are incorporating into their contracts with Firebase clients for relevant data transfers',
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
                          'RevenueCat is used to power and manage the in-app subscription. It uses users’ email addresses to identify them in their database. Each email address is associated with the user’s subscription information so users don’t have to worry about the automatic renewal of the subscription.',
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
                          'We want to underscore our deep commitment to safeguarding your privacy, and it is crucial to emphasize that, apart from these two entities, we do not share your personal data with any other third parties. Respecting your privacy is at the core of our principles, and this stringent approach ensures that your personal information remains confidential and secure. We believe in transparency and want our users to have complete confidence that their data is handled responsibly, with the highest regard for privacy and security.',
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
                          'Place',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 21),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'We are a global organization so your personal information may be transferred outside of your home country and may be stored in and accessed from multiple countries, including the United States. When you interact with us, you authorize us to transfer your personal information outside of your home country and you acknowledge the risk that we may transfer your personal information to countries that may provide less protection than your home country’s privacy laws and we may not be able to prevent government authorities in some countries from accessing your personal information.',
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
                          'Security',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 21),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'We work to implement technical and organizational measures designed to protect the security of personal information. However, no method of transmission over the Internet or electronic storage is 100% secure, and we cannot guarantee its absolute security. The security of your information also depends on you: you are responsible for using unique, strong usernames and passwords for each of your accounts, and for keeping those usernames and passwords confidential. We are not responsible for the circumvention of any privacy settings or cybersecurity measures contained on our Services, and any transmission of personal information is at your own risk.',
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
                          'Retention time',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 21),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'The retention of users’ personal data (email) is governed by a policy that ensures the data is held only for as long as necessary to fulfill its intended purpose. Throughout the user’s engagement with our platform, their personal information remains securely stored, contributing to the seamless functioning of our services. It is our commitment to privacy and data protection that guides the retention period. Users maintain control over their personal data, and the information is held in accordance with their preferences. Should a user decide to terminate their association with our platform or express the intent to have their data deleted, we promptly respond by erasing their personal information from our records. This approach not only aligns with regulatory requirements but also reflects our dedication to providing users with autonomy over their data and ensuring a transparent and user-centric data management process. Regarding Firebase Authentication retains logged IP addresses for a few weeks. It retains other authentication information until the Firebase client initiates the deletion of the associated user, after which the data is removed from live and backup systems within 180 days.',
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
                              thickness: 1,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Further informations for users',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: const Color(0xFFFF0202),
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w800,
                              fontSize: 26),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Legal basis of processing',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 21),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Sun Societies may process Personal Data relating to Users if one of the following applies:',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '1) Users have given their consent for one or more specific purposes.2) provision of Data is necessary for the performance of an agreement with the User and/or for any pre-contractual obligations thereof. 3) Processing is necessary for compliance with a legal obligation to which Sun Societies is subject. 4) processing is related to a task that is carried out in the public interest or in the exercise of official authority vested in the Owner. 5) processing is necessary for the purposes of the legitimate interests pursued by the Sun Societies or by a third party',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'In any case, Sun Societies will gladly help to clarify the specific legal basis that applies to the processing, and in particular whether the provision of Personal Data is a statutory or contractual requirement, or a requirement necessary to enter into a contract',
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
                          'The rights of Users based on the General Data Protection Regulation (GDPR)',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 21),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Users may exercise certain rights regarding their Data processed by the Owner.In particular, Users have the right to do the following, to the extent permitted by law:',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        Text(
                          '1. Withdraw their consent at any time. Users have the right to withdraw consent where they have previously given their consent to the processing of their Personal Data. 2. Object to processing of their Data. Users have the right to object to the processing of their Data if the processing is carried out on a legal basis other than consent. 3.Access their Data. Users have the right to learn if Data is being processed by the Owner, obtain disclosure regarding certain aspects of the processing and obtain a copy of the Data undergoing processing. 4. Verify and seek rectification. Users have the right to verify the accuracy of their Data and ask for it to be updated or corrected. 5.Restrict the processing of their Data. Users have the right to restrict the processing of their Data. In this case, Sun Societies will not process their Data for any purpose other than storing it. 6.Have their Personal Data deleted or otherwise removed. Users have the right to obtain the erasure of their Data from the Owner. 7. Receive their Data and have it transferred to another controller. Users have the right to receive their Data in a structured, commonly used and machine readable format and, if technically feasible, to have it transmitted to another controller without any hindrance. 8. Lodge a complaint. Users have the right to bring a claim before their competent data protection authority. ',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 20),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Users are also entitled to learn about the legal basis for Data transfers abroad including to any international organization governed by public international law or set up by two or more countries, such as the UN, and about the security measures taken by the Owner to safeguard their Data.',
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
                          'Details about the right to object to processing',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 21),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Where Personal Data is processed for a public interest, in the exercise of an official authority vested in Sun Societies or for the purposes of the legitimate interests pursued by Sun Societies, Users may object to such processing by providing a ground related to their particular situation to justify the objection.',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Users must know that, however, should their Personal Data be processed for direct marketing purposes, they can object to that processing at any time, free of charge and without providing any justification. Where the User objects to processing for direct marketing purposes, the Personal Data will no longer be processed for such purposes. To learn whether the Owner is processing Personal Data for direct marketing purposes, Users may refer to the relevant sections of this document. ',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'How to exercise these rights',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 21),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Any requests to exercise User rights can be directed to Sun Societies through the contact details. Such requests are free of charge and will be answered by the Owner as early as possible and always within one week, providing Users with the information required by law. Any rectification or erasure of Personal Data or restriction of processing will be communicated by Sun Societies to each recipient, if any, to whom the Personal Data has been disclosed unless this proves impossible or involves disproportionate effort. At the Users’ request, Sun Societies will inform them about those recipients.',
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
                              thickness: 1,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Additional information about Data collection and processing',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: const Color(0xFFFF0202),
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w900,
                              fontSize: 26),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Legal action',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 21),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'The personal data of the user may be utilized for legal purposes by the owner, especially in court or during the stages preceding potential legal action stemming from the improper use of this application or its related services. It is essential for users to acknowledge that, in certain circumstances, the owner may be obligated to disclose personal data upon the request of public authorities. This disclosure is typically in line with legal obligations and is undertaken to comply with lawful requests from relevant authorities. As a user, understanding this aspect reinforces the transparency of our data practices, and we remain committed to upholding legal standards while prioritizing the protection of your personal information',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'System logs and maintenance',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 21),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'In order to facilitate the operation and maintenance of our application, as well as any third-party services integrated into it, various files, commonly referred to as system logs, may be collected. These logs meticulously record interactions with the application, serving the essential purpose of system monitoring, troubleshooting, and overall maintenance. The information contained in these logs includes details about the functioning of the application, potential errors, and other relevant data points. This systematic logging process plays a crucial role in enhancing the performance and reliability of our application. It enables us to identify and address any issues promptly, ensuring a smooth user experience. Rest assured, the collection and utilization of these system logs are conducted with a clear focus on maintaining the efficiency, security, and seamless functionality of our application',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Changes to this privacy policy',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily:
                                  GoogleFonts.playfairDisplay().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 21),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Sun Societies reserves the right to make changes to this privacy policy at any time by notifying its Users on this page and possibly within this Application and/or – as far as technically and legally feasible – sending a notice to Users via any contact information available to the Owner. It is strongly recommended to check this page often, referring to the date of the last modification listed at the bottom. Should the changes affect processing activities performed on the basis of the User’s consent, the Owner shall collect new consent from the User, where required.',
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
