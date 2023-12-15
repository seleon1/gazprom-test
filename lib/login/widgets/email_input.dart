import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gazprom_test/login/bloc/login_bloc.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({super.key});

  @override
  Widget build(BuildContext context) {
    final loginBloc = context.read<LoginBloc>();
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(labelText: 'Email'),
        onChanged: (value) => loginBloc.add(EmailChanged(email: value)),
      ),
    );
  }
}
