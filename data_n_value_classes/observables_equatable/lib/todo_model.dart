import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

@immutable
class TodoModel extends Equatable {
  // const default values and non const default values
  TodoModel({required this.name, required this.description, this.done = false})
      : uuid = const Uuid().v4();

  final String uuid;

  final String name;

  final String description;

  final bool done;

  @override
  List<Object> get props => [done, uuid, name, description];

  @override
  bool get stringify => true;

  // every immutable gets a copyWith method
  TodoModel copyWith({
    bool? done,
    String? name,
    String? description,
  }) {
    return TodoModel(
      done: done ?? this.done,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }
}
