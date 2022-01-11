import 'package:chat/screens/screens.dart';
import 'package:flutter/material.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'users': (_) => const UsersScreen(),
  'hat': (_) => const ChatScreen(),
  'register': (_) => const RegisterScreen(),
  'login': (_) => const LoginScreen(),
  'loading': (_) => const LoadingScreen(),
};
