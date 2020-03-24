import 'package:fillproject/components/constants/fontsConstants.dart';
import 'package:fillproject/components/constants/myColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Terms extends StatelessWidget {
  const Terms({Key key}) : super(key: key);

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
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin:
                    EdgeInsets.only(bottom: ScreenUtil.instance.setWidth(20.0)),
                child: Text(
                  'Terms and conditions',
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
                    'These terms and conditions ("Terms", "Agreement") are an agreement between Intelligent Function LLC ("Intelligent Function LLC", "us", "we" or "our") and you ("User", "you" or "your"). This Agreement sets forth the general terms and conditions of your use of the Fill mobile application and any of its products or services (collectively, "Mobile Application" or "Services").',
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
                  'Accounts and membership',
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
                    'If you create an account in the Mobile Application, you are responsible for maintaining the security of your account and you are fully responsible for all activities that occur under the account and any other actions taken in connection with it. We may, but have no obligation to, monitor and review new accounts before you may sign in and use our Services. Providing false contact information of any kind may result in the termination of your account. You must immediately notify us of any unauthorized uses of your account or any other breaches of security. We will not be liable for any acts or omissions by you, including any damages of any kind incurred as a result of such acts or omissions. We may suspend, disable, or delete your account (or any part thereof) if we determine that you have violated any provision of this Agreement or that your conduct or content would tend to damage our reputation and goodwill. If we delete your account for the foregoing reasons, you may not re-register for our Services. We may block your email address and Internet protocol address to prevent further registration.',
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
                    "You shall pay all fees or charges to your account in accordance with the fees, charges, and billing terms in effect at the time a fee or charge is due and payable. If, in our judgment, your purchase constitutes a high-risk transaction, we will require you to provide us with a copy of your valid government-issued photo identification, and possibly a copy of a recent bank statement for the credit or debit card used for the purchase. We reserve the right to change products and product pricing at any time. We also reserve the right to refuse any order you place with us. We may, in our sole discretion, limit or cancel quantities purchased per person, per household or per order. These restrictions may include orders placed by or under the same customer account, the same credit card, and/or orders that use the same billing and/or shipping address. In the event that we make a change to or cancel an order, we may attempt to notify you by contacting the e-mail and/or billing address/phone number provided at the time the order was made.",
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
                  'Accuracy of information',
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
                    "Occasionally there may be information in the Mobile Application that contains typographical errors, inaccuracies or omissions that may relate to product descriptions, pricing, availability, promotions and offers. We reserve the right to correct any errors, inaccuracies or omissions, and to change or update information or cancel orders if any information in the Mobile Application or on any related Service is inaccurate at any time without prior notice (including after you have submitted your order). We undertake no obligation to update, amend or clarify information in the Mobile Application including, without limitation, pricing information, except as required by law. No specified update or refresh date applied in the Mobile Application should be taken to indicate that all information in the Mobile Application or on any related Service has been modified or updated.",
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
                  'Backups',
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
                    "We are not responsible for Content residing in the Mobile Application. In no event shall we be held liable for any loss of any Content. It is your sole responsibility to maintain appropriate backup of your Content. Notwithstanding the foregoing, on some occasions and in certain circumstances, with absolutely no obligation, we may be able to restore some or all of your data that has been deleted as of a certain date and time when we may have backed up data for our own purposes. We make no guarantee that the data you need will be available.",
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
                    'Although this Mobile Application may link to other mobile applications, we are not, directly or indirectly, implying any approval, association, sponsorship, endorsement, or affiliation with any linked mobile application, unless specifically stated herein. Some of the links in the Mobile Application may be "affiliate links". This means if you click on the link and purchase an item, Intelligent Function LLC will receive an affiliate commission. We are not responsible for examining or evaluating, and we do not warrant the offerings of, any businesses or individuals or the content of their mobile applications. We do not assume any responsibility or liability for the actions, products, services, and content of any other third-parties. You should carefully review the legal statements and other conditions of use of any mobile application which you access through a link from this Mobile Application. Your linking to any other off-site mobile applications is at your own risk.',
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
                  'Prohibited uses',
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
                    "In addition to other terms as set forth in the Agreement, you are prohibited from using the Mobile Application or its Content: (a) for any unlawful purpose; (b) to solicit others to perform or participate in any unlawful acts; (c) to violate any international, federal, provincial or state regulations, rules, laws, or local ordinances; (d) to infringe upon or violate our intellectual property rights or the intellectual property rights of others; (e) to harass, abuse, insult, harm, defame, slander, disparage, intimidate, or discriminate based on gender, sexual orientation, religion, ethnicity, race, age, national origin, or disability; (f) to submit false or misleading information; (g) to upload or transmit viruses or any other type of malicious code that will or may be used in any way that will affect the functionality or operation of the Service or of any related mobile application, other mobile applications, or the Internet; (h) to collect or track the personal information of others; (i) to spam, phish, pharm, pretext, spider, crawl, or scrape; (j) for any obscene or immoral purpose; or (k) to interfere with or circumvent the security features of the Service or any related mobile application, other mobile applications, or the Internet. We reserve the right to terminate your use of the Service or any related mobile application for violating any of the prohibited uses.",
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
                  'Intellectual property rights',
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
                    "This Agreement does not transfer to you any intellectual property owned by Intelligent Function LLC or third-parties, and all rights, titles, and interests in and to such property will remain (as between the parties) solely with Intelligent Function LLC. All trademarks, service marks, graphics and logos used in connection with our Mobile Application or Services, are trademarks or registered trademarks of Intelligent Function LLC or Intelligent Function LLC licensors. Other trademarks, service marks, graphics and logos used in connection with our Mobile Application or Services may be the trademarks of other third-parties. Your use of our Mobile Application and Services grants you no right or license to reproduce or otherwise use any Intelligent Function LLC or third-party trademarks.",
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
                  'Limitation of liability',
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
                    "To the fullest extent permitted by applicable law, in no event will Intelligent Function LLC, its affiliates, officers, directors, employees, agents, suppliers or licensors be liable to any person for (a): any indirect, incidental, special, punitive, cover or consequential damages (including, without limitation, damages for lost profits, revenue, sales, goodwill, use of content, impact on business, business interruption, loss of anticipated savings, loss of business opportunity) however caused, under any theory of liability, including, without limitation, contract, tort, warranty, breach of statutory duty, negligence or otherwise, even if Intelligent Function LLC has been advised as to the possibility of such damages or could have foreseen such damages. To the maximum extent permitted by applicable law, the aggregate liability of Intelligent Function LLC and its affiliates, officers, employees, agents, suppliers and licensors, relating to the services will be limited to an amount greater of one dollar or any amounts actually paid in cash by you to Intelligent Function LLC for the prior one month period prior to the first event or occurrence giving rise to such liability. The limitations and exclusions also apply if this remedy does not fully compensate you for any losses or fails of its essential purpose.",
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
                  'Severability',
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
                    "All rights and restrictions contained in this Agreement may be exercised and shall be applicable and binding only to the extent that they do not violate any applicable laws and are intended to be limited to the extent necessary so that they will not render this Agreement illegal, invalid or unenforceable. If any provision or portion of any provision of this Agreement shall be held to be illegal, invalid or unenforceable by a court of competent jurisdiction, it is the intention of the parties that the remaining provisions or portions thereof shall constitute their agreement with respect to the subject matter hereof, and all such remaining provisions or portions thereof shall remain in full force and effect.",
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
                  'Dispute resolution',
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
                    "The formation, interpretation, and performance of this Agreement and any disputes arising out of it shall be governed by the substantive and procedural laws of Saudi Arabia without regard to its rules on conflicts or choice of law and, to the extent applicable, the laws of Saudi Arabia. The exclusive jurisdiction and venue for actions related to the subject matter hereof shall be the courts located in Saudi Arabia, and you hereby submit to the personal jurisdiction of such courts. You hereby waive any right to a jury trial in any proceeding arising out of or related to this Agreement. The United Nations Convention on Contracts for the International Sale of Goods does not apply to this Agreement.",
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
                    "We reserve the right to modify this Agreement or its policies relating to the Mobile Application or Services at any time, effective upon posting of an updated version of this Agreement in the Mobile Application. When we do, we will revise the updated date at the bottom of this page. Continued use of the Mobile Application after any such changes shall constitute your consent to such changes.",
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
                  'Acceptance of these terms',
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
                    "You acknowledge that you have read this Agreement and agree to all its terms and conditions. By using the Mobile Application or its Services you agree to be bound by this Agreement. If you do not agree to abide by the terms of this Agreement, you are not authorized to use or access the Mobile Application and its Services.",
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
                    "If you would like to contact us to understand more about this Agreement or wish to contact us concerning any matter relating to it, you may send an email to info@f-intelli.com",
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
      ),
    );
  }
}
