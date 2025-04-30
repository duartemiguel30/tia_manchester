:- encoding(utf8).
:- module(triage, [start_triage/1]).

:- use_module(questions).
:- use_module(interface).
:- use_module(knowledge_base).

:- dynamic modo_auto/0.

start_triage(Modo) :-
    (Modo == auto -> assertz(modo_auto) ; true),
    interface:clear_answers,

    % Etapa Genérica
    fazer_pergunta(tia_1, Ans1),
    ( Ans1 == sim ->
        fazer_pergunta(tia_2a, Ans2a),
        ( Ans2a == sim -> Fluxo = autoagressao ; Fluxo = agressao )
    ; fazer_pergunta(tia_2b, Ans2b),
      ( Ans2b == sim -> Fluxo = embriaguez
      ; fazer_pergunta(tia_3, Ans3),
        ( Ans3 == sim -> Fluxo = doenca_mental
        ; fazer_pergunta(tia_4, Ans4),
          ( Ans4 == sim -> Fluxo = mal_estar ; Fluxo = desconhecido )
        )
      )
    ),

    coletar_sintomas(Fluxo),
    diagnostico_por_fluxo(Fluxo, Resultado-CF-Explicacao),
    format('\nA cor (ou rótulo) da pulseira atribuída é: ~w (CF = ~2f)\n', [Resultado, CF]),
    mostrar_explicacao(Explicacao),
    (modo_auto -> retract(modo_auto) ; true).

% ---------------------- Diagnóstico ------------------------

diagnostico_por_fluxo(doenca_mental, R) :- knowledge_base:dm_diagnostico(R).
diagnostico_por_fluxo(autoagressao, R)   :- knowledge_base:aa_diagnostico(R).
diagnostico_por_fluxo(mal_estar, R)      :- knowledge_base:me_diagnostico(R).
diagnostico_por_fluxo(agressao, R)       :- knowledge_base:agressao_diagnostico(R).
diagnostico_por_fluxo(embriaguez, R)     :- knowledge_base:embriaguez_diagnostico(R).
diagnostico_por_fluxo(_, desconhecido-0-[]).

mostrar_explicacao([]).
mostrar_explicacao([CF-Cond|Rest]) :-
    format('Regra ativada com CF=~2f: ~w\n', [CF, Cond]),
    mostrar_explicacao(Rest).

% ---------------------- Coleta de Sintomas ------------------------

coletar_sintomas(doenca_mental) :-
    perguntar_fatos([dm_1, dm_2, dm_3, dm_4, dm_5, dm_6, dm_7, dm_8, dm_9]).

coletar_sintomas(autoagressao) :-
    perguntar_fatos([aa_1, aa_2, aa_3, aa_4, aa_5, aa_7, aa_8, aa_9, aa_10, aa_11, aa_12, aa_13, aa_14, aa_15]).

coletar_sintomas(mal_estar) :-
    perguntar_fatos([me_1, me_2, me_3, me_4, me_5, me_6, me_7, me_8, me_9, me_10, me_11, me_12, me_13]).

coletar_sintomas(agressao) :-
    perguntar_fatos([ag_1, ag_2, ag_3]).

coletar_sintomas(embriaguez) :-
    perguntar_fatos([emb_1, emb_2, emb_3]).

coletar_sintomas(_) :- true.

% ---------------------- Modo Manual vs Automático ------------------------

fazer_pergunta(ID, Resposta) :-
    ( modo_auto ->
        knowledge_base:resposta_automatica(ID, Resposta)
    ; questions:question(ID, Q),
      interface:ask_question(ID, Q),
      interface:get_answer(ID, Resposta)
    ).

perguntar_fatos([]).
perguntar_fatos([ID | Rest]) :-
    fazer_pergunta(ID, _),
    perguntar_fatos(Rest).
