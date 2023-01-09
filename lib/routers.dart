import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:reservation/blocs/clienti/clienti_bloc.dart';
import 'package:reservation/blocs/prenotazione/prenotazione_bloc.dart';
import 'package:reservation/blocs/tesserati/tesserati_bloc.dart';
import 'package:reservation/repository/prenotazioni_repository.dart';
import 'package:reservation/screens/campo_1.dart';
import 'package:reservation/screens/cliente_main_screen.dart';
import 'package:reservation/screens/cliente_screen.dart';
import 'package:reservation/screens/home.dart';
import 'package:reservation/screens/prenotazione_screen.dart';
import 'package:reservation/screens/tessera_main_screen.dart';
import 'package:reservation/screens/tessera_screen.dart';

class Routers {
  late final GoRouter router;

  Routers() {
    router = GoRouter(initialLocation: "/", routes: [
      GoRoute(name: "home", path: "/", builder: (context, state) => Home()),
      GoRoute(
          name: "clienti",
          path: "/clienti",
          builder: (context, state) {
            return BlocProvider<ClientiBloc>(
                create: (context) {
                  return ClientiBloc(
                      preontazioniRepo:
                          RepositoryProvider.of<PrenotazioniRepository>(
                              context));
                },
                child: ClienteMain());
          },
          routes: [
            GoRoute(
                name: "infocliente",
                path: "info-cliente/:id",
                builder: (context, state) {
                  return BlocProvider<ClientiBloc>(
                    create: (context) {
                      return ClientiBloc(
                          preontazioniRepo:
                              RepositoryProvider.of<PrenotazioniRepository>(
                                  context));
                    },
                    child: ClienteScreen(
                      idCliente: state.params["id"]!,
                    ),
                  );
                }),
          ]),
      GoRoute(
          name: "tesserati",
          path: "/tesserati",
          builder: (context, state) {
            return BlocProvider<TesseratiBloc>(
                create: (context) {
                  return TesseratiBloc(
                      prenotazioniRepository:
                          RepositoryProvider.of<PrenotazioniRepository>(
                              context));
                },
                child: TesseraMain());
          },
          routes: [
            GoRoute(
                name: "infotessera",
                path: "info-tessera/:codice",
                builder: (context, state) {
                  return BlocProvider<TesseratiBloc>(
                    create: (context) {
                      return TesseratiBloc(
                          prenotazioniRepository:
                              RepositoryProvider.of<PrenotazioniRepository>(
                                  context));
                    },
                    child: TesseraScreen(
                      codice: state.params["codice"]!,
                    ),
                  );
                }),
          ]),
      GoRoute(
          name: "campo1",
          path: "/campo-1",
          builder: (context, state) {
            return BlocProvider<PrenotazioneBloc>(
                create: (context) {
                  return PrenotazioneBloc(
                      prenotazioniRepository:
                          RepositoryProvider.of<PrenotazioniRepository>(
                              context));
                },
                child: Campo1());
          },
          routes: [
            GoRoute(
                name: "prenotazione",
                path: "prenota/:campo",
                builder: (context, state) {
                  return BlocProvider<PrenotazioneBloc>(
                    create: (context) {
                      return PrenotazioneBloc(
                          prenotazioniRepository:
                              RepositoryProvider.of<PrenotazioniRepository>(
                                  context));
                    },
                    child: PrenotazioneScreen(
                      campo: state.params["campo"]!,
                    ),
                  );
                }),
          ])
    ]);
  }
}
