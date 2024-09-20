import 'package:flutter/material.dart';
import 'package:qube/core/widgets/dot_icon.dart';
import 'package:qube/core/widgets/gradient_wrapper.dart';

typedef Validator = String? Function(String? key);

class QubeTextFormField extends StatefulWidget {
  const QubeTextFormField({
    super.key,
    this.hintText,
    this.validator,
  });

  final String? hintText;
  final Validator? validator;

  @override
  State<QubeTextFormField> createState() => _QubeTextFormFieldState();
}

class _QubeTextFormFieldState extends State<QubeTextFormField> {
  final focusNode = FocusNode();
  final controller = TextEditingController();
  String? hintText;
  Color? mainColor;

  @override
  void initState() {
    hintText = widget.hintText;
    focusNode.addListener(
      () {
        setState(() {});
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        GradientWrapper(
          gradient: _gradient,
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(12.5),
            ),
            child: const SizedBox(
              height: 50,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            focusNode: focusNode,
            controller: controller,
            validator: (value) {
              hintText = widget.validator?.call(value);
              setState(() {
                if (hintText == null) {
                  mainColor = null;
                } else {
                  controller.clear();
                  mainColor = Theme.of(context).colorScheme.error;
                }
              });
              return null;
            },
            decoration: InputDecoration(
              hintText: hintText ?? widget.hintText,
              prefixIconConstraints: const BoxConstraints(),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: DotIcon.filled(
                  color: mainColor,
                  size: 16,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  LinearGradient? get _gradient {
    if (mainColor != null) {
      return LinearGradient(
        colors: [
          mainColor!,
          mainColor!,
        ],
      );
    }
    if (controller.text.isNotEmpty || focusNode.hasFocus) {
      return null;
    }

    return LinearGradient(
      colors: [
        Theme.of(context).colorScheme.outline,
        Theme.of(context).colorScheme.outline
      ],
    );
  }
}
