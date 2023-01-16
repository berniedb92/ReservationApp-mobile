import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:reservation/model/campo.dart';
import 'package:reservation/model/info_msg.dart';
import 'package:reservation/model/prenotazione.dart';
import 'dart:convert';

import '../model/cliente.dart';
import '../model/tessera.dart';

class PrenotazioniRepository {
  PrenotazioniRepository({
    http.Client? httpClient,
    this.baseUrl = 'http://192.168.1.21:8080/api/reservation',
  }) : _httpClient = httpClient ?? http.Client();

  final String baseUrl;
  final Client _httpClient;

  Uri getUrl({
    required String url,
    Map<String, String>? extraParameters,
  }) {
    return Uri.parse('$baseUrl/$url');
  }

  Future<List<Cliente>> caricaClienti() async {
    final response = await http.get(getUrl(url: 'list-clienti'));

    if (response.statusCode == 200 && response.body.isNotEmpty) {
      return List<Cliente>.from(
          json.decode(response.body).map((data) => Cliente.fromMap(data)));
    } else {
      throw new Exception("errore lettura dati");
    }
  }

  Future<Cliente> caricaClientiId(int id) async {
    final response =
        await http.get(getUrl(url: 'list-clienti-id/${id.toString()}'));

    if (response.statusCode == 200 && response.body.isNotEmpty) {
      return Cliente.fromMap(json.decode(response.body));
    } else {
      throw new Exception("errore lettura dati");
    }
  }

  Future<List<Tessera>> caricaTessere() async {
    final response = await http.get(getUrl(url: 'list-tesseramenti'));

    if (response.statusCode == 200 && response.body.isNotEmpty) {
      return List<Tessera>.from(
          json.decode(response.body).map((data) => Tessera.fromMap(data)));
    } else {
      throw new Exception('errore lettura dati');
    }
  }

  Future<Tessera> caricaTessereCodice(int codice) async {
    final response = await http
        .get(getUrl(url: 'list-tesseramenti-id/${codice.toString()}'));

    if (response.statusCode == 200 && response.body.isNotEmpty) {
      return Tessera.fromMap(json.decode(response.body));
    } else {
      return Tessera(-1, "", "", "", "", "", "", false, 0, "", false);
    }
  }

  Future<List<Prenotazione>> caricaPrenotazioni(String date, int campo) async {
    final response = await http
        .get(getUrl(url: 'list-pren-campo/${date}/${campo.toString()}'));

    if (response.statusCode == 200 && response.body.isNotEmpty) {
      return List<Prenotazione>.from(
          json.decode(response.body).map((data) => Prenotazione.fromMap(data)));
    } else {
      //throw new Exception('errore lettura dati');
      return [];
    }
  }

  Future<List<Campo>> caricaCampo() async {
    final response = await http.get(getUrl(url: 'list-campi'));
    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200 && response.body.isNotEmpty) {

      return List<Campo>.from(
          json.decode(response.body).map((data) => Campo.fromMap(data)));
    } else {
      throw new Exception('errore lettura dati');
    }
  }

  Future<Campo> caricaCampoId(int id) async {
    final response = await http.get(getUrl(url: 'campo/${id.toString()}'));
    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200 && response.body.isNotEmpty) {

      return Campo.fromMap(json.decode(response.body));
    } else {
      throw new Exception('errore lettura dati');
    }
  }

  Future<InfoMsg> aggiungiPrenotazione(Prenotazione pren) async {

  print('numero campo'+ pren.campo.numero.toString());

    Map prenotazione = {
      'codicePrenotazione': pren.codicePrenotazione,
      'data': pren.data!.toIso8601String(),
      'oraInizio':pren.oraInizio!.toIso8601String(),
      'oraFine': pren.oraFine!.toIso8601String(),
      'modalita': pren.modalita,
      'campo': {
        'numero': pren.campo.numero
      },
      'giocatore1': {
        'codiceTessera': pren.giocatore1.codiceTessera,
        'tipo': {
          'tipo': pren.giocatore1.tipo
        },
        'integrazione': {
          'tipo': pren.giocatore1.integrazione
        }
      },
      'giocatore2': {
        'codiceTessera': pren.giocatore2.codiceTessera,
        'tipo': {
          'tipo': pren.giocatore2.tipo
        },
        'integrazione': {
          'tipo': pren.giocatore2.integrazione
        }
      },
      'giocatore3': {
        'codiceTessera': pren.giocatore3?.codiceTessera,
        'tipo': {
          'tipo': pren.giocatore3?.tipo
        },
        'integrazione': {
          'tipo': pren.giocatore3?.integrazione
        }
      },
      'giocatore4': {
        'codiceTessera': pren.giocatore4?.codiceTessera,
        'tipo': {
          'tipo': pren.giocatore4?.tipo
        },
        'integrazione': {
          'tipo': pren.giocatore4?.integrazione
        }
      },
    };

    print('repoooo ${prenotazione}');

    final response = await http.post(
      Uri.parse('http://192.168.1.21:8080/api/reservation/inserisci'),
      headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(prenotazione),
    );

    print('qui6' + response.body);
    print(response.statusCode);

    if (response.statusCode == 201 && response.body.isNotEmpty) {
      return InfoMsg.fromMap(json.decode(response.body));
    } else {
      throw new Exception('Inserimento fallito!');
    }
  }
}
