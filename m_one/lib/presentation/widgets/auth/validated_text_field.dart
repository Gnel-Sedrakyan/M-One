import 'dart:developer';

import 'package:m_one/presentation/core/constants/constants.dart';
import 'package:flutter/material.dart';

class ValidatedTextField extends StatefulWidget {
  const ValidatedTextField({
    Key? key,
    required this.onChanged,
    required this.validator,
    required this.labelText,
    required this.showErrors,
  }) : super(key: key);

  final Function(String) onChanged;
  final String? Function() validator;
  final String? labelText;
  final bool showErrors;

  @override
  State<ValidatedTextField> createState() => _ValidatedTextFieldState();
}

class _ValidatedTextFieldState extends State<ValidatedTextField> {
  String? errorText;
  bool get hasError => errorText == null ? false : widget.showErrors;

  final Curve curve = Curves.bounceOut;
  final double deltaX = 20;
  final Duration duration = const Duration(milliseconds: 200);

  @override
  void initState() {
    super.initState();
    setState(() {
      errorText = widget.validator();
    });
  }

  @override
  Widget build(BuildContext context) {
    onChangeHandler(String e) async {
      widget.onChanged(e);
      setState(() {
        errorText = widget.validator();
      });
    }

    /// convert 0-1 to 0-1-0
    double shake(double animation) =>
        2 * (0.5 - (0.5 - curve.transform(animation)).abs());

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        children: [
          SizedBox(
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: hasError
                            ? Theme.of(context).colorScheme.error
                            : Colors.grey,
                        width: 2),
                    borderRadius: BorderRadius.circular(defaultBorderRadius)),

                hintText: widget.labelText,
                // labelText: labelText,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: hasError
                          ? Theme.of(context).colorScheme.error
                          : Theme.of(context).colorScheme.primary),
                  borderRadius: BorderRadius.circular(defaultBorderRadius),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(defaultBorderRadius),
                ),
              ),
              autocorrect: false,
              onChanged: onChangeHandler,
            ),
          ),
          if (hasError)
            Column(
              children: [
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 20),
                    TweenAnimationBuilder<double>(
                      tween: Tween(begin: 0.0, end: 1.0),
                      duration: duration,
                      builder: (context, animation, child) =>
                          Transform.translate(
                        offset: Offset(deltaX * shake(animation), 0),
                        child: child,
                      ),
                      child: AnimatedSwitcher(
                        duration: duration,
                        transitionBuilder:
                            (Widget child, Animation<double> animation) {
                          return SlideTransition(
                            child: child,
                            position: Tween<Offset>(
                                    begin: Offset(-0.3, -1.0),
                                    end: Offset(0.0, 0.0))
                                .animate(animation),
                          );
                        },
                        child: Text(
                          errorText!,
                          key: ValueKey<String>(errorText!),
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.error,
                              fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
        ],
      ),
    );
  }
}
