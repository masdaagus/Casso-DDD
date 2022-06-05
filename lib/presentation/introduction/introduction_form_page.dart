import 'dart:ui';

import 'package:casso/presentation/introduction/widgets/intro_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer';
import '../../aplication/auth/introduction_form/introduction_bloc.dart';
import '../../injection.dart';
import '../core/constant.dart';
import '../home/home_page.dart';
import 'widgets/intro_button.dart';

class IntroductionFormPage extends StatelessWidget {
  const IntroductionFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log('in IntroductionFormPage');
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => getIt<IntroductionBloc>(),
      child: Scaffold(
        backgroundColor: lightColor,
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(48),
              height: size.height * .5,
              color: darkColor,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  "assets/images/robo.png",
                  fit: BoxFit.cover,
                  height: size.height * .3,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: size.height * .5,
                padding: const EdgeInsets.symmetric(
                  vertical: dPadding * 2,
                  horizontal: dPadding,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(dPadding),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 35, sigmaY: 35),
                    child: Container(
                      padding: const EdgeInsets.all(dPadding),
                      decoration: BoxDecoration(
                        color: white.withOpacity(.45),
                        borderRadius: BorderRadius.circular(dPadding),
                      ),
                      child: BlocConsumer<IntroductionBloc, IntroductionState>(
                        listener: (context, state) {
                          // TODO: implement listener
                        },
                        builder: (context, state) {
                          final bloc = context.read<IntroductionBloc>();
                          return Column(
                            children: [
                              TextFormFieldIntroduction(
                                labeltext: 'Nama Resto',
                                icon: Icons.store_outlined,
                                onChanged: (val) {
                                  bloc.add(IntroductionEvent.restoName(val));
                                },
                              ),
                              TextFormFieldIntroduction(
                                labeltext: 'Lokasi Resto',
                                icon: Icons.location_city_outlined,
                                onChanged: (val) {
                                  bloc.add(
                                      IntroductionEvent.restoLocation(val));
                                },
                              ),
                              TextFormFieldIntroduction(
                                labeltext: 'Jumlah Meja Resto',
                                icon: Icons.table_bar,
                                onChanged: (val) {
                                  bloc.add(IntroductionEvent.restoTable(val));
                                },
                              ),
                              SizedBox(height: dPadding),
                              IntroButton(onTap: () {
                                bloc.add(IntroductionEvent.createResto());
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => HomePage(),
                                //   ),
                                // );
                              }),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
