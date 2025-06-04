:- encoding(utf8).
:- use_module(triage).

iniciar_triagem_manual :-
    writeln('Sistema de Triagem Iniciado'),
    triage:start_triage(_),
    halt.
