:- encoding(utf8).
:- module(triage_b, [start_triage/1]).
:- ensure_loaded(rules_auto).

:- use_module(rules_auto).
:- use_module(questions).

:- op(800, fx, if).
:- op(700, xfx, then).

:- dynamic fact/2.

% Início do processo de triagem
start_triage(Classe) :-
    limpar_fatos,
    pedir_fatos,
    listar_fatos,
    encontrar_classe(Classe),
    format('Classe determinada: ~w~n', [Classe]).

% Limpa todos os fatos armazenados
limpar_fatos :- 
    retractall(fact(_, _)).

% Lista de atributos
atributo(dm_1).
atributo(dm_2).
atributo(dm_3).
atributo(dm_4).
atributo(dm_5).
atributo(dm_6).
atributo(dm_7).
atributo(dm_8).
atributo(dm_9).

% Pergunta os fatos ao usuário
pedir_fatos :-
    forall(atributo(Attr), perguntar_fato(Attr)).

% Pergunta individual para cada atributo
perguntar_fato(Attr) :-
    ( question(Attr, Pergunta) -> format('~s~n', [Pergunta])
    ; format('~w (sim/nao): ', [Attr])
    ),
    read_line_to_string(user_input, RespostaStr),
    normalizar_resposta(RespostaStr, Valor),
    format('Fato inserido: fact(~w, ~w)~n', [Attr, Valor]), % Depuração
    assertz(fact(Attr, Valor)).

% Normaliza a resposta do usuário
normalizar_resposta(EntradaStr, sim) :-
    string_lower(EntradaStr, Lower),
    normalize_space(atom(Atom), Lower),
    member(Atom, [sim, s, yes, y]), !.
normalizar_resposta(EntradaStr, nao) :-
    string_lower(EntradaStr, Lower),
    normalize_space(atom(Atom), Lower),
    member(Atom, [nao, n, no]), !.
normalizar_resposta(_, nao).

% Lista todos os fatos recolhidos
listar_fatos :-
    writeln('Fatos recolhidos:'),
    forall(fact(A, V), format(' - ~w: ~w~n', [A, V])).

% Encontra a classe final com base nas regras
encontrar_classe(ClasseFinal) :-
    writeln('Iniciando busca por regras...'),
    findall(Prob-Classe, (
        regra(Condicoes, Classe:Prob),
        writeln('Regra encontrada:'),
        writeln(regra(Condicoes, Classe:Prob)),
        condicoes_satisfeitas_lista(Condicoes)
    ), ListaProbs),
    writeln('Regras aplicadas:'),
    writeln(ListaProbs),
    (   ListaProbs \= []
    ->  sort(0, @>=, ListaProbs, [_-ClasseFinal | _])
    ;   ClasseFinal = azul  % fallback
    ).

% Avalia uma condição individual
condicoes_satisfeitas(true) :-
    writeln('Condição satisfeita: true').
condicoes_satisfeitas((Cond1 , Conds)) :-
    writeln('Condição composta:'),
    writeln(Cond1),
    condicoes_satisfeitas(Cond1),
    condicoes_satisfeitas(Conds).
condicoes_satisfeitas(\+ Cond) :-
    writeln('Negação encontrada:'),
    writeln(Cond),
    (   \+ condicoes_satisfeitas(Cond)
    ->  writeln('Negação satisfeita.')
    ;   writeln('Negação falhou.'), fail
    ).
condicoes_satisfeitas(fact(A, V)) :-
    writeln('Condição simples:'),
    writeln(fact(A, V)),
    fact(A, V).

% Avalia lista de condições
condicoes_satisfeitas_lista([]).
condicoes_satisfeitas_lista([C|Cs]) :-
    condicoes_satisfeitas(C),
    condicoes_satisfeitas_lista(Cs).
