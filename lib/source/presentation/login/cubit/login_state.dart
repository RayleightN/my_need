part of 'login_cubit.dart';

@immutable
abstract class LoginState extends Equatable {}

class LoginInitial extends LoginState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class LoginLoaded extends LoginState {
  @override
  List<Object?> get props => throw UnimplementedError();
}
