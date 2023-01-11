part of 'user_form_bloc.dart';

abstract class UserFormEvent extends Equatable {
  const UserFormEvent();
}

class SearchUser extends UserFormEvent {
  final String keyword;

  const SearchUser(this.keyword);

  @override
  List<Object?> get props => [keyword];
}
