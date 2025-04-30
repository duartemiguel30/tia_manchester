:- encoding(utf8).
:- initialization(main).
:- use_module(triage).

:- dynamic use_auto_kb/0.
use_auto_kb.

main :-
    writeln('*** Triagem: Modo Automático (Parte B) ***'),
    triage:start_triage(_),
    halt.