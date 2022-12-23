import 'package:equatable/equatable.dart';

class UserInformation extends Equatable {
  final String? id;
  final String? email;
  final String? phone;
  final String? displayName;

  const UserInformation({
    this.id,
    this.email,
    this.phone,
    this.displayName,
  });

  @override
  List<dynamic> get props => [id, email, phone, displayName];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'phone': phone,
      'displayName': displayName,
    };
  }
}
