import 'package:casso/presentation/core/constant.dart';
import 'package:flutter/material.dart';

class EmailFormField extends StatelessWidget {
  const EmailFormField({
    Key? key,
    this.validator,
    this.onChanged,
  }) : super(key: key);

  final FormFieldValidator<String>? validator;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: dPadding * 2),
      child: Container(
        decoration: BoxDecoration(
            // gradient: LinearGradient(
            //   colors: [
            //     lightColor,
            //     biru.withOpacity(.1),
            //   ],
            //   begin: Alignment.topLeft,
            //   end: Alignment.bottomRight,
            // ),
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
          validator: validator,
          onChanged: onChanged,
          decoration: InputDecoration(
              isDense: true,
              labelText: 'Email or ID',
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.person_outline_outlined,
                size: dPadding * 1.5,
              ),
              labelStyle: TextStyle(
                fontFamily: ubuntu,
                fontSize: dPadding / 1.1,
              )),
        ),
      ),
    );
  }
}
