:- encoding(utf8).
:- initialization(main).
:- use_module(triage).

main :-
    writeln('Sistema de Triagem Iniciado'),
    triage:start_triage(_),
    halt.
