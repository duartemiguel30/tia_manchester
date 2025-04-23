:- encoding(utf8).
:- initialization(main).
:- use_module(triage).
% força uso do KB B
:- dynamic use_auto_kb/0.
use_auto_kb.

main :-
    writeln('*** Triagem: Modo Automático (Parte B) ***'),
    triage:start_triage(_),
    halt.