:- encoding(utf8).
:- initialization(main).

main :-
    writeln('*** SISTEMA DE TRIAGEM - ESCOLHA DE MODO ***'),
    writeln('1 - Modo A (Base de conhecimento fixa - manual)'),
    writeln('2 - Modo B (Regras geradas automaticamente - árvore de decisão)'),
    write('Escolha a opção (1 ou 2): '),
    read(Opcao),
    iniciar_modo(Opcao).

iniciar_modo(1) :-
    writeln('\n> Iniciando Modo A (manual)...'),
    consult('main.pl').

iniciar_modo(2) :-
    writeln('\n> Iniciando Modo B (automático)...'),
    consult('main_b.pl').

iniciar_modo(_) :-
    writeln('\nOpção inválida. Encerrando o sistema.'),
    halt.
