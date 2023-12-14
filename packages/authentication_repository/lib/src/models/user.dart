import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({required this.id, required this.email});

  final String id, email;

  static const empty = User(id: '', email: '');

  bool get isEmpty => this == User.empty;

  bool get isNotEmpty => this != User.empty;

  @override
  List<Object?> get props => [id, email];
}
