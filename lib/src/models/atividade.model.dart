class Atividade{
  final String idAtividade;
  String nome;
  final String descricao;
  final String data;

  Atividade({
    required this.idAtividade,
    required this.nome,
    required this.descricao,
    required this.data,
  });

  Map<String, dynamic> adicionarFirebase() => {
    'idAtividade': idAtividade,
    'nome': nome,
    'descricao': descricao,
    'data': data ,
  };

  static Atividade lerFireBase(Map<String, dynamic> json) => Atividade(
    idAtividade: json['idAtividade'],
    nome: json['nome'],
    descricao: json['descricao'],
    data: json['data'] ,

  );
}