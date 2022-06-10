import 'package:m_one/domain/core/entity.dart';
import 'package:m_one/domain/core/value_objects.dart';

class User implements IEntity {
  @override
  final UniqueId id;

  User({
    required this.id,
  });

  User copyWith({
    UniqueId? id,
  }) {
    return User(
      id: id ?? this.id,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'User(id: $id)';
}
