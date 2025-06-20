:- encoding(utf8).
:- module(triage, [start_triage/1]).

:- use_module(questions).
:- use_module(interface).
:- use_module(knowledge_base).

start_triage(_) :-
    interface:clear_answers,

    questions:question(tia_1, Q1),
    interface:ask_question(tia_1, Q1),
    interface:get_answer(tia_1, Ans1),

    (   Ans1 == sim ->
        questions:question(tia_2a, Q2a),
        interface:ask_question(tia_2a, Q2a),
        interface:get_answer(tia_2a, Ans2a),
        (   Ans2a == sim -> Fluxo = autoagressao ; Fluxo = agressao )
    ;   questions:question(tia_2b, Q2b),
        interface:ask_question(tia_2b, Q2b),
        interface:get_answer(tia_2b, Ans2b),
        (   Ans2b == sim -> Fluxo = embriaguez
        ;   questions:question(tia_3, Q3),
            interface:ask_question(tia_3, Q3),
            interface:get_answer(tia_3, Ans3),
            (   Ans3 == sim -> Fluxo = doenca_mental
            ;   questions:question(tia_4, Q4),
                interface:ask_question(tia_4, Q4),
                interface:get_answer(tia_4, Ans4),
                (   Ans4 == sim -> Fluxo = mal_estar ; Fluxo = desconhecido )
            )
        )
    ),

    coletar_sintomas(Fluxo),
    diagnostico_por_fluxo(Fluxo, Resultado-CF-Explicacao),
    format('\nA cor (ou rótulo) da pulseira atribuída é: ~w (CF = ~2f)\n', [Resultado, CF]),
    mostrar_explicacao(Explicacao).

diagnostico_por_fluxo(doenca_mental, R) :-
    knowledge_base:dm_diagnostico(R).
diagnostico_por_fluxo(autoagressao, R)   :-
    knowledge_base:aa_diagnostico(R).
diagnostico_por_fluxo(mal_estar, R)      :-
    knowledge_base:me_diagnostico(R).
diagnostico_por_fluxo(agressao, R)       :-
    knowledge_base:agressao_diagnostico(R).
diagnostico_por_fluxo(embriaguez, R)     :-
    knowledge_base:embriaguez_diagnostico(R).
diagnostico_por_fluxo(_, desconhecido-0-[]).

mostrar_explicacao([]).
mostrar_explicacao([CF-Cond|Rest]) :-
    format('Regra ativada com CF=~2f: ~w\n', [CF, Cond]),
    mostrar_explicacao(Rest).


coletar_sintomas(doenca_mental) :-
    questions:question(dm_1, Q1_vm), interface:ask_question(dm_1, Q1_vm), interface:get_answer(dm_1, Ans1_vm),
    (   Ans1_vm == sim 
    ->  !       
    ;   questions:question(dm_2, Q2_vm), interface:ask_question(dm_2, Q2_vm), interface:get_answer(dm_2, Ans2_vm),
        (   Ans2_vm == sim 
        ->  !   
        ;   
            perguntar_fatos([dm_1, dm_2, dm_3, dm_4, dm_5, dm_6, dm_7])
        )
    ).

coletar_sintomas(autoagressao) :-
    questions:question(aa_1, Q1_va), interface:ask_question(aa_1, Q1_va), interface:get_answer(aa_1, Ans1_va),
    (   Ans1_va == sim
    ->  !   
    ;  
        perguntar_fatos([aa_1, aa_2, aa_3, aa_4, aa_5, aa_6, aa_7])
    ).

coletar_sintomas(mal_estar) :-
    questions:question(me_1, Q1_vm), interface:ask_question(me_1, Q1_vm), interface:get_answer(me_1, Ans1_vm),
    (   Ans1_vm == sim 
    ->  !   
    ;   questions:question(me_2, Q2_vm), interface:ask_question(me_2, Q2_vm), interface:get_answer(me_2, Ans2_vm),
        (   Ans2_vm == sim 
        ->  !
        ;   perguntar_fatos([me_1, me_2, me_3, me_4, me_5, me_6, me_7])
        )
    ).

coletar_sintomas(agressao) :-
    questions:question(ag_1, Q1_va), interface:ask_question(ag_1, Q1_va), interface:get_answer(ag_1, Ans1_va),
    (   Ans1_va == sim
    ->  !
    ;   questions:question(ag_2, Q2_va), interface:ask_question(ag_2, Q2_va), interface:get_answer(ag_2, Ans2_va),
        (   Ans2_va == sim
        ->  !
        ;   perguntar_fatos([ag_1, ag_2, ag_3, ag_4, ag_5, ag_6, ag_7])
        )
    ).

coletar_sintomas(embriaguez) :-
    questions:question(emb_1, Q1_va), interface:ask_question(emb_1, Q1_va), interface:get_answer(emb_1, Ans1_va),
    (   Ans1_va == sim
    ->  !
    ;   questions:question(emb_2, Q2_va), interface:ask_question(emb_2, Q2_va), interface:get_answer(emb_2, Ans2_va),
        (   Ans2_va == sim
        ->  !
        ;   perguntar_fatos([emb_1, emb_2, emb_3, emb_4, emb_5, emb_6, emb_7])
        )
    ).

coletar_sintomas(_) :- true.

perguntar_fatos([]).
perguntar_fatos([ID | Rest]) :-
    (   interface:fact(ID, _)    
    ->  true
    ;   questions:question(ID, Q),
        interface:ask_question(ID, Q),
        interface:get_answer(ID, _)
    ),
    perguntar_fatos(Rest).
