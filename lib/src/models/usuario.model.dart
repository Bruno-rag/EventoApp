class Atividade{
  final String idUsuario;
  String nome;
  final String sobrenome;
  final String fone;
  final String urlAvatar;
  final String dataNas;
  final String email;

  Atividade({
    required this.idUsuario,
    required this.nome,
    required this.sobrenome,
    required this.fone,
    required this.urlAvatar,
    required this.dataNas,
    required this.email,
  });

  Map<String, dynamic> adicionarFirebase() => {
    'idUsuario': idUsuario,
    'nome': nome,
    'sobrenome': sobrenome,
    'fone': fone ,
    'urlAvatar': urlAvatar,
    'data': dataNas,
    'email': email,
  };


  static Atividade lerFireBase(Map<String, dynamic> json) => Atividade(
    idUsuario: json['idUsuario'],
    nome: json['nome'],
    sobrenome: json['sobrenome'],
    fone: json['fone'] ,
    urlAvatar: json['urlAvatar'],
    dataNas: json['dataNas'],
    email: json['email'],
  );
}