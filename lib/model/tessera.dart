class Tessera {
  late int? codiceTessera;
  late String? dataTesseramento;
  late String tipo;
  late String integrazione;
  late String clienteTess;
  late String? scadenzaCertificato;
  late String? scadenzaTessera;
  late bool? attiva;
  late int? pagamento;
  late String? note;
  late bool? pagata;

  Tessera(
      this.codiceTessera,
      this.dataTesseramento,
      this.tipo,
      this.integrazione,
      this.clienteTess,
      this.scadenzaCertificato,
      this.scadenzaTessera,
      this.attiva,
      this.pagamento,
      this.note,
      this.pagata);

  Tessera.fromMap(Map<String, dynamic> mappa) {
    codiceTessera = mappa['codiceTessera'];
    dataTesseramento = mappa['dataTesseramento'];
    tipo = mappa['tipo'] == null ? '' : mappa['tipo']['tipo'];
    integrazione = mappa['integrazione'] == null ? '' : mappa['integrazione']['tipo'];
    clienteTess = mappa['clienteTess'] == null ? '' : mappa['clienteTess']['cognome'];
    scadenzaCertificato = mappa['scadenzaCertificato'];
    scadenzaTessera = mappa['scadenzaTessera'];
    attiva = mappa['attiva'];
    pagamento = mappa['pagamento'];
    note = mappa['note'];
    pagata = mappa['pagata'];
  }
}
