import 'package:chat/widgets/widgets.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * .95,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Logo(title: 'Register'),
                _FormState(),
                Labels(
                  route: 'login',
                  title: '¿Ya tienes cuenta?',
                  subTitle: 'Inicia sesión!',
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
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomInput(
            icon: Icons.perm_identity,
            placeHolder: 'Name',
            textEditingController: _nameController,
          ),
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
