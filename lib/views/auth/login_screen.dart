import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final VoidCallback onLogin;
  final Function(String) onSwitchView;

  const LoginScreen({super.key, required this.onLogin, required this.onSwitchView});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: _buildBackgroundDecoration(context),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Card(
              elevation: 12,
              shadowColor: Colors.black38,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
                side: BorderSide(color: Colors.white.withOpacity(0.55), width: 1.5),
              ),
              color: Colors.white.withOpacity(0.93),
              child: Padding(
                padding: const EdgeInsets.all(28.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildLogoHeader(),
                    const SizedBox(height: 32),
                    _buildLoginForm(context),
                    const SizedBox(height: 20),
                    _buildRegisterRedirect(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // 1. Latar Belakang Samudra
  BoxDecoration _buildBackgroundDecoration(BuildContext context) {
    return BoxDecoration(
      color: Theme.of(context).colorScheme.secondary.withOpacity(0.9),
      image: const DecorationImage(
        image: NetworkImage('https://images.unsplash.com/photo-1544551763-46a013bb70d5?q=80&w=2000&auto=format&fit=crop'),
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
      ),
    );
  }

  // 2. Logo & Judul Utama
  Widget _buildLogoHeader() {
    return Column(
      children: [
        CircleAvatar(
          radius: 44,
          backgroundColor: Colors.transparent,
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Color(0xFF0EA5E9), Color(0xFF0369A1)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: const Center(
              child: Icon(Icons.sailing, size: 44, color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'SITANGKAP',
          style: TextStyle(
            fontSize: 26, 
            fontWeight: FontWeight.bold,
            color: Color(0xFF0369A1),
            letterSpacing: 1.5,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Sistem Informasi Tangkapan Nelayan', 
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
        ),
      ],
    );
  }

  // 3. Form Input (Username, Password, Button)
  Widget _buildLoginForm(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Nomor HP / Email',
            prefixIcon: const Icon(Icons.person_outline, color: Color(0xFF0EA5E9)),
            filled: true,
            fillColor: Colors.grey.shade50,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(color: Colors.grey.shade200),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(color: Colors.grey.shade200),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: Color(0xFF0EA5E9), width: 1.5),
            ),
          ),
        ),
        const SizedBox(height: 16),
        TextFormField(
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Kata Sandi',
            prefixIcon: const Icon(Icons.lock_outline, color: Color(0xFF0EA5E9)),
            suffixIcon: Icon(Icons.visibility_off_outlined, color: Colors.grey.shade400),
            filled: true,
            fillColor: Colors.grey.shade50,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(color: Colors.grey.shade200),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(color: Colors.grey.shade200),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: Color(0xFF0EA5E9), width: 1.5),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () => onSwitchView('forgot'),
            child: const Text(
              'Lupa Sandi?',
              style: TextStyle(color: Color(0xFF0369A1), fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          height: 52,
          child: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF0EA5E9), Color(0xFF0369A1)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF0EA5E9).withOpacity(0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                )
              ],
            ),
            child: ElevatedButton(
              onPressed: onLogin,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              ),
              child: const Text(
                'Masuk Aplikasi', 
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // 4. Tombol Navigasi ke Registrasi
  Widget _buildRegisterRedirect() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Belum punya akun?', style: TextStyle(color: Colors.grey.shade600)),
        TextButton(
          onPressed: () => onSwitchView('register'),
          child: const Text(
            'Daftar Sekarang',
            style: TextStyle(color: Color(0xFF0EA5E9), fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
