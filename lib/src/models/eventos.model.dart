class Eventos{

  String nomeEvento;
  final String inicioEvento;
  final String terminoEvento;
  final String urlAvatar;
  final String detalheEvento;
  final String atividaEvento;

  Eventos({

    required this.nomeEvento,
    required this.inicioEvento,
    required this.terminoEvento,
    required this.urlAvatar,
    required this.detalheEvento,
    required this.atividaEvento,
  });

  Map<String, dynamic> toJson() => {

    'nomeEvento': nomeEvento,
    'inicioEvento': inicioEvento,
    'terminoEvento': terminoEvento ,
    'urlAvatar': urlAvatar,
    'detalheEvento': detalheEvento,
    'atividaEvento': atividaEvento,
  };

  static Eventos fromJson(Map<String, dynamic> json) => Eventos(
      nomeEvento: json['nomeEvento'],
      inicioEvento: json['inicioEvento'],
      terminoEvento: json['terminoEvento'] ,
      urlAvatar: json['urlAvatar'],
      detalheEvento: json['detalheEvento'],
      atividaEvento: json['atividaEvento'],

  );
}