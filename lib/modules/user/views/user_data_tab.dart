import 'package:flutter/material.dart';
import 'package:userslist/constants.dart';
import 'package:userslist/models/usuario.dart';
import 'package:userslist/modules/user/widgets/data_view_widget.dart';
import 'package:userslist/modules/user/widgets/subtitle.dart';
import 'package:userslist/shared/widgets/user_avatar.dart';

class UserDataWidget extends StatelessWidget {
  final Usuario usuario;

  const UserDataWidget({Key? key, required this.usuario}) : super(key: key);

  final coverHeight = 160.0;
  final profileHeight = 144.0;

  @override
  Widget build(BuildContext context) => ListView(
        controller: ScrollController(),
        padding: EdgeInsets.zero,
        children: [
          buildTop(),
          buildContent(),
        ],
      );

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
            usuario.nome,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: defaultPadding / 2),
          Text(
            '${usuario.idade} anos',
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
    final avatar = usuario.avatar;
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
            value: usuario.cpf,
          ),
          SizedBox(height: spacing),
          DataViewWidget(
            label: 'RG',
            value: usuario.rg,
          ),
          SizedBox(height: spacing),
          DataViewWidget(
            label: 'Data de nascimento',
            value: usuario.dataNasc,
          ),
          SizedBox(height: spacing),
          DataViewWidget(
            label: 'Sexo',
            value: usuario.sexo,
          ),

          SizedBox(height: defaultPadding * 2),

          //---------------- contato ----------------

          Subtitle(label: 'Contato'),
          DataViewWidget(
            label: 'Celular',
            value: usuario.contato.celular,
          ),
          SizedBox(height: spacing),
          DataViewWidget(
            label: 'Email',
            value: usuario.contato.email,
          ),
          SizedBox(height: spacing),
          DataViewWidget(
            label: 'Telefone Fixo',
            value: usuario.contato.telefoneFixo != null
                ? usuario.contato.telefoneFixo!
                : '-',
          ),
          SizedBox(height: spacing),
        ],
      ),
    );
  }
}
