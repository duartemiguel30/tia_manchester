:- encoding(utf8).
:- initialization(main).

main :-
    writeln('*** SISTEMA DE TRIAGEM - ESCOLHA DE MODO ***'),
    writeln('1 - Modo A (Base de conhecimento fixa - manual)'),
    writeln('2 - Modo B (Regras geradas automaticamente - árvore de decisão)'),
    write('Escolha a opção (1 ou 2): '),
    flush_output,
    read(Opcao),
    read_line_to_string(user_input, _),
    iniciar_modo(Opcao).

iniciar_modo(1) :-
    writeln('\n> Iniciando Modo A (manual)...'),
    consult('main.pl'),
    iniciar_triagem_manual.

iniciar_modo(2) :-
    writeln('\n> Iniciando Modo B (automático)...'),
    consult('main_b.pl'),
    main.

iniciar_modo(_) :-
    writeln('\nOpção inválida. Encerrando o sistema.'),
    halt.
