:- encoding(utf8).
:- module(knowledge_base_b, [
    dm_diagnostico/1,
    aa_diagnostico/1,
    me_diagnostico/1,
    agressao_diagnostico/1,
    embriaguez_diagnostico/1
]).

:- use_module(interface, [fact/2]).

% Definição de operadores personalizados
:- op(800, fx, if).
:- op(700, xfx, then).

% Garante que este KB só é usado na Parte B
:- (   current_predicate(use_auto_kb/0)
   ->  true
   ;   throw('knowledge_base_b.pl: use_auto_kb/0 não definido; execute via main_b.pl')
   ).

% Inclusão das regras geradas automaticamente
:- ['rules_auto.pl'].

% ---------------------- Cálculo de CF com explicação ------------------------
rule_cf(ID, Cor, CF) :-
    clause(if(fact(ID, sim)) then Cor:CF, true).
rule_cf(ID, Cor, CF) :-
    clause(if(fact(ID, Valor)) then Cor:CF, true),
    fact(ID, Valor).

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
    (   member(CFvermelho-vermelho-RegrasVermelho, CFs),
        CFvermelho >= 0.9
    ->  MelhorCor = vermelho,
        MelhorCF = CFvermelho,
        Explicacao = RegrasVermelho
    ;   sort(0, @>=, CFs, [MelhorCF-MelhorCor-Explicacao|_])
    ),
    !.
diagnostico(_, azul, 0, []).

% ---------------------- Diagnósticos por fluxo com explicação ------------------------
dm_diagnostico(Resultado-CF-Exp) :- diagnostico([vermelho, laranja, amarelo, verde], Resultado, CF, Exp).
aa_diagnostico(Resultado-CF-Exp) :- diagnostico([vermelho, laranja, amarelo, verde], Resultado, CF, Exp).
me_diagnostico(Resultado-CF-Exp) :- diagnostico([vermelho, laranja, amarelo, verde], Resultado, CF, Exp).
agressao_diagnostico(Resultado-CF-Exp) :- diagnostico([vermelho, laranja, amarelo, verde], Resultado, CF, Exp).
embriaguez_diagnostico(Resultado-CF-Exp) :- diagnostico([vermelho, laranja, amarelo, verde], Resultado, CF, Exp).
