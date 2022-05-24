import 'package:casso/presentation/core/constant.dart';
import 'package:flutter/material.dart';

class PasswordFormField extends StatefulWidget {
  const PasswordFormField(
      {Key? key, this.validator, this.onChanged, this.validate = false})
      : super(key: key);

  final FormFieldValidator<String>? validator;
  final Function(String)? onChanged;
  final bool validate;

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool obsVal = true;
  void obs() {
    setState(() {
      obsVal = !obsVal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: dPadding * 2),
      child: Container(
        decoration: BoxDecoration(
            color: lightColor,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                color: darkColor.withOpacity(.16),
                offset: const Offset(4, 4),
              ),
            ]),
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: TextInputType.emailAddress,
          validator: widget.validator,
          onChanged: widget.onChanged,
          obscureText: obsVal,
          decoration: InputDecoration(
            suffixIcon: GestureDetector(
              onTap: obs,
              child: Container(
                color: Colors.transparent,
                padding: const EdgeInsets.only(right: dPadding),
                child: Icon(Icons.remove_red_eye, size: dPadding * 1.5),
              ),
            ),
            isDense: true,
            labelText: widget.validate ? 'Confirm Password' : 'Password',
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.lock_outline,
              size: dPadding * 1.5,
            ),
            labelStyle: TextStyle(
              fontFamily: ubuntu,
              fontSize: dPadding / 1.1,
            ),
          ),
        ),
      ),
    );
  }
}
