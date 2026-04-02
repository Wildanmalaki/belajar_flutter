import 'package:belajar_flutter/tugas%2015/API/API_service.dart';
import 'package:belajar_flutter/tugas%2015/models/user_model_15.dart';
import 'package:flutter/material.dart';

enum _AuthPageType { login, register }

class Tugas15Page extends StatefulWidget {
  const Tugas15Page({super.key});

  @override
  State<Tugas15Page> createState() => _Tugas15PageState();
}

class _Tugas15PageState extends State<Tugas15Page> {
  final _loginEmailC = TextEditingController();
  final _loginPassC = TextEditingController();
  final _regNameC = TextEditingController();
  final _regEmailC = TextEditingController();
  final _regPassC = TextEditingController();

  bool _isLoginLoading = false;
  bool _isRegisterLoading = false;
  String? _authError;
  _AuthPageType _currentAuthPage = _AuthPageType.login;

  String? _token;
  UserModel15? _loggedUser;

  @override
  void dispose() {
    _loginEmailC.dispose();
    _loginPassC.dispose();
    _regNameC.dispose();
    _regEmailC.dispose();
    _regPassC.dispose();
    super.dispose();
  }

  bool _isValidEmail(String email) {
    final trimmed = email.trim();
    return RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(trimmed);
  }

  Future<void> _handleLogin() async {
    final email = _loginEmailC.text.trim();
    final password = _loginPassC.text;

    if (email.isEmpty || password.isEmpty) {
      setState(() {
        _authError = 'Email dan password wajib diisi.';
      });
      return;
    }

    if (!_isValidEmail(email)) {
      setState(() {
        _authError = 'Format email belum valid.';
      });
      return;
    }

    setState(() {
      _isLoginLoading = true;
      _authError = null;
    });

    try {
      final result = await ApiService15.login(email: email, password: password);

      if (!mounted) return;
      setState(() {
        _token = result.token;
        _loggedUser = result.user;
      });
      _showSnack(result.message);
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _authError = e.toString().replaceFirst('Exception: ', '');
      });
    } finally {
      if (mounted) {
        setState(() {
          _isLoginLoading = false;
        });
      }
    }
  }

  Future<void> _handleRegister() async {
    final name = _regNameC.text.trim();
    final email = _regEmailC.text.trim();
    final password = _regPassC.text;

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      setState(() {
        _authError = 'Nama, email, dan password wajib diisi.';
      });
      return;
    }

    if (!_isValidEmail(email)) {
      setState(() {
        _authError = 'Format email belum valid.';
      });
      return;
    }

    if (password.length < 6) {
      setState(() {
        _authError = 'Password minimal 6 karakter.';
      });
      return;
    }

    setState(() {
      _isRegisterLoading = true;
      _authError = null;
    });

    try {
      final result = await ApiService15.register(
        name: name,
        email: email,
        password: password,
      );

      if (!mounted) return;
      setState(() {
        _token = result.token;
        _loggedUser = result.user;
      });
      _showSnack(result.message);
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _authError = e.toString().replaceFirst('Exception: ', '');
      });
    } finally {
      if (mounted) {
        setState(() {
          _isRegisterLoading = false;
        });
      }
    }
  }

  void _showSnack(String msg) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(msg), behavior: SnackBarBehavior.floating));
  }

  void _goToLogin() {
    setState(() {
      _currentAuthPage = _AuthPageType.login;
      _authError = null;
    });
  }

  void _goToRegister() {
    setState(() {
      _currentAuthPage = _AuthPageType.register;
      _authError = null;
    });
  }

  void _logout() {
    setState(() {
      _token = null;
      _loggedUser = null;
      _authError = null;
      _currentAuthPage = _AuthPageType.login;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_token == null) {
      if (_currentAuthPage == _AuthPageType.register) {
        return _RegisterScreen(
          regNameC: _regNameC,
          regEmailC: _regEmailC,
          regPassC: _regPassC,
          isLoading: _isRegisterLoading,
          error: _authError,
          onRegister: _handleRegister,
          onGoLogin: _goToLogin,
        );
      }

      return _LoginScreen(
        loginEmailC: _loginEmailC,
        loginPassC: _loginPassC,
        isLoading: _isLoginLoading,
        error: _authError,
        onLogin: _handleLogin,
        onGoRegister: _goToRegister,
      );
    }

    return _ProfileView(
      token: _token!,
      initialUser: _loggedUser,
      onLogout: _logout,
      onShowMessage: _showSnack,
    );
  }
}

class _LoginScreen extends StatelessWidget {
  final TextEditingController loginEmailC;
  final TextEditingController loginPassC;
  final bool isLoading;
  final String? error;
  final Future<void> Function() onLogin;
  final VoidCallback onGoRegister;

  const _LoginScreen({
    required this.loginEmailC,
    required this.loginPassC,
    required this.isLoading,
    required this.error,
    required this.onLogin,
    required this.onGoRegister,
  });

  @override
  Widget build(BuildContext context) {
    return _AuthScaffold(
      title: 'Login',
      subtitle: 'Masuk dengan akun yang sudah terdaftar dan lanjut ke halaman profil.',
      badgeText: 'Welcome Back',
      accentColor: const Color(0xFF1565C0),
      headerIcon: Icons.login_rounded,
      footerPrompt: 'Belum punya akun?',
      footerAction: 'Daftar sekarang',
      onFooterTap: onGoRegister,
      form: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _InputField(
            label: 'Email',
            hint: 'contoh@email.com',
            controller: loginEmailC,
            icon: Icons.alternate_email_rounded,
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 16),
          _InputField(
            label: 'Password',
            hint: 'Masukkan password',
            controller: loginPassC,
            icon: Icons.lock_outline_rounded,
            obscureText: true,
          ),
          if (error != null) ...[
            const SizedBox(height: 16),
            _AuthErrorCard(message: error!),
          ],
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: isLoading ? null : onLogin,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1565C0),
                foregroundColor: Colors.white,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
              ),
              child:
                  isLoading
                      ? const SizedBox(
                        width: 22,
                        height: 22,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.4,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )
                      : const Text(
                        'Login',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                      ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RegisterScreen extends StatelessWidget {
  final TextEditingController regNameC;
  final TextEditingController regEmailC;
  final TextEditingController regPassC;
  final bool isLoading;
  final String? error;
  final Future<void> Function() onRegister;
  final VoidCallback onGoLogin;

  const _RegisterScreen({
    required this.regNameC,
    required this.regEmailC,
    required this.regPassC,
    required this.isLoading,
    required this.error,
    required this.onRegister,
    required this.onGoLogin,
  });

  @override
  Widget build(BuildContext context) {
    return _AuthScaffold(
      title: 'Register',
      subtitle: 'Buat akun baru dulu, setelah itu kamu akan langsung masuk otomatis.',
      badgeText: 'Create Account',
      accentColor: const Color(0xFF2E7D32),
      headerIcon: Icons.person_add_alt_1_rounded,
      footerPrompt: 'Sudah punya akun?',
      footerAction: 'Kembali ke login',
      onFooterTap: onGoLogin,
      form: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _InputField(
            label: 'Nama Lengkap',
            hint: 'Masukkan nama lengkap',
            controller: regNameC,
            icon: Icons.person_outline_rounded,
          ),
          const SizedBox(height: 16),
          _InputField(
            label: 'Email',
            hint: 'nama@email.com',
            controller: regEmailC,
            icon: Icons.email_outlined,
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 16),
          _InputField(
            label: 'Password',
            hint: 'Minimal 6 karakter',
            controller: regPassC,
            icon: Icons.shield_outlined,
            obscureText: true,
          ),
          if (error != null) ...[
            const SizedBox(height: 16),
            _AuthErrorCard(message: error!),
          ],
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: isLoading ? null : onRegister,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2E7D32),
                foregroundColor: Colors.white,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
              ),
              child:
                  isLoading
                      ? const SizedBox(
                        width: 22,
                        height: 22,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.4,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )
                      : const Text(
                        'Register',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                      ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AuthScaffold extends StatelessWidget {
  final String title;
  final String subtitle;
  final String badgeText;
  final Color accentColor;
  final IconData headerIcon;
  final String footerPrompt;
  final String footerAction;
  final VoidCallback onFooterTap;
  final Widget form;

  const _AuthScaffold({
    required this.title,
    required this.subtitle,
    required this.badgeText,
    required this.accentColor,
    required this.headerIcon,
    required this.footerPrompt,
    required this.footerAction,
    required this.onFooterTap,
    required this.form,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              accentColor.withValues(alpha: 0.10),
              Colors.white,
              const Color(0xFFF5F7FB),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 460),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                      decoration: BoxDecoration(
                        color: accentColor.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        badgeText,
                        style: TextStyle(
                          color: accentColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 34,
                        height: 1.05,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF111827),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 15,
                        height: 1.5,
                        color: Color(0xFF4B5563),
                      ),
                    ),
                    const SizedBox(height: 28),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(28),
                        boxShadow: [
                          BoxShadow(
                            color: accentColor.withValues(alpha: 0.10),
                            blurRadius: 32,
                            offset: const Offset(0, 16),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(22),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 58,
                              height: 58,
                              decoration: BoxDecoration(
                                color: accentColor.withValues(alpha: 0.12),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Icon(headerIcon, color: accentColor, size: 28),
                            ),
                            const SizedBox(height: 20),
                            form,
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 6,
                        children: [
                          Text(
                            footerPrompt,
                            style: const TextStyle(color: Color(0xFF6B7280)),
                          ),
                          TextButton(
                            onPressed: onFooterTap,
                            child: Text(
                              footerAction,
                              style: TextStyle(
                                color: accentColor,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _AuthErrorCard extends StatelessWidget {
  final String message;

  const _AuthErrorCard({required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF1F2),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFFDA4AF)),
      ),
      child: Row(
        children: [
          const Icon(Icons.error_outline_rounded, color: Color(0xFFBE123C)),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                color: Color(0xFF9F1239),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InputField extends StatefulWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final IconData icon;
  final bool obscureText;
  final TextInputType? keyboardType;

  const _InputField({
    required this.label,
    required this.hint,
    required this.controller,
    required this.icon,
    this.obscureText = false,
    this.keyboardType,
  });

  @override
  State<_InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<_InputField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: _obscureText,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hint,
        prefixIcon: Icon(widget.icon),
        suffixIcon:
            widget.obscureText
                ? IconButton(
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  icon: Icon(
                    _obscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                  ),
                )
                : null,
        filled: true,
        fillColor: const Color(0xFFF8FAFC),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: Color(0xFF0F766E), width: 1.5),
        ),
      ),
    );
  }
}

class _ProfileView extends StatefulWidget {
  final String token;
  final UserModel15? initialUser;
  final VoidCallback onLogout;
  final void Function(String msg) onShowMessage;

  const _ProfileView({
    required this.token,
    required this.initialUser,
    required this.onLogout,
    required this.onShowMessage,
  });

  @override
  State<_ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<_ProfileView> {
  late Future<UserModel15> _profileFuture;
  late Future<List<UserModel15>> _usersFuture;

  final _editNameC = TextEditingController();
  final _editEmailC = TextEditingController();
  bool _isUpdating = false;

  @override
  void initState() {
    super.initState();
    _profileFuture = ApiService15.getProfile(widget.token);
    _usersFuture = ApiService15.getUsers();
  }

  @override
  void dispose() {
    _editNameC.dispose();
    _editEmailC.dispose();
    super.dispose();
  }

  void _refreshProfile() {
    setState(() {
      _profileFuture = ApiService15.getProfile(widget.token);
    });
  }

  void _refreshUsers() {
    setState(() {
      _usersFuture = ApiService15.getUsers();
    });
  }

  Future<void> _updateProfile() async {
    setState(() {
      _isUpdating = true;
    });

    try {
      final updated = await ApiService15.updateProfile(
        token: widget.token,
        name: _editNameC.text,
        email: _editEmailC.text,
      );
      if (!mounted) return;
      setState(() {
        _profileFuture = Future.value(updated);
      });
      widget.onShowMessage('Profil berhasil diperbarui');
    } catch (e) {
      if (!mounted) return;
      widget.onShowMessage(e.toString().replaceFirst('Exception: ', ''));
    } finally {
      if (mounted) {
        setState(() {
          _isUpdating = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile & CRUD'),
        centerTitle: true,
        actions: [
          IconButton(
            tooltip: 'Logout',
            onPressed: widget.onLogout,
            icon: const Icon(Icons.logout_rounded),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF3FAFF), Color(0xFFF8FFF8)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: RefreshIndicator(
          onRefresh: () async {
            _refreshProfile();
            _refreshUsers();
          },
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              FutureBuilder<UserModel15>(
                future: _profileFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const _LoadingCard();
                  }

                  if (snapshot.hasError) {
                    return _ErrorStateCard(
                      title: 'Gagal mengambil profile',
                      message: snapshot.error.toString(),
                      onRetry: _refreshProfile,
                    );
                  }

                  final user = snapshot.data ?? widget.initialUser;
                  if (user == null) {
                    return const _ErrorStateCard(
                      title: 'Data profile tidak tersedia',
                      message: 'Silakan muat ulang data profil.',
                    );
                  }

                  _editNameC.text = user.name;
                  _editEmailC.text = user.email;

                  return Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                    child: Padding(
                      padding: const EdgeInsets.all(18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: const LinearGradient(
                                colors: [Color(0xFF0F766E), Color(0xFF14B8A6)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 28,
                                  backgroundColor: Colors.white.withValues(alpha: 0.20),
                                  child: const Icon(
                                    Icons.person_rounded,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                                const SizedBox(width: 14),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Data Profile',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        'Kelola data akun kamu dari sini.',
                                        style: TextStyle(
                                          color: Colors.white.withValues(alpha: 0.90),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 18),
                          _InputField(
                            label: 'Nama',
                            hint: 'Masukkan nama',
                            controller: _editNameC,
                            icon: Icons.person_outline_rounded,
                          ),
                          const SizedBox(height: 14),
                          _InputField(
                            label: 'Email',
                            hint: 'Masukkan email',
                            controller: _editEmailC,
                            icon: Icons.alternate_email_rounded,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: OutlinedButton.icon(
                                  onPressed: _refreshProfile,
                                  icon: const Icon(Icons.sync_rounded),
                                  label: const Text('Refresh'),
                                  style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(vertical: 14),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: ElevatedButton.icon(
                                  onPressed: _isUpdating ? null : _updateProfile,
                                  icon:
                                      _isUpdating
                                          ? const SizedBox(
                                            width: 16,
                                            height: 16,
                                            child: CircularProgressIndicator(
                                              strokeWidth: 2,
                                              valueColor: AlwaysStoppedAnimation<Color>(
                                                Colors.white,
                                              ),
                                            ),
                                          )
                                          : const Icon(Icons.save_outlined),
                                  label: const Text('Simpan'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF0F766E),
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(vertical: 14),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              Card(
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Daftar User',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                          ),
                          IconButton(
                            onPressed: _refreshUsers,
                            icon: const Icon(Icons.refresh_rounded),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Tap salah satu user untuk melihat detailnya.',
                        style: TextStyle(color: Color(0xFF6B7280)),
                      ),
                      const SizedBox(height: 12),
                      FutureBuilder<List<UserModel15>>(
                        future: _usersFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const Padding(
                              padding: EdgeInsets.symmetric(vertical: 24),
                              child: Center(child: CircularProgressIndicator()),
                            );
                          }
                          if (snapshot.hasError) {
                            return Text(
                              'Gagal memuat users: ${snapshot.error}',
                              style: const TextStyle(color: Colors.red),
                            );
                          }

                          final users = snapshot.data ?? [];
                          if (users.isEmpty) {
                            return const Text('Data user kosong');
                          }

                          return ListView.separated(
                            itemCount: users.length > 12 ? 12 : users.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            separatorBuilder: (_, __) => const SizedBox(height: 10),
                            itemBuilder: (context, index) {
                              final user = users[index];
                              return InkWell(
                                borderRadius: BorderRadius.circular(18),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => UserDetail15Page(user: user),
                                    ),
                                  );
                                },
                                child: Ink(
                                  padding: const EdgeInsets.all(14),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF8FAFC),
                                    borderRadius: BorderRadius.circular(18),
                                    border: Border.all(color: const Color(0xFFE5E7EB)),
                                  ),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: const Color(0xFFD1FAE5),
                                        child: Text(
                                          user.name.isNotEmpty
                                              ? user.name[0].toUpperCase()
                                              : '?',
                                          style: const TextStyle(
                                            color: Color(0xFF065F46),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              user.name,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            const SizedBox(height: 2),
                                            Text(
                                              user.email,
                                              style: const TextStyle(
                                                color: Color(0xFF6B7280),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        size: 16,
                                        color: Color(0xFF94A3B8),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoadingCard extends StatelessWidget {
  const _LoadingCard();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: const Padding(
        padding: EdgeInsets.all(28),
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class _ErrorStateCard extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback? onRetry;

  const _ErrorStateCard({
    required this.title,
    required this.message,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
            const SizedBox(height: 6),
            Text(message),
            if (onRetry != null) ...[
              const SizedBox(height: 12),
              OutlinedButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh_rounded),
                label: const Text('Coba lagi'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class UserDetail15Page extends StatelessWidget {
  final UserModel15 user;

  const UserDetail15Page({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail User')),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF3FAFF), Color(0xFFEFFAF3)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Card(
            margin: const EdgeInsets.all(18),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            child: Padding(
              padding: const EdgeInsets.all(22),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundColor: const Color(0xFFD1FAE5),
                        child: Text(
                          user.name.isNotEmpty ? user.name[0].toUpperCase() : '?',
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF065F46),
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Text(
                          user.name,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  _DetailTile(label: 'ID', value: '${user.id}'),
                  _DetailTile(label: 'Email', value: user.email),
                  _DetailTile(label: 'Created At', value: user.createdAt ?? '-'),
                  _DetailTile(label: 'Updated At', value: user.updatedAt ?? '-'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DetailTile extends StatelessWidget {
  final String label;
  final String value;

  const _DetailTile({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFFF8FAFC),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: Color(0xFF6B7280),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
