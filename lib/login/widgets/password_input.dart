import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gazprom_test/login/bloc/login_bloc.dart';

class PasswordInput extends StatefulWidget {
  const PasswordInput({super.key});

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _isHidden = true;
  @override
  Widget build(BuildContext context) {
    final loginBloc = context.read<LoginBloc>();
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
      child: TextField(
        keyboardType: TextInputType.visiblePassword,
        obscureText: _isHidden,
        decoration: InputDecoration(
          labelText: 'Пароль',
          suffixIcon: IconButton(
            onPressed: () => setState(() {
              _isHidden = !_isHidden;
            }),
            icon: ImageIcon(
              AssetImage(_isHidden
                  ? 'assets/icons/eye.png'
                  : 'assets/icons/eye-off.png'),
              color: const Color.fromRGBO(7, 0, 255, 1),
            ),
          ),
        ),
        onChanged: (value) => loginBloc.add(PasswordChanged(password: value)),
      ),
    );
  }
}
