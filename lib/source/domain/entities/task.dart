import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final String? id;
  final String? title;
  final String? content;
  const Task({this.id, this.title, this.content});

  @override
  List<Object?> get props => [id, title, content];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
    };
  }
}
