import 'package:fillproject/components/constants/fontsConstants.dart';
import 'package:fillproject/components/constants/myColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Privacy extends StatelessWidget {
  const Privacy({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor().black,
      body: Padding(
        padding: EdgeInsets.only(
            left: ScreenUtil.instance.setWidth(20.0),
            right: ScreenUtil.instance.setWidth(20.0),
            top: ScreenUtil.instance.setWidth(50.0),
            bottom: ScreenUtil.instance.setWidth(20.0)),
        child: Column(
          children: <Widget>[
            Container(
              margin:
                  EdgeInsets.only(bottom: ScreenUtil.instance.setWidth(20.0)),
              child: Text(
                'Privacy policy',
                style: TextStyle(
                    color: MyColor().white,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontFamily: arabic,
                    fontSize: ScreenUtil.instance.setSp(22.0)),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              child: Text(
                  'This privacy policy ("Policy") describes how Intelligent Function LLC ("Intelligent Function LLC", "we", "us" or "our") ' +
                      'collects, protects and uses the personally identifiable information ("Personal Information") you ("User", "you" or "your") ' +
                      'may provide in the Fill mobile application and any of its products or services (collectively, "Mobile Application" or "Services"). \n\n' +
                      'It also describes the choices available to you regarding our use of your Personal Information and how you can access and update ' +
                      'this information. This Policy does not apply to the practices of companies that we do not own or control, or to individuals that we do not employ or manage.',
                  style: TextStyle(
                      color: MyColor().white,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontFamily: arabic,
                      fontSize: ScreenUtil.instance.setSp(12.0))),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(
                  bottom: ScreenUtil.instance.setWidth(10.0),
                  top: ScreenUtil.instance.setWidth(10.0)),
              child: Text(
                'Automatic collection of information',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: MyColor().white,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontFamily: arabic,
                    fontSize: ScreenUtil.instance.setSp(16.0)),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              child: Text(
                  'Our top priority is customer data security and, as such, we exercise the no logs policy. We process only minimal user data, ' +
                      'only as much as it is absolutely necessary to maintain the Mobile Application or Services. Information collected automatically ' +
                      'is used only to identify potential cases of abuse and establish statistical information regarding Mobile Application ' +
                      'traffic and usage. This statistical information is not otherwise aggregated in such a way that would identify any particular user of the system',
                  style: TextStyle(
                      color: MyColor().white,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontFamily: arabic,
                      fontSize: ScreenUtil.instance.setSp(12.0))),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(
                  bottom: ScreenUtil.instance.setWidth(10.0),
                  top: ScreenUtil.instance.setWidth(10.0)),
              child: Text(
                'Collection of personal information',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: MyColor().white,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontFamily: arabic,
                    fontSize: ScreenUtil.instance.setSp(16.0)),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              child: Text(
                  "You can visit the Mobile Application without telling us who you are or revealing any information by which someone " +
                      "could identify you as a specific, identifiable individual. If, however, you wish to use some of the Mobile Application's " +
                      "features, you will be asked to provide certain Personal Information (for example, your name and e-mail address). We " +
                      "receive and store any information you knowingly provide to us when you create an account, make a purchase,  or fill " +
                      "any online forms in the Mobile Application.  When required, this information may include the following:\n",
                  style: TextStyle(
                      color: MyColor().white,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontFamily: arabic,
                      fontSize: ScreenUtil.instance.setSp(12.0))),
            ),
            Container(
              child: Text(
                  "   - Personal details such as name, country of residence, etc.\n" +
                      "   - Contact information such as email address, address, etc.\n" +
                      "   - Account details such as user name, unique user ID, password, etc.\n" +
                      "   - Proof of identity such as photocopy of a government ID.\n" +
                      "   - Payment information such as credit card details, bank details, etc.\n" +
                      "   - Geolocation data of the mobile device such as latitude and longitude.\n" +
                      "   - Information about other individuals such as your family members, friends, etc.\n" +
                      "   - Any other materials you willingly submit to us such as articles, images, feedback, etc.\n\n" +
                      "You can choose not to provide us with your Personal Information, but then you may" +
                      "not be able to take advantage of some of the Mobile Application's features. Users who are uncertain about what information is mandatory are welcome to contact us.",
                  style: TextStyle(
                      color: MyColor().white,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontFamily: arabic,
                      fontSize: ScreenUtil.instance.setSp(12.0))),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(
                  bottom: ScreenUtil.instance.setWidth(10.0),
                  top: ScreenUtil.instance.setWidth(10.0)),
              child: Text(
                'Managing personal information',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: MyColor().white,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontFamily: arabic,
                    fontSize: ScreenUtil.instance.setSp(16.0)),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              child: Text(
                  "You are able to delete certain Personal Information we have about you. The Personal Information you can delete may change as the Mobile Application or Services change. When you delete Personal Information, however, we may maintain a copy of the unrevised Personal Information in our records for the duration necessary to comply with our obligations to our affiliates and partners, and for the purposes described below.",
                  style: TextStyle(
                      color: MyColor().white,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontFamily: arabic,
                      fontSize: ScreenUtil.instance.setSp(12.0))),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(
                  bottom: ScreenUtil.instance.setWidth(10.0),
                  top: ScreenUtil.instance.setWidth(10.0)),
              child: Text(
                'Storing personal information',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: MyColor().white,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontFamily: arabic,
                    fontSize: ScreenUtil.instance.setSp(16.0)),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              child: Text(
                  "We will retain and use your Personal Information for the period necessary to comply with our legal obligations, resolve disputes, and enforce our agreements unless a longer retention period is required or permitted by law. We may use any aggregated data derived from or incorporating your Personal Information after you update or delete it, but not in a manner that would identify you personally. Once the retention period expires, Personal Information shall be deleted. Therefore, the right to access, the right to erasure, the right to rectification and the right to data portability cannot be enforced after the expiration of the retention period.",
                  style: TextStyle(
                      color: MyColor().white,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontFamily: arabic,
                      fontSize: ScreenUtil.instance.setSp(12.0))),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(
                  bottom: ScreenUtil.instance.setWidth(10.0),
                  top: ScreenUtil.instance.setWidth(10.0)),
              child: Text(
                'Use and processing of collected information',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: MyColor().white,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontFamily: arabic,
                    fontSize: ScreenUtil.instance.setSp(16.0)),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              child: Text(
                  "In order to make our Mobile Application and Services available to you, or to meet a legal obligation, we need to collect and use certain Personal Information. If you do not provide the information that we request, we may not be able to provide you with the requested products or services. Some of the information we collect is directly from you via our Mobile Application. However, we may also collect Personal Information about you from other sources. Any of the information we collect from you may be used for the following purposes:\n",
                  style: TextStyle(
                      color: MyColor().white,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontFamily: arabic,
                      fontSize: ScreenUtil.instance.setSp(12.0))),
            ),
            Container(
              child: Text(
                  "   - Create and manage user accounts\n" +
                      "   - Deliver products or services\n" +
                      "   - Respond to inquiries and offer support\n" +
                      "   - Request user feedback\n" +
                      "   - Improve user experience\n" +
                      "   - Enforce terms and conditions and policies\n" +
                      "   - Protect from abuse and malicious users\n" +
                      "   - Respond to legal requests and prevent harm\n" +
                      "   - Run and operate our Mobile Application and Services\n\n" +
                      "Processing your Personal Information depends on how you interact with our Mobile Application, where you are located in the world and if one of the following applies: (i) You have given your consent for one or more specific purposes. This, however, does not apply, whenever the processing of Personal Information is subject to European data protection law; (ii) Provision of information is necessary for the performance of an agreement with you and/or for any pre-contractual obligations thereof; (iii) Processing is necessary for compliance with a legal obligation to which you are subject; (iv) Processing is related to a task that is carried out in the public interest or in the exercise of official authority vested in us; (v) Processing is necessary for the purposes of the legitimate interests pursued by us or by a third party.\n\nNote that under some legislations we may be allowed to process information until you object to such processing (by opting out), without having to rely on consent or any other of the following legal bases below. In any case, we will be happy to clarify the specific legal basis that applies to the processing, and in particular whether the provision of Personal Information is a statutory or contractual requirement, or a requirement necessary to enter into a contract.",
                  style: TextStyle(
                      color: MyColor().white,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontFamily: arabic,
                      fontSize: ScreenUtil.instance.setSp(12.0))),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(
                  bottom: ScreenUtil.instance.setWidth(10.0),
                  top: ScreenUtil.instance.setWidth(10.0)),
              child: Text(
                'The rights of users',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: MyColor().white,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontFamily: arabic,
                    fontSize: ScreenUtil.instance.setSp(16.0)),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              child: Text(
                  "You may exercise certain rights regarding your information processed by us. In particular, you have the right to do the following: (i) you have the right to withdraw consent where you have previously given your consent to the processing of your information; (ii) you have the right to object to the processing of your information if the processing is carried out on a legal basis other than consent; (iii) you have the right to learn if information is being processed by us, obtain disclosure regarding certain aspects of the processing and obtain a copy of the information undergoing processing; (iv) you have the right to verify the accuracy of your information and ask for it to be updated or corrected; (v) you have the right, under certain circumstances, to restrict the processing of your information, in which case, we will not process your information for any purpose other than storing it; (vi) you have the right, under certain circumstances, to obtain the erasure of your Personal Information from us; (vii) you have the right to receive your information in a structured, commonly used and machine readable format and, if technically feasible, to have it transmitted to another controller without any hindrance. This provision is applicable provided that your information is processed by automated means and that the processing is based on your consent, on a contract which you are part of or on pre-contractual obligations thereof.",
                  style: TextStyle(
                      color: MyColor().white,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontFamily: arabic,
                      fontSize: ScreenUtil.instance.setSp(12.0))),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(
                  bottom: ScreenUtil.instance.setWidth(10.0),
                  top: ScreenUtil.instance.setWidth(10.0)),
              child: Text(
                'Billing and payments',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: MyColor().white,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontFamily: arabic,
                    fontSize: ScreenUtil.instance.setSp(16.0)),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              child: Text(
                  "We use third-party payment processors to assist us in processing your payment information securely. Such third-party processors' use of your Personal Information is governed by their respective privacy policies which may or may not contain privacy protections as protective as this Privacy Policy. We suggest that you review their respective privacy policies.",
                  style: TextStyle(
                      color: MyColor().white,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontFamily: arabic,
                      fontSize: ScreenUtil.instance.setSp(12.0))),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(
                  bottom: ScreenUtil.instance.setWidth(10.0),
                  top: ScreenUtil.instance.setWidth(10.0)),
              child: Text(
                'Privacy of children',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: MyColor().white,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontFamily: arabic,
                    fontSize: ScreenUtil.instance.setSp(16.0)),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              child: Text(
                  "We do not knowingly collect any Personal Information from children under the age of 13. If you are under the age of 13, please do not submit any Personal Information through our Mobile Application or Service. We encourage parents and legal guardians to monitor their children's Internet usage and to help enforce this Policy by instructing their children never to provide Personal Information through our Mobile Application or Service without their permission.\n\nIf you have reason to believe that a child under the age of 13 has provided Personal Information to us through our Mobile Application or Service, please contact us. You must also be old enough to consent to the processing of your Personal Information in your country (in some countries we may allow your parent or guardian to do so on your behalf).",
                  style: TextStyle(
                      color: MyColor().white,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontFamily: arabic,
                      fontSize: ScreenUtil.instance.setSp(12.0))),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(
                  bottom: ScreenUtil.instance.setWidth(10.0),
                  top: ScreenUtil.instance.setWidth(10.0)),
              child: Text(
                'Newsletters',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: MyColor().white,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontFamily: arabic,
                    fontSize: ScreenUtil.instance.setSp(16.0)),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              child: Text(
                  "We offer electronic newsletters to which you may voluntarily subscribe at any time. We are committed to keeping your e-mail address confidential and will not disclose your email address to any third parties except as allowed in the information use and processing section. We will maintain the information sent via e-mail in accordance with applicable laws and regulations.\n\nIn compliance with the CAN-SPAM Act, all e-mails sent from us will clearly state who the e-mail is from and provide clear information on how to contact the sender. You may choose to stop receiving our newsletter or marketing emails by following the unsubscribe instructions included in these emails or by contacting us. However, you will continue to receive essential transactional emails.",
                  style: TextStyle(
                      color: MyColor().white,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontFamily: arabic,
                      fontSize: ScreenUtil.instance.setSp(12.0))),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(
                  bottom: ScreenUtil.instance.setWidth(10.0),
                  top: ScreenUtil.instance.setWidth(10.0)),
              child: Text(
                'Affiliates',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: MyColor().white,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontFamily: arabic,
                    fontSize: ScreenUtil.instance.setSp(16.0)),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              child: Text(
                  "We may disclose information about you to our affiliates for the purpose of being able to offer you related or additional products and services. Any information relating to you that we provide to our affiliates will be treated by those affiliates in accordance with the terms of this Privacy Policy.",
                  style: TextStyle(
                      color: MyColor().white,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontFamily: arabic,
                      fontSize: ScreenUtil.instance.setSp(12.0))),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(
                  bottom: ScreenUtil.instance.setWidth(10.0),
                  top: ScreenUtil.instance.setWidth(10.0)),
              child: Text(
                'Links to other mobile applications',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: MyColor().white,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontFamily: arabic,
                    fontSize: ScreenUtil.instance.setSp(16.0)),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              child: Text(
                  "Our Mobile Application contains links to other mobile applications that are not owned or controlled by us. Please be aware that we are not responsible for the privacy practices of such other mobile applications or third-parties. We encourage you to be aware when you leave our Mobile Application and to read the privacy statements of each and every mobile application that may collect Personal Information.",
                  style: TextStyle(
                      color: MyColor().white,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontFamily: arabic,
                      fontSize: ScreenUtil.instance.setSp(12.0))),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(
                  bottom: ScreenUtil.instance.setWidth(10.0),
                  top: ScreenUtil.instance.setWidth(10.0)),
              child: Text(
                'Information security',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: MyColor().white,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontFamily: arabic,
                    fontSize: ScreenUtil.instance.setSp(16.0)),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              child: Text(
                  "We secure information you provide on computer servers in a controlled, secure environment, protected from unauthorized access, use, or disclosure. We maintain reasonable administrative, technical, and physical safeguards in an effort to protect against unauthorized access, use, modification, and disclosure of Personal Information in its control and custody. However, no data transmission over the Internet or wireless network can be guaranteed. Therefore, while we strive to protect your Personal Information, you acknowledge that (i) there are security and privacy limitations of the Internet which are beyond our control; (ii) the security, integrity, and privacy of any and all information and data exchanged between you and our Mobile Application cannot be guaranteed; and (iii) any such information and data may be viewed or tampered with in transit by a third-party, despite best efforts.",
                  style: TextStyle(
                      color: MyColor().white,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontFamily: arabic,
                      fontSize: ScreenUtil.instance.setSp(12.0))),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(
                  bottom: ScreenUtil.instance.setWidth(10.0),
                  top: ScreenUtil.instance.setWidth(10.0)),
              child: Text(
                'Data breach',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: MyColor().white,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontFamily: arabic,
                    fontSize: ScreenUtil.instance.setSp(16.0)),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              child: Text(
                  "In the event we become aware that the security of the Mobile Application has been compromised or users Personal Information has been disclosed to unrelated third parties as a result of external activity, including, but not limited to, security attacks or fraud, we reserve the right to take reasonably appropriate measures, including, but not limited to, investigation and reporting, as well as notification to and cooperation with law enforcement authorities. In the event of a data breach, we will make reasonable efforts to notify affected individuals if we believe that there is a reasonable risk of harm to the user as a result of the breach or if notice is otherwise required by law. When we do, we will send you an email.",
                  style: TextStyle(
                      color: MyColor().white,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontFamily: arabic,
                      fontSize: ScreenUtil.instance.setSp(12.0))),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(
                  bottom: ScreenUtil.instance.setWidth(10.0),
                  top: ScreenUtil.instance.setWidth(10.0)),
              child: Text(
                'Legal disclosure',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: MyColor().white,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontFamily: arabic,
                    fontSize: ScreenUtil.instance.setSp(16.0)),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              child: Text(
                  "We will disclose any information we collect, use or receive if required or permitted by law, such as to comply with a subpoena, or similar legal process, and when we believe in good faith that disclosure is necessary to protect our rights, protect your safety or the safety of others, investigate fraud, or respond to a government request. In the event we go through a business transition, such as a merger or acquisition by another company, or sale of all or a portion of its assets, your user account, and Personal Information will likely be among the assets transferred.",
                  style: TextStyle(
                      color: MyColor().white,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontFamily: arabic,
                      fontSize: ScreenUtil.instance.setSp(12.0))),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(
                  bottom: ScreenUtil.instance.setWidth(10.0),
                  top: ScreenUtil.instance.setWidth(10.0)),
              child: Text(
                'Changes and amendments',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: MyColor().white,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontFamily: arabic,
                    fontSize: ScreenUtil.instance.setSp(16.0)),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              child: Text(
                  "We may update this Privacy Policy from time to time in our discretion and will notify you of any material changes to the way in which we treat Personal Information. When changes are made, we will revise the updated date at the bottom of this page. We may also provide notice to you in other ways in our discretion, such as through contact information you have provided. Any updated version of this Privacy Policy will be effective immediately upon the posting of the revised Privacy Policy unless otherwise specified. Your continued use of the Mobile Application or Services after the effective date of the revised Privacy Policy (or such other act specified at that time) will constitute your consent to those changes. However, we will not, without your consent, use your Personal Data in a manner materially different than what was stated at the time your Personal Data was collected.",
                  style: TextStyle(
                      color: MyColor().white,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontFamily: arabic,
                      fontSize: ScreenUtil.instance.setSp(12.0))),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(
                  bottom: ScreenUtil.instance.setWidth(10.0),
                  top: ScreenUtil.instance.setWidth(10.0)),
              child: Text(
                'Acceptance of this policy',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: MyColor().white,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontFamily: arabic,
                    fontSize: ScreenUtil.instance.setSp(16.0)),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              child: Text(
                  "You acknowledge that you have read this Policy and agree to all its terms and conditions. By using the Mobile Application or its Services you agree to be bound by this Policy. If you do not agree to abide by the terms of this Policy, you are not authorized to use or access the Mobile Application and its Services.",
                  style: TextStyle(
                      color: MyColor().white,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontFamily: arabic,
                      fontSize: ScreenUtil.instance.setSp(12.0))),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(
                  bottom: ScreenUtil.instance.setWidth(10.0),
                  top: ScreenUtil.instance.setWidth(10.0)),
              child: Text(
                'Contacting us',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: MyColor().white,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontFamily: arabic,
                    fontSize: ScreenUtil.instance.setSp(16.0)),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              child: Text(
                  "If you would like to contact us to understand more about this Policy or wish to contact us concerning any matter relating to individual rights and your Personal Information, you may send an email to info@f-intelli.com\n\n\nThis document was last updated on February 17, 2020",
                  style: TextStyle(
                      color: MyColor().white,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontFamily: arabic,
                      fontSize: ScreenUtil.instance.setSp(12.0))),
            ),
          ],
        ),
      ),
    );
  }
}
