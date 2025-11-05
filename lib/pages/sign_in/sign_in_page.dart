import 'package:assigment/navigation/router_config.dart';
import 'package:assigment/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';


class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: BlocBuilder<SignInBloc, SignInState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 10,
              children: [
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                  ),
                ),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                  ),
                ),
                switch(state){
                  SignInLoading() => CircularProgressIndicator(),
                  SignInSuccess() => Text(state.message),
                  SignInFailed() => Text(state.message),
                  _ => Container(),
                },
                ElevatedButton(
                  onPressed: () {
                    String email = _emailController.text;
                    String password = _passwordController.text;
                    // Handle sign up logic here
                    context.read<SignInBloc>().add(OnSingInClicked(email: email, password: password));
                  },
                  child: Text("Register"),
                )
                ,
                TextButton(
                  onPressed: () {
                    context.go(Routs.homeRoute);
                  },
                  child: Text("Home"),
                )
              ],
            ),
          );
        },
      ),
    ));
  }
}
