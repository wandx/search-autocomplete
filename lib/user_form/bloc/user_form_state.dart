part of 'user_form_bloc.dart';

abstract class UserFormState extends Equatable {
  const UserFormState();
}

class UserFormInitial extends UserFormState {
  @override
  List<Object> get props => [];
}

class UserFormLoading extends UserFormState {
  @override
  List<Object> get props => [];
}

class UserFormLoaded extends UserFormState {
  @override
  List<Object> get props => [];
}

class UserFormSearchFound extends UserFormState {
  @override
  List<Object> get props => [];
}

class UserFormSearchNotFound extends UserFormState {
  @override
  List<Object> get props => [];
}