
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/colors.dart';
import '../widgets/appbar_widget.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: 'Service'),
      body: buildBody(),
    );
  }

  buildBody() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'HELP CENTER',
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: blueGreen),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                openMail();
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.mailBulk,
                        color: Color(0xffbb001b),
                        size: 50,
                      ),
                      const SizedBox(height: 40),
                      Column(
                        children: [
                          Text(
                            'Gmail : ',
                            style: TextStyle(
                                color: blueGreen,
                                fontSize: 20,
                                letterSpacing: 2,
                                fontStyle: FontStyle.italic),
                          ),
                          Text(
                            'viswa.technologysolution@gmail.com',
                            style: TextStyle(
                                color: blueGreen,
                                fontSize: 18,
                                fontStyle: FontStyle.italic),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                openWhatsappChat();
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.whatsapp,
                        color: Color(0xff4fce5d),
                        size: 50,
                      ),
                      const SizedBox(height: 40),
                      RichText(
                          text: TextSpan(
                              text: 'Whatsapp : ',
                              style: TextStyle(
                                  color: blueGreen,
                                  fontSize: 20,
                                  letterSpacing: 2,
                                  fontStyle: FontStyle.italic),
                              children: [
                            TextSpan(
                              text: '7867997754',
                              style: TextStyle(
                                  color: blueGreen,
                                  fontSize: 20,
                                  fontStyle: FontStyle.italic),
                            )
                          ]))
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        launch("tel://+917867997754");
                      },
                      child: FaIcon(
                        FontAwesomeIcons.phone,
                        color: Colors.blue,
                        size: 50,
                      ),
                    ),
                    const SizedBox(height: 40),
                    RichText(
                        text: TextSpan(
                            text: 'Phone : ',
                            style: TextStyle(
                                color: blueGreen,
                                fontSize: 20,
                                letterSpacing: 2,
                                fontStyle: FontStyle.italic),
                            children: [
                          TextSpan(
                            text: '7867997754',
                            style: TextStyle(
                                color: blueGreen,
                                fontSize: 20,
                                fontStyle: FontStyle.italic),
                          )
                        ]))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void openWhatsappChat() async {
    var url = 'https://wa.me/+917867997754';
    await launch(url);
  }

  openMail() async {
    var url = Uri.parse("mailto:viswa.technologysolution@gmail.com");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
