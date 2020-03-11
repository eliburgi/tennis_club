import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class User extends Equatable {
  User({
    @required this.id,
    @required this.name,
  })  : assert(id != null),
        assert(name != null);

  /// Every [User] has its own unique ID.
  ///
  /// Two [User]s are considered to be equal iff they have the same ID.
  final String id;

  /// The user´s name.
  final String name;

  @override
  List<Object> get props => [id];
}
