import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_autocomplete/user_form/bloc/user_form_bloc.dart';

class UserFormScreen extends StatelessWidget {
  const UserFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserFormBloc(),
      child: const UserFormView(),
    );
  }
}

class UserFormView extends StatelessWidget {
  const UserFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Form'),
      ),
      body: BlocListener<UserFormBloc, UserFormState>(
        listener: (context, state) {
          if(state is UserFormSearchNotFound){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('User tidak ditemukan')));
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextFormField(
                controller: context.read<UserFormBloc>().noRek,
                decoration: InputDecoration(
                  labelText: 'No. Rekening',
                  hintText: 'Masukan No. Rekening anda',
                ),
                onChanged: (v) {
                  context.read<UserFormBloc>().add(SearchUser(v ?? ''));
                },
              ),
              TextFormField(
                controller: context.read<UserFormBloc>().penerima,
                decoration: InputDecoration(
                  labelText: 'Penerima',
                  hintText: 'Masukan Nama Penerima',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
