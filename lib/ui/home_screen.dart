import 'package:banco_douro/models/account.dart';
import 'package:banco_douro/services/account_service.dart';
import 'package:banco_douro/ui/styles/app_colors.dart';
import 'package:banco_douro/ui/widgets/account_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.lightGrey,
        title: Text("Sistema de gestão de Contas"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, "login");
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: AccountService().getAll(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Center(child: CircularProgressIndicator());
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              case ConnectionState.active:
                return Center(child: CircularProgressIndicator());
              case ConnectionState.done:
                {
                  if (snapshot.data == null || snapshot.data!.isEmpty) {
                    return Center(child: Text("Nenhuma conta recebida."));
                  } else {
                    List<Account> listAccounts = snapshot.data!;
                    return ListView.builder(
                      itemCount: listAccounts.length,
                      itemBuilder: (context, index) {
                        return AccountWidget(account: listAccounts[index]);
                      },
                    );
                  }
                }
            }
          },
        ),
      ),
    );
  }
}
