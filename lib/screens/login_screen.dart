import 'package:chat/widgets/widgets.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.95,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Logo(
                  title: 'Messenger',
                ),
                _FormState(),
                Labels(
                  route: 'register',
                  title: '¿No tienes cuenta?',
                  subTitle: 'Crea una ahora!',
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 25),
                  child: Text(
                    'Términos y condiciones de uso',
                    style: TextStyle(fontWeight: FontWeight.w200),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FormState extends StatefulWidget {
  const _FormState({Key? key}) : super(key: key);

  @override
  _Form createState() => _Form();
}

class _Form extends State<_FormState> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * 1,
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomInput(
            icon: Icons.mail_outline,
            placeHolder: 'Email',
            textEditingController: _emailController,
          ),
          CustomInput(
            icon: Icons.lock_outline,
            placeHolder: 'Contraseña',
            textEditingController: _passwordController,
            isPassword: true,
          ),
          const SizedBox(
            height: 25,
          ),
          BlueButton(
            onPress: () {
              // print(_emailController.text);
              // print(_passwordController.text);
            },
            string: 'Ingresar',
          )
        ],
      ),
    );
  }
}
