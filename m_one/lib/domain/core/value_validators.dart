import 'package:dartz/dartz.dart';
import 'package:m_one/domain/core/failures.dart';

Either<ValueFailure<String>, String> validateUsername(String input) {
  if (input.isEmpty) {
    return left(ValueFailure.unfilledUsername(failedValue: input));
  }
  return right(input);
}

Either<ValueFailure<String>, String> validateEmail(String input) {
  const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (input.isEmpty) {
    return left(ValueFailure.unfilledEmail(failedValue: input));
  }
  if (!RegExp(emailRegex).hasMatch(input)) {
    return left(ValueFailure.invalidEmail(failedValue: input));
  }
  return right(input);
}

Either<ValueFailure<String>, String> validatePassword(String input) {
  const threeLowercaseLettersRegex = r"""(?=.*[a-z].*[a-z].*[a-z])""";
  const twoUppercaseLettersRegex = r"""(?=.*[A-Z].*[A-Z])""";
  const twoDigitsRegex = r"""(?=.*[0-9].*[0-9])""";
  const oneSpecialcaseLetterRegex = r"""(?=.*[!@#$&*])""";

  if (!RegExp(threeLowercaseLettersRegex).hasMatch(input)) {
    return left(
      ValueFailure.hasNoThreeLowercaseLettersRegex(failedValue: input),
    );
  }
  if (!RegExp(twoUppercaseLettersRegex).hasMatch(input)) {
    return left(ValueFailure.hasNoTwoUppercaseLetters(failedValue: input));
  }
  if (!RegExp(twoDigitsRegex).hasMatch(input)) {
    return left(ValueFailure.hasNoTwoDigitsRegex(failedValue: input));
  }
  if (!RegExp(oneSpecialcaseLetterRegex).hasMatch(input)) {
    return left(ValueFailure.hasNoSpecialcaseLetters(failedValue: input));
  }

  return right(input);
}

Either<ValueFailure<String>, String> validateSingleLine(String input) {
  if (input.contains('\n')) {
    return left(ValueFailure.multiline(failedValue: input));
  } else {
    return right(input);
  }
}
