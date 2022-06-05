import 'package:casso/presentation/core/constant.dart';
import 'package:flutter/material.dart';

import 'introduction_form_page.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColor,
      body: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: lightColor,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Center(
              child: Container(
                width: size.width * .8,
                margin: const EdgeInsets.only(top: 160),
                // child: Lottie.asset("assets/lottie/resto-guy-vespa.json"),
              ),
            ),
            SizedBox(height: 100),
            Text(
              "Selamat Datang di Casso",
              style: TextStyle(
                  color: darkColor.withOpacity(.8),
                  fontSize: 24,
                  fontFamily: "Ubuntu",
                  fontWeight: FontWeight.w600,
                  letterSpacing: -.5),
            ),
            SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.all(24),
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: "Sebelum kita memulai ",
                        style: TextStyle(
                          color: darkColor,
                          fontFamily: "Ubuntu",
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        )),
                    TextSpan(
                      text: "Casso ",
                      style: TextStyle(
                        color: biru,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Ubuntu",
                      ),
                    ),
                    TextSpan(
                      text:
                          "ada beberapa hal yang harus di isi nih, nanti kamu bisa melakukan perubahan sesuai kebutuhan kamu",
                      style: TextStyle(
                        color: darkColor,
                        fontFamily: "Ubuntu",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),
            Container(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => IntroductionFormPage()),
                    ),
                  );
                },
                child: Text(
                  "Let's Goo",
                  style: TextStyle(
                    color: darkColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontFamily: "Montserrat",
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  primary: biru.withOpacity(.8),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
