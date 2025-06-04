:- encoding(utf8).
:- module(triage_b, [start_triage/1]).

:- ensure_loaded(rules_auto).
:- use_module(rules_auto).
:- use_module(questions).

:- op(800, fx, if).
:- op(700, xfx, then).

:- dynamic fact/2.

start_triage(Classe) :-
    limpar_fatos,
    pedir_fatos,
    encontrar_classe(Classe).

limpar_fatos :-
    retractall(fact(_, _)).

atributo(dm_1).
atributo(dm_2).
atributo(dm_3).
atributo(dm_4).
atributo(dm_5).
atributo(dm_6).
atributo(dm_7).

pedir_fatos :-
    forall(atributo(Attr), perguntar_fato(Attr)).

perguntar_fato(Attr) :-
    \+ fact(Attr, _), 
    (   question(Attr, Pergunta)  
    ->  format('~s (sim/nao): ', [Pergunta])
    ;   format('~w (sim/nao): ', [Attr])
    ),
    flush_output,                            
    read_line_to_string(user_input, RespostaStr),
    normalizar_resposta(RespostaStr, Valor),
    assertz(fact(Attr, Valor)).              

normalizar_resposta(EntradaStr, sim) :-
    string_lower(EntradaStr, Lower),
    normalize_space(atom(Atom), Lower),
    member(Atom, [sim, s, yes, y]), !.
normalizar_resposta(EntradaStr, nao) :-
    string_lower(EntradaStr, Lower),
    normalize_space(atom(Atom), Lower),
    member(Atom, [nao, n, no]), !.
normalizar_resposta(_, nao).

encontrar_classe(ClasseFinal) :-
    findall(Prob-Classe, (
        regra(Condicoes, Classe:Prob),
        condicoes_satisfeitas_lista(Condicoes)
    ), ListaProbs),
    writeln('Regras aplicadas:'),
    writeln(ListaProbs),
    (   ListaProbs \= []
    ->  sort(0, @>=, ListaProbs, [_-ClasseFinal | _])  
    ;   
        ClasseFinal = azul
    ).

condicoes_satisfeitas_lista([]).
condicoes_satisfeitas_lista([C|Cs]) :-
    condicoes_satisfeitas(C),
    condicoes_satisfeitas_lista(Cs).

condicoes_satisfeitas((Cond1 , Conds)) :-
    condicoes_satisfeitas(Cond1),
    condicoes_satisfeitas(Conds).
condicoes_satisfeitas(\+ Cond) :-
    \+ condicoes_satisfeitas(Cond).
condicoes_satisfeitas(fact(A, V)) :-
    fact(A, V).
