import 'package:flutter/material.dart';
import 'package:userslist/constants.dart';
import 'package:userslist/models/logradouro.dart';
import 'package:userslist/models/usuario.dart';
import 'package:userslist/widgets/user_avatar.dart';
import 'package:userslist/widgets/user_widgets.dart';

class UserPage extends StatefulWidget {
  final Usuario usuario;

  const UserPage({Key? key, required this.usuario}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  late List<_TabBarModel> tabs;

  final coverHeight = 160.0;
  final profileHeight = 144.0;

  @override
  Widget build(BuildContext context) {
    tabs = [
      _TabBarModel(title: 'Dados', child: mostradDados()),
      _TabBarModel(title: 'Endereços', child: mostrarEnderecos()),
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

  //tab dados
  Widget mostradDados() => ListView(
        controller: ScrollController(),
        padding: EdgeInsets.zero,
        children: [
          buildTop(),
          buildContent(),
        ],
      );

  //tab dados
  Widget buildTop() {
    final bottom = profileHeight / 2 + 8;
    final top = coverHeight - profileHeight / 2;

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: bottom),
          child: buildCoverWidget(),
        ),
        Positioned(
          top: top,
          child: buildProfileImage(),
        ),
      ],
    );
  }

  Widget buildContent() => Column(
        children: [
          Text(
            widget.usuario.nome,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: defaultPadding / 2),
          Text(
            '${widget.usuario.idade} anos',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 36),
          buildSobre(),
        ],
      );

  Widget buildCoverWidget() => Container(
        color: Colors.purple,
        width: double.infinity,
        height: coverHeight,
      );

  Widget buildProfileImage() {
    final avatar = widget.usuario.avatar;
    final radius = profileHeight / 2;

    return UserAvatar(avatar: avatar, radius: radius, iconSize: 40);
  }

  Widget buildSobre() {
    const spacing = 24.0;

    return Padding(
      padding: EdgeInsets.fromLTRB(32.0, 0, 32.0, 32.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //---------------- dados pessoais ----------------
          Subtitle(label: 'Dados Pessoais'),

          DataViewWidget(
            label: 'CPF',
            value: widget.usuario.cpf,
          ),
          SizedBox(height: spacing),
          DataViewWidget(
            label: 'RG',
            value: widget.usuario.rg,
          ),
          SizedBox(height: spacing),
          DataViewWidget(
            label: 'Data de nascimento',
            value: widget.usuario.dataNasc,
          ),
          SizedBox(height: spacing),
          DataViewWidget(
            label: 'Sexo',
            value: widget.usuario.sexo,
          ),

          SizedBox(height: defaultPadding * 2),

          //---------------- contato ----------------

          Subtitle(label: 'Contato'),
          DataViewWidget(
            label: 'Celular',
            value: widget.usuario.contato.celular,
          ),
          SizedBox(height: spacing),
          DataViewWidget(
            label: 'Email',
            value: widget.usuario.contato.email,
          ),
          SizedBox(height: spacing),
          DataViewWidget(
            label: 'Telefone Fixo',
            value: widget.usuario.contato.telefoneFixo ?? '-',
          ),
          SizedBox(height: spacing),
        ],
      ),
    );
  }

  //tab endereço
  Widget mostrarEnderecos() {
    List<Logradouro> logradouro = widget.usuario.logradouro;

    return ListView.separated(
      controller: ScrollController(),
      itemCount: logradouro.length,
      itemBuilder: (context, index) {
        final item = logradouro[index];

        return buildEndereco(item);
      },
      separatorBuilder: (context, index) => Divider(),
    );
  }

  Widget buildEndereco(Logradouro item) => ListTile(
        title: Text('${item.endereco}, ${item.numero}'),
        subtitle: Text(
          '${item.bairro} - ${item.cidade}, ${item.estado}',
          style: TextStyle(fontSize: 12.0),
        ),
      );
}

class _TabBarModel {
  final String title;
  final Widget? icon;
  final Widget child;

  _TabBarModel({required this.title, this.icon, required this.child});
}
