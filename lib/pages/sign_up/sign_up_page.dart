import 'package:assigment/navigation/router_config.dart';
import 'package:assigment/pages/sign_up/bloc/sign_up_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: BlocConsumer<SignUpBloc, SignUpState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return Column(
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
                  SignUpLoading() => CircularProgressIndicator(),
                  SignUpSuccess() => Text(state.message),
                  SignUpFailed() => Text(state.message),
                  _ => Container(),
                },
                ElevatedButton(
                  onPressed: () {
                    String email = _emailController.text;
                    String password = _passwordController.text;
                    // Handle sign up logic here
                    context.read<SignUpBloc>().add(
                        OnSignUpClick(email: email, password: password));
                  },
                  child: Text("Register"),
                ),
                TextButton(
                  onPressed: () {
                    context.go(Routs.loginRoute);
                  },
                  child: Text("Already have an account? Sign In"),
                ),
              ],
            );
          },
        ),
      ),

    ));
  }
}
