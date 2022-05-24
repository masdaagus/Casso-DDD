import 'package:flutter/material.dart';

import '../../../core/constant.dart';

class PictureWidget extends StatelessWidget {
  const PictureWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: const EdgeInsets.only(top: dPadding * 3),
        width: size.width * .8,
        child: Image.asset(
          "assets/images/sally.png",
          fit: BoxFit.cover,
          width: size.width,
          height: size.height * .4,
        ),
      ),
    );
  }
}

class CircleWidget1 extends StatelessWidget {
  const CircleWidget1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Positioned(
      left: 32,
      bottom: size.height * .49,
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: biru,
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}

class CircleWidget3 extends StatelessWidget {
  const CircleWidget3({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Positioned(
      left: size.width * .1,
      bottom: size.height * .1,
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: pink,
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}

class CircleWidget2 extends StatelessWidget {
  const CircleWidget2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Positioned(
      right: 8,
      bottom: size.height * .21,
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          color: abu,
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}
