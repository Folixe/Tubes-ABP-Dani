import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  final Function(String) onSwitchView;
  final VoidCallback onRegister;

  const RegisterScreen({super.key, required this.onSwitchView, required this.onRegister});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isKtpUploaded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20),
          onPressed: () => widget.onSwitchView('login'),
        ),
        title: const Text('Daftar Nelayan Baru', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Data Pribadi'),
            _buildTextField('Nama Lengkap (Sesuai KTP)', prefixIcon: Icons.person_outline),
            Row(
              children: [
                Expanded(child: _buildTextField('Tempat Lahir', prefixIcon: Icons.location_on_outlined)),
                const SizedBox(width: 12),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 14.0),
                    child: TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: 'Tanggal Lahir',
                        suffixIcon: const Icon(Icons.calendar_today, size: 18, color: Color(0xFF0EA5E9)),
                        filled: true,
                        fillColor: Colors.white,
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
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      ),
                      onTap: () async {
                        await showDatePicker(
                          context: context,
                          initialDate: DateTime(1990),
                          firstDate: DateTime(1940),
                          lastDate: DateTime.now(),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _buildSectionTitle('Data Nelayan'),
            _buildDropdown('Kelompok Nelayan / KUB', ['Mina Makmur', 'Sinar Laut', 'Mandiri', 'Belum Ada'], Icons.groups_outlined),
            _buildDropdown('Jenis Perahu', ['Tanpa Motor', 'Motor Tempel', 'Kapal < 5 GT', 'Kapal 5-10 GT', 'Kapal > 10 GT'], Icons.directions_boat_outlined),
            _buildDropdown('Jenis Alat Tangkap', ['Jaring Insang (Gillnet)', 'Pancing (Rawai)', 'Bubu', 'Pukat Cincin', 'Lainnya'], Icons.phishing_outlined),
            const SizedBox(height: 12),
            _buildSectionTitle('Dokumen (Foto KTP)'),
            GestureDetector(
              onTap: () {
                setState(() => _isKtpUploaded = !_isKtpUploaded);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                decoration: BoxDecoration(
                  color: _isKtpUploaded ? const Color(0xFFECFDF5) : Colors.white,
                  border: Border.all(
                    color: _isKtpUploaded ? const Color(0xFF10B981) : Colors.grey.shade300,
                    width: _isKtpUploaded ? 1.5 : 1,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: _isKtpUploaded
                      ? [BoxShadow(color: const Color(0xFF10B981).withOpacity(0.06), blurRadius: 10, offset: const Offset(0, 4))]
                      : [BoxShadow(color: Colors.black.withOpacity(0.01), blurRadius: 5, offset: const Offset(0, 2))],
                ),
                child: Column(
                  children: [
                    if (_isKtpUploaded) ...[
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFD1FAE5),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: const Color(0xFF34D399), width: 1),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.credit_card, color: Color(0xFF065F46), size: 32),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'KTP_BUDI_NELAYAN.JPG',
                                    style: TextStyle(
                                      color: const Color(0xFF065F46),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                      fontFamily: GoogleFonts.shareTechMono().fontFamily,
                                    ),
                                  ),
                                  const Text(
                                    'Terunggah & Terverifikasi Sistem',
                                    style: TextStyle(color: Color(0xFF047857), fontSize: 11),
                                  ),
                                ],
                              ),
                            ),
                            const Icon(Icons.check_circle, color: Color(0xFF10B981), size: 24),
                          ],
                        ),
                      )
                    ] else ...[
                      const Icon(Icons.cloud_upload_outlined, size: 40, color: Color(0xFF0EA5E9)),
                      const SizedBox(height: 8),
                      const Text(
                        'Unggah Foto KTP Anda',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Ketuk di sini untuk mengambil foto KTP',
                        style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
                      ),
                    ]
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            _buildSectionTitle('Akun Pengguna'),
            _buildTextField('Nomor HP', isPhone: true, prefixIcon: Icons.phone_android_outlined),
            _buildTextField('Kata Sandi', isPassword: true, prefixIcon: Icons.lock_outline),
            const SizedBox(height: 24),
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
                  onPressed: widget.onRegister,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  ),
                  child: const Text(
                    'Daftar & Masuk', 
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 12.0),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 16,
            decoration: BoxDecoration(
              color: const Color(0xFF0EA5E9),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            title.toUpperCase(),
            style: const TextStyle(
              fontWeight: FontWeight.bold, 
              color: Color(0xFF0369A1), 
              fontSize: 12, 
              letterSpacing: 1.2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, {bool isPassword = false, bool isPhone = false, IconData? prefixIcon}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14.0),
      child: TextFormField(
        obscureText: isPassword,
        keyboardType: isPhone ? TextInputType.phone : TextInputType.text,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: const Color(0xFF0EA5E9), size: 20) : null,
          filled: true,
          fillColor: Colors.white,
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
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
      ),
    );
  }

  Widget _buildDropdown(String label, List<String> items, IconData prefixIcon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(prefixIcon, color: const Color(0xFF0EA5E9), size: 20),
          filled: true,
          fillColor: Colors.white,
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
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
        items: items.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
        onChanged: (v) {},
      ),
    );
  }
}
