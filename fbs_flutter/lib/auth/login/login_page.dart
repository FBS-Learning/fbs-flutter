import 'package:common/common.dart';
import 'package:fbs_flutter/auth/login/bloc/login_bloc.dart';
import 'package:fbs_flutter/auth/login/login_form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const LoginPage());
  }

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {
          if (controller.value >= 0.5 && controller.value < 0.6) {
            controller.forward();
            controller.duration = const Duration(seconds: 10);
          } else if (controller.value >= 0.90) {
            controller.stop();
          }
        });
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(5.0),
        child: LinearProgressIndicator(
          value: controller.value,
          minHeight: 1.0,
          color: Palette.colorTheme,
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: BlocProvider(
          create: (context) {
            return LoginBloc();
          },
          child: const LoginForm(),
        ),
      ),
    );
  }
}
