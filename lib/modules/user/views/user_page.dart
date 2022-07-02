import 'package:flutter/material.dart';
import 'package:userslist/models/logradouro.dart';
import 'package:userslist/models/usuario.dart';
import 'package:userslist/modules/user/views/user_address_tab.dart';
import 'package:userslist/modules/user/views/user_data_tab.dart';

class UserPage extends StatefulWidget {
  final Usuario usuario;

  const UserPage({Key? key, required this.usuario}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  late List<_TabBarModel> tabs;

  @override
  Widget build(BuildContext context) {
    tabs = [
      _TabBarModel(
        title: 'Dados',
        child: UserDataWidget(usuario: widget.usuario),
      ),
      _TabBarModel(
        title: 'Endereços',
        child: UserAddress(logradouro: widget.usuario.logradouro),
      ),
    ];

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Detalhes do usuário'),
          bottom: TabBar(
            tabs: tabs.map((item) => Tab(text: item.title)).toList(),
          ),
        ),
        body: TabBarView(
          children: tabs.map((item) => item.child).toList(),
        ),
      ),
    );
  }
}

class _TabBarModel {
  final String title;
  final Widget? icon;
  final Widget child;

  _TabBarModel({required this.title, this.icon, required this.child});
}
