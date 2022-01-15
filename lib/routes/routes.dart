import 'package:chat/screens/screens.dart';
import 'package:flutter/material.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'users': (_) => UsersScreen(),
  'chat': (_) => const ChatScreen(),
  'register': (_) => const RegisterScreen(),
  'login': (_) => const LoginScreen(),
  'loading': (_) => const LoadingScreen(),
};
