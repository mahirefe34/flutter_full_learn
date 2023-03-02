import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_full_learn/202/image_learn_202.dart';
import 'package:flutter_full_learn/404/bloc/feature/login/service/login_service.dart';
import 'package:kartal/kartal.dart';

import '../../../product/service/reqres_network_manager.dart';
import '../cubit/login_cubit.dart';
import '../cubit/login_cubit_state.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _loginText = 'Login';
  final GlobalKey<FormState> _formLoginKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(LoginService(ReqresNetworkManager())),
      child: Scaffold(
        appBar: AppBar(
          title: BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return state.isLoading
                  ? CircularProgressIndicator(
                      color: context.colorScheme.error,
                    )
                  : const SizedBox.shrink();
            },
          ),
        ),
        body: Form(
            key: _formLoginKey,
            autovalidateMode: AutovalidateMode.always,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  _LoginEmailPasswordField(
                    emailController: _emailController,
                    passwordController: _passwordController,
                  ),
                  _LoginButton(
                      formLoginKey: _formLoginKey,
                      emailController: _emailController,
                      passwordController: _passwordController,
                      loginText: _loginText),
                ],
              ),
            )),
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({
    required GlobalKey<FormState> formLoginKey,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required String loginText,
  })  : _formLoginKey = formLoginKey,
        _emailController = emailController,
        _passwordController = passwordController,
        _loginText = loginText;

  final GlobalKey<FormState> _formLoginKey;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final String _loginText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state.isComplated) {
            context.navigateToPage(const ImageLearn202());
          }
        },
        builder: (context, state) {
          return BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return ElevatedButton(
                onPressed: () {
                  if (_formLoginKey.currentState?.validate() ?? false) {
                    context.read<LoginCubit>().checkUser(
                        _emailController.text, _passwordController.text);
                  }
                },
                child: Text('$_loginText - ${state.model?.email ?? ''}'),
              );
            },
          );
        },
      ),
    );
  }
}

class _LoginEmailPasswordField extends StatelessWidget {
  const _LoginEmailPasswordField(
      {Key? key,
      required TextEditingController emailController,
      required TextEditingController passwordController})
      : _emailController = emailController,
        _passwordController = passwordController,
        super(key: key);

  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  @override
  Widget build(BuildContext context) {
    return BlocSelector<LoginCubit, LoginState, bool>(
      selector: (state) {
        return state.isLoading;
      },
      builder: (context, state) {
        return Column(
          children: [
            TextFormField(
                controller: _emailController,
                validator: (String? data) =>
                    (data?.isValidEmail ?? false) ? null : 'Problem',
                decoration: const InputDecoration(labelText: 'Email')),
            TextFormField(
                controller: _passwordController,
                validator: (String? data) =>
                    ((data?.length ?? 0) > 6) ? null : 'Problem',
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Password')),
          ],
        ).toDisabled(state);
      },
    );
  }
}
