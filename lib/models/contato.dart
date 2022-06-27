class Contato {
  String email;
  String? telefoneFixo;
  String celular;

  Contato({
    required this.email,
    this.telefoneFixo,
    required this.celular,
  });

  factory Contato.fromJson(Map<String, dynamic> json) => Contato(
        email: json['email'],
        telefoneFixo: json['telefone_fixo'],
        celular: json['celular'],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "telefone_fixo": telefoneFixo,
        "celular": celular,
      };
}
