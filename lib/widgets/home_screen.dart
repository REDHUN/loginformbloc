import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginformbloc/bloc/auth_bloc.dart';
import 'package:loginformbloc/login_screen.dart';
import 'package:loginformbloc/widgets/gradient_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthInitial) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (ctx) => LoginScreen()),
                    (route) => false);
              }
            },
            builder: (context, state) {
              if (state is AuthLoading) {
                return CircularProgressIndicator();
              }

              return Center(
                child: Text((state as AuthSuccess).uuid),
              );
            },
          ),
          GradientButton(onPressed: () {
            context.read<AuthBloc>().add(AuthLogoutRequested());
          })
        ],
      ),
    );
  }
}
