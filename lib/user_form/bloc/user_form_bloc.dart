import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:search_autocomplete/user_form/model/user.dart';

part 'user_form_event.dart';

part 'user_form_state.dart';

class UserFormBloc extends Bloc<UserFormEvent, UserFormState> {
  UserFormBloc() : super(UserFormInitial()) {
    on<SearchUser>((event, emit) {
      if(event.keyword.length >= 5){
        emit(UserFormLoading());
        final allPenerima =
        listPenerima.map<User>((e) => User.fromJson(e)).toList();
        final search = allPenerima
            .where((e) => e.norek.toLowerCase() == event.keyword.toLowerCase());

        if (search.isNotEmpty) {
          final userFound = search.first;
          penerima.text = userFound.penerima;
          emit(UserFormSearchFound());
        }else{
          penerima.text = '';
          emit(UserFormSearchNotFound());
        }
        emit(UserFormLoaded());
      }

    });
  }

  final noRek = TextEditingController();
  final penerima = TextEditingController();

  final listPenerima = [
    {"norek": "12345", "penerima": "wandy"},
    {"norek": "12346", "penerima": "susi"},
    {"norek": "12347", "penerima": "reni"},
  ];
}
