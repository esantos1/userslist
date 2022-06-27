class Logradouro {
  String? cep;
  String? endereco;
  int? numero;
  String? bairro;
  String? cidade;
  String? estado;

  Logradouro({
    this.cep,
    this.endereco,
    this.numero,
    this.bairro,
    this.cidade,
    this.estado,
  });

  factory Logradouro.fromJson(Map<String, dynamic> json) => Logradouro(
        cep: json['cep'],
        endereco: json['endereco'],
        numero: json['numero'],
        bairro: json['bairro'],
        cidade: json['cidade'],
        estado: json['estado'],
      );

  Map<String, dynamic> toJson() => {
        "cep": cep,
        "endereco": endereco,
        "numero": numero,
        "bairro": bairro,
        "cidade": cidade,
        "estado": estado,
      };
}
