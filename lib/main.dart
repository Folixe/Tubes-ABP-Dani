import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'views/auth/login_screen.dart';
import 'views/auth/register_screen.dart';
import 'views/auth/forgot_password_screen.dart';
import 'views/home/main_app_screen.dart';

void main() {
  runApp(const AplikasiNelayan());
}

class AplikasiNelayan extends StatelessWidget {
  const AplikasiNelayan({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sistem Nelayan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData( 
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0EA5E9), // Sky blue primary
          primary: const Color(0xFF0EA5E9),
          secondary: const Color(0xFF0369A1),
        ),
        useMaterial3: true,
        textTheme: GoogleFonts.plusJakartaSansTextTheme(
          ThemeData.light().textTheme,
        ),
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
      ),
      home: const WrapperScreen(),
    );
  }
}

// --- STATE MANAGEMENT (WRAPPER) ---
class WrapperScreen extends StatefulWidget {
  const WrapperScreen({super.key});

  @override
  State<WrapperScreen> createState() => _WrapperScreenState();
}

class _WrapperScreenState extends State<WrapperScreen> {
  bool isLoggedIn = false;
  String authView = 'login'; // 'login', 'register', 'forgot'

  void _login() {
    setState(() {
      isLoggedIn = true;
    });
  }

  void _logout() {
    setState(() {
      isLoggedIn = false;
      authView = 'login';
    });
  }

  void _switchAuthView(String view) {
    setState(() {
      authView = view;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoggedIn) {
      return MainAppScreen(onLogout: _logout);
    } else {
      if (authView == 'login') {
        return LoginScreen(onLogin: _login, onSwitchView: _switchAuthView);
      } else if (authView == 'register') {
        return RegisterScreen(onSwitchView: _switchAuthView, onRegister: _login);
      } else {
        return ForgotPasswordScreen(onSwitchView: _switchAuthView);
      }
    }
  }
}
