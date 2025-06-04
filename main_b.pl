:- encoding(utf8).
:- module(main_b, []).

:- use_module(triage_b).

:- initialization(main).

main :-
    writeln('*** Triagem: Modo Automático (Parte B) ***'),
    start_triage(Classe),
    format('Classe atribuída: ~w~n', [Classe]),
    halt.
