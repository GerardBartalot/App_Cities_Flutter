// ignore: file_names
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:app_cities_flutter/main.dart';
import 'package:app_cities_flutter/routing/routes.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _userController = TextEditingController();
  final _passController = TextEditingController();
  final String _validUser = "user";
  final String _validPass = "pass12345";

  @override
  Widget build(BuildContext context) {
    final texts = AppLocalizations.of(context)!;
    final appState = context.findAncestorStateOfType<MyAppState>();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(texts.loginPage),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: Colors.blueAccent, width: 1.2),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<Locale>(
                  value: appState?.getLocale(),
                  icon: const Icon(Icons.language, color: Colors.blue),
                  dropdownColor: Colors.white,
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                  items: const [
                    DropdownMenuItem<Locale>(
                      value: Locale('en', ''),
                      child: Text('🇺🇸 English'),
                    ),
                    DropdownMenuItem<Locale>(
                      value: Locale('es', ''),
                      child: Text('🇪🇸 Español'),
                    ),
                    DropdownMenuItem<Locale>(
                      value: Locale('fr', ''),
                      child: Text('🇫🇷 Français'),
                    ),
                  ],
                  onChanged: (locale) {
                    if (locale != null) {
                      appState?.changeLanguage(locale);
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset('assets/Logo-Flutter.jpg', height: 50),
              const SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _userController,
                      decoration: InputDecoration(
                        labelText: texts.user,
                        border: const OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return texts.mandatoryUser;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _passController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: texts.password,
                        border: const OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return texts.mandatoryPassword;
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {},
                child: Text(
                  texts.forgot_password,
                  style: const TextStyle(color: Colors.blue),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 10,
                  ),
                ),
                child: Text(
                  texts.login,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              const SizedBox(height: 120),
              TextButton(onPressed: () {}, child: Text(texts.newUser)),
            ],
          ),
        ),
      ),
    );
  }

  void _login() {
    final texts = AppLocalizations.of(context)!;
    if (_formKey.currentState!.validate()) {
      if (_userController.text != _validUser) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(texts.correctPassword)));
        return;
      }
      if (_passController.text != _validPass) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(texts.incorrectPassword)));
        return;
      }
      Navigator.pushNamed(
        context,
        Routes.cities,
        arguments: _userController.text,
      );
    }
  }
}
