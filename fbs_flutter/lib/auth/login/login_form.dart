import 'package:common/common.dart';
import 'package:fbs_flutter/auth/login/bloc/login_bloc.dart';
import 'package:fbs_flutter/l10n/generated/l10n.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 24.0),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 20.0),
                _TitleLabel(),
                const SizedBox(height: 8.0),
                _SubtitleLabel(),
                const SizedBox(height: 35.0),
                _UsernameInput(),
                const SizedBox(height: 8.0),
                _ForgotPasswordLabel(),
                _PasswordInput(),
                const SizedBox(height: 24.0),
                _LoginButton(),
                _AdditionalTitleLabel(),
                const SizedBox(height: 20.0),
                _GoogleLogin(),
                const SizedBox(height: 20.0),
                _RegisterLink(),
                const SizedBox(height: 35.0),
                _TermsConditionLink()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _UsernameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_usernameInput_textField'),
          onChanged: (username) =>
              context.read<LoginBloc>().add(LoginUsernameChanged(username)),
          decoration: InputDecoration(
            labelText: 'username',
            errorText: state.username.invalid ? 'invalid username' : null,
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_passwordInput_textField'),
          onChanged: (password) =>
              context.read<LoginBloc>().add(LoginPasswordChanged(password)),
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'password',
            errorText: state.password.invalid ? 'invalid password' : null,
          ),
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return ElevatedButton(
          key: const Key('loginForm_continue_raisedButton'),
          onPressed: state.status.isValidated
              ? () {
                  context.read<LoginBloc>().add(const LoginSubmitted());
                }
              : null,
          style: ElevatedButton.styleFrom(
            primary: Palette.colorTheme,
            minimumSize: const Size(200.0, 48.0),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                FBSLocalizations.of(context).login.toUpperCase(),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: (state.status.isInvalid || state.status.isPure)
                      ? Palette.buttonTextDisable
                      : Colors.white,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _TitleLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8),
      child: Text(
        FBSLocalizations.of(context).login,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _SubtitleLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8),
      child: Text(
        FBSLocalizations.of(context).labelLogin,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

class _ForgotPasswordLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8, bottom: 6),
      child: Align(
        alignment: Alignment.centerRight,
        child: InkWell(
          canRequestFocus: false,
          child: Text(
            '${FBSLocalizations.of(context).forgotPassword}?',
          ),
          onTap: () {},
        ),
      ),
    );
  }
}

class _AdditionalTitleLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8),
      child: Text(
        '${FBSLocalizations.of(context).labelFooterLoginSocial} :',
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

class _GoogleLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      focusNode: FocusNode(skipTraversal: true),
      icon: SvgPicture.asset(
        'assets/eva_icons/fill/svg/google.svg',
        color: Palette.colorTheme,
      ),
      onPressed: () {},
    );
  }
}

class _RegisterLink extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8),
      child: Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.center,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(right: 2),
                child: Text(
                  FBSLocalizations.of(context).labelFooterLoginOther,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                )),
            InkWell(
              onTap: () {},
              canRequestFocus: false,
              child: Text(
                FBSLocalizations.of(context).register,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Palette.colorTheme,
                  decoration: TextDecoration.underline,
                ),
              ),
            )
          ]),
    );
  }
}

class _TermsConditionLink extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8),
      child: InkWell(
        onTap: () {},
        canRequestFocus: false,
        child: Text(
          FBSLocalizations.of(context).termsAndConditions,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Palette.colorTheme,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
