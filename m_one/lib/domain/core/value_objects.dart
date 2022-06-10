import 'package:dartz/dartz.dart';
import 'package:m_one/domain/core/value_validators.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';
import 'package:m_one/domain/core/common_interfaces.dart';
import 'package:m_one/domain/core/errors.dart';
import 'package:m_one/domain/core/failures.dart';

@immutable
abstract class ValueObject<T> implements IValidatable {
  const ValueObject();
  Either<ValueFailure<T>, T> get value;

  /// Throws [UnexpectedValueError] containing the [ValueFailure]
  T getOrCrash() {
    // id = identity - same as writing (right) => right
    return value.fold((f) => throw UnexpectedValueError(f), id);
  }

  T getOrElse(T dflt) {
    return value.getOrElse(() => dflt);
  }

  Either<ValueFailure<dynamic>, Unit> get failureOrUnit {
    return value.fold(
      (l) => left(l),
      (r) => right(unit),
    );
  }

  @override
  bool isValid() {
    return value.isRight();
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ValueObject<T> && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value($value)';
}

class UniqueId extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  // We cannot let a simple String be passed in. This would allow for possible non-unique IDs.
  factory UniqueId() {
    return UniqueId._(
      right(const Uuid().v1()),
    );
  }

  /// Used with strings we trust are unique, such as database IDs.
  factory UniqueId.fromUniqueString(String uniqueIdStr) {
    return UniqueId._(
      right(uniqueIdStr),
    );
  }

  const UniqueId._(this.value);
}

class RefreshToken extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory RefreshToken(String input) {
    return RefreshToken._(
      validateSingleLine(input),
    );
  }

  const RefreshToken._(this.value);
}

class AccessToken extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory AccessToken(String input) {
    return AccessToken._(
      validateSingleLine(input),
    );
  }

  const AccessToken._(this.value);
}
