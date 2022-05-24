import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../aplication/auth/sign_in_form/sign_in_form_bloc.dart';
import '../../../injection.dart';
import 'components/sign_in_form_widget.dart';
import 'style/style_widget.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Stack(
        children: [
          PictureWidget(),
          CircleWidget1(),
          CircleWidget2(),
          CircleWidget3(),
          BlocProvider(
            create: (context) => getIt<SignInFormBloc>(),
            child: SignInFormWidget(),
          ),
        ],
      ),
    );
  }
}
