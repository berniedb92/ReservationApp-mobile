class Campo {
  late int numero;
  late String superficie;
  late String sport;

  Campo(this.numero, this.superficie, this.sport);


  Campo.fromMap(Map<String, dynamic> mappa) {
    numero = mappa['numero'];
    superficie = mappa['superficie'];
    sport = mappa['sport'];
  }
}

