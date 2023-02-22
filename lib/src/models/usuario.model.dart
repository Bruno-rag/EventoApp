class Usuario{
  String nome;
  final String sobrenome;
  final String fone;
  final String urlAvatar;
  final String dataNas;

  Usuario({
    required this.nome,
    required this.sobrenome,
    required this.fone,
    required this.urlAvatar,
    required this.dataNas,
  });

  Map<String, dynamic> toJson() => {
    'nome': nome,
    'sobrenome': sobrenome,
    'fone': fone ,
    'urlAvatar': urlAvatar,
    'data': dataNas,
  };

  static Usuario fromJson(Map<String, dynamic> json) => Usuario(
    nome: json['nome'],
    sobrenome: json['sobrenome'],
    fone: json['fone'] ,
    urlAvatar: json['urlAvatar'],
    dataNas: json['dataNas'],

  );
}