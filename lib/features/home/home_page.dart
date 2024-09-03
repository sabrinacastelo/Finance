import 'package:finances/common/constants/routes.dart';
import 'package:finances/services/secure_storage.dart';
import 'package:flutter/material.dart';

class HomaPage extends StatefulWidget {
  const HomaPage({super.key});

  @override
  State<HomaPage> createState() => _HomaPageState();
}

class _HomaPageState extends State<HomaPage> {
  final _secureStorage = const SecureStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Logado com sucesso'),
            ElevatedButton(
              onPressed: () {
              _secureStorage.deleteOne(key: "CURRENT_USER").then(
                (_) => Navigator.pushReplacementNamed(context, NamedRoutes.home));
              },
              child: const Text('Sair'),
              ),
          ],
        ),
      ),
    );
  }
}
