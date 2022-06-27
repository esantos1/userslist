import 'package:flutter/material.dart';
import 'package:userslist/api/usuarios_api.dart';
import 'package:userslist/constants.dart';
import 'package:userslist/models/usuario.dart';
import 'package:userslist/pages/user_page.dart';
import 'package:userslist/widgets/user_avatar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Stream<List<Usuario>> getUsuarios() async* {
    yield await UsuariosApi.getUsuarios();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text('Usuários'), centerTitle: true),
        body: StreamBuilder<List<Usuario>>(
          stream: getUsuarios(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final items = snapshot.data!;

              return buildList(items);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return Center(child: CircularProgressIndicator.adaptive());
          },
        ),
      );

  Widget buildList(List<Usuario> items) => ListView.separated(
        padding: EdgeInsets.all(defaultPadding),
        itemBuilder: (context, index) {
          final item = items[index];

          return buildItem(context, item);
        },
        separatorBuilder: (context, index) => Divider(),
        itemCount: items.length,
      );

  Widget buildItem(BuildContext context, Usuario item) => ListTile(
        leading: UserAvatar(avatar: item.avatar),
        title: Text(item.nome),
        subtitle: Text('${item.idade} anos'),
        trailing: IconButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UserPage(usuario: item)),
          ),
          icon: Icon(Icons.info),
          tooltip: 'About user',
        ),
      );
}
