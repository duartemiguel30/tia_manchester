:- encoding(utf8).
:- module(knowledge_base, [
    dm_diagnostico/1,
    aa_diagnostico/1,
    me_diagnostico/1,
    agressao_diagnostico/1,
    embriaguez_diagnostico/1
]).

:- use_module(interface, [fact/2]).

:- op(800, fx, if).
:- op(700, xfx, then).

% ---------------------- Regras ------------------------

% Doença Mental
if(fact(dm_1, sim)) then vermelho:1.
if(fact(dm_2, sim)) then vermelho:0.95.
if(fact(dm_3, sim)) then vermelho:0.8.
if(fact(dm_4, sim)) then laranja:0.85.
if(fact(dm_5, sim)) then laranja:0.8.
if(fact(dm_6, sim)) then amarelo:0.75.
if(fact(dm_7, sim)) then amarelo:0.7.
if((fact(dm_8, sim), fact(dm_9, sim))) then verde:0.9.

% Autoagressão
if(fact(aa_1, sim)) then vermelho:1.
if(fact(aa_2, sim)) then laranja:0.9.
if(fact(aa_3, sim)) then laranja:0.85.
if(fact(aa_4, sim)) then laranja:0.8.
if(fact(aa_5, sim)) then laranja:0.85.
if(fact(aa_7, sim)) then amarelo:0.75.
if(fact(aa_8, sim)) then amarelo:0.7.
if(fact(aa_9, sim)) then amarelo:0.7.
if(fact(aa_10, sim)) then amarelo:0.75.
if(fact(aa_11, sim)) then amarelo:0.7.
if(fact(aa_12, sim)) then amarelo:0.7.
if(fact(aa_13, sim)) then verde:0.6.
if(fact(aa_14, sim)) then verde:0.6.
if(fact(aa_15, sim)) then verde:0.6.

% Mal estar
if(fact(me_1, sim)) then vermelho:1.
if(fact(me_2, sim)) then vermelho:0.95.
if(fact(me_3, sim)) then laranja:0.85.
if(fact(me_4, sim)) then laranja:0.8.
if(fact(me_6, sim)) then laranja:0.75.
if(fact(me_7, sim)) then amarelo:0.75.
if(fact(me_8, sim)) then amarelo:0.75.
if(fact(me_9, sim)) then amarelo:0.7.
if(fact(me_10, sim)) then amarelo:0.7.
if(fact(me_11, sim)) then verde:0.6.
if(fact(me_12, sim)) then verde:0.6.
if(fact(me_13, sim)) then verde:0.6.

% Agressão
if(fact(ag_1, sim)) then vermelho:1.
if(fact(ag_2, sim)) then verde:0.95.
if(fact(ag_3, sim)) then laranja:0.8.

% Embriaguez
if(fact(emb_1, sim)) then vermelho:1.
if(fact(emb_2, sim)) then laranja:0.85.
if(fact(emb_3, sim)) then amarelo:0.8.

% ---------------------- Cálculo de CF com explicação ------------------------

rule_cf(ID, Cor, CF) :- clause(if(fact(ID, sim)) then Cor:CF, true).
rule_cf(ID, Cor, CF) :- clause(if(fact(ID, Valor)) then Cor:CF, true), fact(ID, Valor).

max_cf_explicado(Conclusion, TotalCF, RegrasAtivadas) :-
    findall(CF-(Cond), (
        clause(if(Cond) then Conclusion:CF, true),
        call(Cond)
    ), ListaRegras),
    findall(CF, member(CF-_, ListaRegras), CFList),
    sum_list(CFList, Sum),
    TotalCF is min(Sum, 1.0),
    RegrasAtivadas = ListaRegras.

diagnostico([], azul, 0, []).
diagnostico(ListaCores, MelhorCor, MelhorCF, Explicacao) :-
    findall(CF-Cor-Regras, (
        member(Cor, ListaCores),
        max_cf_explicado(Cor, CF, Regras),
        CF > 0
    ), CFs),
    (
        member(CFvermelho-vermelho-RegrasVermelho, CFs),
        CFvermelho >= 0.9
    ->
        MelhorCor = vermelho,
        MelhorCF = CFvermelho,
        Explicacao = RegrasVermelho
    ;
        sort(0, @>=, CFs, [MelhorCF-MelhorCor-Explicacao|_])
    ), !.
diagnostico(_, azul, 0, []).


% ---------------------- Diagnósticos por fluxo com explicação ------------------------

dm_diagnostico(Resultado-CF-Exp) :-
    diagnostico([vermelho, laranja, amarelo, verde], Resultado, CF, Exp).

aa_diagnostico(Resultado-CF-Exp) :- 
    diagnostico([vermelho, laranja, amarelo, verde], Resultado, CF, Exp).
    

me_diagnostico(Resultado-CF-Exp) :-
    diagnostico([vermelho, laranja, amarelo, verde], Resultado, CF, Exp).

agressao_diagnostico(Resultado-CF-Exp) :-
    diagnostico([vermelho, laranja, amarelo, verde], Resultado, CF, Exp).

embriaguez_diagnostico(Resultado-CF-Exp) :-
    diagnostico([vermelho, laranja, amarelo, verde], Resultado, CF, Exp).
