class Evento{
  final String idEvento;
  String nomeEvento;
  final String inicioEvento;
  final String terminoEvento;
  final String urlAvatar;
  final String detalheEvento;
  final String idOrganizador;

  Evento({
    required this.idEvento,
    required this.nomeEvento,
    required this.inicioEvento,
    required this.terminoEvento,
    required this.urlAvatar,
    required this.detalheEvento,
    required this.idOrganizador,
  });

  Map<String, dynamic> adicionarFirebase() => {
    'idEvento': idEvento,
    'nomeEvento': nomeEvento,
    'inicioEvento': inicioEvento,
    'terminoEvento': terminoEvento ,
    'urlAvatar': urlAvatar,
    'detalheEvento': detalheEvento,
    'idOrganizador': idOrganizador,
  };

  static Evento lerFireBase(Map<String, dynamic> json) => Evento(
    idEvento: json['idEvento'],
    nomeEvento: json['nomeEvento'],
    inicioEvento: json['inicioEvento'],
    terminoEvento: json['terminoEvento'] ,
    urlAvatar: json['urlAvatar'],
    detalheEvento: json['detalheEvento'],
    idOrganizador: json['idOrganizador'],
  );
}