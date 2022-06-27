import 'package:userslist/models/contato.dart';
import 'package:userslist/models/logradouro.dart';

class Usuario {
  int id;
  String? avatar;
  String nome;
  int idade;
  String cpf;
  String rg;
  String dataNasc;
  String sexo;
  Contato contato;
  List<Logradouro> logradouro;

  Usuario({
    required this.id,
    this.avatar,
    required this.nome,
    required this.idade,
    required this.cpf,
    required this.rg,
    required this.dataNasc,
    required this.sexo,
    required this.contato,
    required this.logradouro,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        id: json['id'],
        avatar: json['avatar'],
        nome: json['nome'],
        idade: json['idade'],
        cpf: json['cpf'],
        rg: json['rg'],
        dataNasc: json['data_nasc'],
        sexo: json['sexo'],
        contato: Contato.fromJson(json['contato']),
        logradouro: json['logradouro']
            .map<Logradouro>((item) => Logradouro.fromJson(item))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "avatar": avatar,
        "nome": nome,
        "idade": idade,
        "cpf": cpf,
        "rg": rg,
        "data_nasc": dataNasc,
        "sexo": sexo,
        "contato": contato.toJson(),
        "logradouro": logradouro.map((v) => v.toJson()).toList(),
      };
}
