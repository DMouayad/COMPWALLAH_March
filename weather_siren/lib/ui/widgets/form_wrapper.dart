import 'dart:math';

import 'package:flutter/material.dart';
import 'package:weather_siren/ui/utils/context_extensions.dart';

class FormWrapper extends StatelessWidget {
  const FormWrapper({
    super.key,
    required this.children,
    required this.formKey,
    this.width,
    this.height,
  });
  final List<Widget> children;
  final double? width;
  final double? height;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Center(
        child: Container(
          constraints: BoxConstraints.tight(Size(
            width ?? min(560, context.screenWidth),
            height ?? max(context.screenHeight * .5, 400.0),
          )),
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 18),
          margin: const EdgeInsets.symmetric(vertical: 30),
          child: ListView.custom(
            padding:
                EdgeInsets.symmetric(horizontal: context.horizontalMargins),
            shrinkWrap: true,
            childrenDelegate: SliverChildListDelegate.fixed(children),
          ),
        ),
      ),
    );
  }
}
