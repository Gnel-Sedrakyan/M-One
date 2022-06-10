import 'package:dartz/dartz.dart';
import 'package:m_one/domain/core/failures.dart';

Either<ValueFailure<String>, String> validateUsername(String input) {
  const usernameRegex = r"""(.*)""";
  if (RegExp(usernameRegex).hasMatch(input)) {
    return right(input);
  }
  return left(ValueFailure.invalidUsername(failedValue: input));
}

Either<ValueFailure<String>, String> validateEmail(String input) {
  const uid = r"""^[0-9]{1,7}$""";
  if (RegExp(uid).hasMatch(input)) {
    return right(input);
  }
  return left(ValueFailure.invalidEmail(failedValue: input));
}

Either<ValueFailure<String>, String> validatePassword(String input) {
  const twoUppercaseLettersRegex = r"""(?=.*[A-Z].*[A-Z])""";
  const oneSpecialcaseLetterRegex = r"""(?=.*[!@#$&*])""";
  const twoDigitsRegex = r"""(?=.*[0-9].*[0-9])""";
  const threeLowercaseLettersRegex = r"""(?=.*[a-z].*[a-z].*[a-z])""";
  if (RegExp(twoUppercaseLettersRegex).hasMatch(input)) {
    return left(ValueFailure.hasNoTwoUppercaseLetters(failedValue: input));
  }
  if (RegExp(oneSpecialcaseLetterRegex).hasMatch(input)) {
    return left(ValueFailure.hasNoSpecialcaseLetters(failedValue: input));
  }
  if (RegExp(twoDigitsRegex).hasMatch(input)) {
    return left(ValueFailure.hasNoTwoDigitsRegex(failedValue: input));
  }
  if (RegExp(threeLowercaseLettersRegex).hasMatch(input)) {
    return left(
      ValueFailure.hasNoThreeLowercaseLettersRegex(failedValue: input),
    );
  }
  return right(input);
}
