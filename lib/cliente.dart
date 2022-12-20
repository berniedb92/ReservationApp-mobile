class Cliente {
  late int id;
  late String nome;
  late String cognome;
  late String dataNascita;
  late String luogoNascita;
  late String codiceFiscale;
  late String nazionalita;
  late String indirizzo;
  late String email;
  late String numTelefono;

  Cliente(
      this.id,
      this.nome,
      this.cognome,
      this.dataNascita,
      this.luogoNascita,
      this.codiceFiscale,
      this.nazionalita,
      this.indirizzo,
      this.email,
      this.numTelefono);

  Cliente.fromMap(Map<String, dynamic> mappa) {
    id = mappa['id'];
    nome = mappa['nome'];
    cognome = mappa['cognome'];
    dataNascita = mappa['dataNascita'];
    luogoNascita = mappa['luogoNascita'];
    codiceFiscale = mappa['codiceFiscale'];
    nazionalita = mappa['nazionalita'];
    indirizzo = mappa['indirizzo'];
    email = mappa['email'];
    numTelefono = mappa['numTelefono'];
  }
}
