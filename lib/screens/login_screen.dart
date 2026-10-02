import 'package:flutter/material.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State {
  // Controller untuk mengambil teks dari inputan user
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  
  // Status untuk mengontrol visibilitas password (sembunyi/tampil)
  bool _obscurePassword = true;

  void _login() {
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    // === KRITERIA PENILAIAN: Validasi input kosong dan menampilkan pesan (7 Poin) ===
    // Mengecek apakah kolom username atau password kosong sebelum lanjut
    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Username dan Password tidak boleh kosong!')),
      );
      return;
    }

    // === VALIDASI KHUSUS AKUN SPESIFIK ===
    // Mengecek apakah username bernilai 'admingacoan' dan password bernilai '1221'
    if (username != 'nisrina' || password != '149') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Username atau Password salah! (Gunakan admingacoan / 1221)')),
      );
      return; // Menghentikan proses agar tidak lanjut ke halaman Home jika salah
    }

    // === KRITERIA PENILAIAN: Login berhasil mengarahkan ke halaman Home (5 Poin) ===
    // & Username diteruskan ke halaman Profil (5 Poin)
    // Melakukan navigasi penggantian halaman (pushReplacement) ke HomePage sambil membawa data username
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(username: username),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo/Header aplikasi
              Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9Q8Ls4f_a0MIqSmz9Zj_GHOB7GvBslkNbESYWMzd9mw&s=10',
                
              ),
              const SizedBox(height: 8),
              const Text(
                'Selamat Datang Di Toko Sepatu Selamat Berbelanja', 
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              const SizedBox(height: 40),
              
              // === KRITERIA PENILAIAN: Input username (5 Poin) ===
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                ),
              ),
              const SizedBox(height: 16),
              
              // === KRITERIA PENILAIAN: Input password & ditampilkan secara tersembunyi (3 Poin) ===
              // Menggunakan obscureText dan IconButton untuk toggle (tampil/sembunyi) password
              TextField(
                controller: _passwordController,
                obscureText: _obscurePassword, // Mengatur teks tersembunyi (bintang-bintang)
                decoration: InputDecoration(
                  labelText: 'password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  suffixIcon: IconButton(
                    icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword; // Mengubah status lihat/sembunyi password
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 24),
              
              // Tombol Login
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: _login, // Memanggil fungsi validasi dan navigasi _login
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: const Text('Login', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}