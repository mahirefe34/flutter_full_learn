import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({super.key, this.controller});
  final TextEditingController? controller;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  final _obsecureCharacter = '#';
  final _hintText = 'Password';
  bool _isSecure = false;

  void _changeVisibility() {
    setState(() {
      _isSecure = !_isSecure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      autofillHints: const [AutofillHints.password],
      keyboardType: TextInputType.visiblePassword,
      obscureText: _isSecure,
      obscuringCharacter: _obsecureCharacter,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        hintText: _hintText,
        suffix: _onVisibilityIconButton(),
      ),
    );
  }

  IconButton _onVisibilityIconButton() {
    return IconButton(
      onPressed: _changeVisibility,
      icon: AnimatedCrossFade(
          firstChild: const Icon(Icons.visibility_outlined),
          secondChild: const Icon(Icons.visibility_off_outlined),
          crossFadeState:
              _isSecure ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: const Duration(milliseconds: 500)),
      /* icon: Icon(_isSecure
          ? Icons.visibility_outlined
          : Icons.visibility_off_outlined), */
    );
  }
}
