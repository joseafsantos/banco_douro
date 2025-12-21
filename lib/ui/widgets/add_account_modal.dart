import 'package:flutter/material.dart';

import '../styles/app_colors.dart';

class AddAccountModal extends StatefulWidget {
  const AddAccountModal({super.key});

  @override
  State<AddAccountModal> createState() => _AddAccountModalState();
}

class _AddAccountModalState extends State<AddAccountModal> {
  String _accountType = "AMBROSIA";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 32,
        right: 32,
        top: 32,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      height: MediaQuery.of(context).size.height * 0.75,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            Center(
              child: Image.asset(
                "assets/images/icon_add_account.png",
                width: 64,
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              "Adicionar nova conta",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 16),
            const Text(
              "Preencha os dados abaixo",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
            ),
            TextFormField(
              decoration: const InputDecoration(label: Text("Nome")),
            ),
            TextFormField(
              decoration: const InputDecoration(label: Text("Último nome")),
            ),
            const SizedBox(height: 32),
            const Text("Tipo da Conta"),
            DropdownButton<String>(
              value: _accountType,
              isExpanded: true,
              items: [
                DropdownMenuItem(value: "AMBROSIA", child: Text("Ambrosia")),
                DropdownMenuItem(value: "CANJICA", child: Text("Canjica")),
                DropdownMenuItem(value: "PUDIM", child: Text("Pudim")),
                DropdownMenuItem(
                  value: "BRIGADEIRO",
                  child: Text("Brigadeiro"),
                ),
              ],
              onChanged: (valor) {
                if (valor != null) {
                  setState(() {
                    _accountType = valor;
                  });
                }
              },
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, "");
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        AppColor.lightOrange,
                      ),
                    ),
                    child: Text(
                      "Cancelar",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(width: 32),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, "");
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(AppColor.orange),
                    ),
                    child: Text(
                      "Adicionar",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
