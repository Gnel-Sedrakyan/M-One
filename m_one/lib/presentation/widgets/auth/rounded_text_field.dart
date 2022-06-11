import 'package:m_one/presentation/core/constants/constants.dart';
import 'package:flutter/material.dart';

class RoundedTextField extends StatelessWidget {
  const RoundedTextField({
    Key? key,
    required this.onChanged,
    required this.validator,
    required this.labelText,
  }) : super(key: key);

  final Function(String) onChanged;
  final String? Function(String?)? validator;
  final String? labelText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
        decoration: InputDecoration(
          errorStyle: const TextStyle(color: Colors.green),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(defaultBorderRadius)),

          hintText: labelText,
          // labelText: labelText,
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.primary),
            borderRadius: BorderRadius.circular(defaultBorderRadius),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(defaultBorderRadius),
          ),
        ),
        autocorrect: false,
        onChanged: onChanged,
        validator: validator,
      ),
    );
  }
}
