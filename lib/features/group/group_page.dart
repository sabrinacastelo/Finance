import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:finances/common/constants/app_colors.dart';
import 'package:finances/common/extensions/sizes.dart';

class GroupPage extends StatefulWidget {
  const GroupPage({super.key});

  @override
  GroupPageState createState() => GroupPageState();
}

class GroupPageState extends State<GroupPage> {
  String? groupName;
  bool _hasGroup = false;

  void _createNewGroup() {
    if (_hasGroup) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Você já tem um grupo. Limite de 1 grupo atingido.'),
        ),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Criar Novo Grupo'),
          content: TextField(
            onChanged: (value) {
              setState(() {
                groupName = value;
              });
            },
            decoration: const InputDecoration(hintText: "Nome do Grupo"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (groupName != null && groupName!.isNotEmpty) {
                  setState(() {
                    _hasGroup = true;
                  });
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Criar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
          ],
        );
      },
    );
  }

  void _inviteMember() {
    showDialog(
      context: context,
      builder: (context) {
        String email = '';
        return AlertDialog(
          title: const Text('Convidar Membro'),
          content: TextField(
            onChanged: (value) {
              setState(() {
                email = value;
              });
            },
            decoration: const InputDecoration(hintText: "Email do Membro"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (email.isNotEmpty) {
                  log('Convite enviado para $email');
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Convite enviado para $email'),
                    ),
                  );
                }
                Navigator.of(context).pop();
              },
              child: const Text('Enviar Convite'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const SizedBox(height: 150),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: AppColors.coldGradient,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.elliptical(500, 30),
                  bottomRight: Radius.elliptical(500, 30),
                ),
              ),
              height: 200.h, // Ajuste a altura conforme necessário
            ),
          ),
          Padding(
            padding: EdgeInsets.all(24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Grupos',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
                      ),
                    ),
                    if (!_hasGroup)
                      IconButton(
                        icon: const Icon(Icons.add, color: AppColors.white),
                        onPressed: _createNewGroup,
                      ),
                  ],
                ),
                SizedBox(height: 24.h),
                if (_hasGroup) ...[
                  Container(
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Grupo: $groupName',
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.person_add),
                          onPressed: _inviteMember,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.h),
                  ElevatedButton(
                    onPressed: () {
                      // Aqui você pode implementar a lógica para exibir os gastos compartilhados
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFFFFF),
                      minimumSize: Size(double.infinity, 50.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: const Text('Exibir Gastos Compartilhados',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 16.0,
                        )),
                  ),
                ] else ...[
                  const Center(
                    child: Text(
                      'Você ainda não tem um grupo.',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
