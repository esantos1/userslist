import 'package:flutter/material.dart';
import 'package:userslist/models/logradouro.dart';

class UserAddress extends StatelessWidget {
  final List<Logradouro> logradouro;

  const UserAddress({Key? key, required this.logradouro}) : super(key: key);

  @override
  Widget build(BuildContext context) => ListView.separated(
        controller: ScrollController(),
        itemCount: logradouro.length,
        itemBuilder: (context, index) {
          final item = logradouro[index];

          return buildEndereco(item);
        },
        separatorBuilder: (context, index) => Divider(),
      );

  Widget buildEndereco(Logradouro item) => ListTile(
        title: Text('${item.endereco}, ${item.numero}'),
        subtitle: Text(
          '${item.bairro} - ${item.cidade}, ${item.estado}',
          style: TextStyle(fontSize: 12.0),
        ),
      );
}
