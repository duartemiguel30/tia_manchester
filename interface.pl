:- encoding(utf8).
:- module(interface, [ask_question/2, get_answer/2, clear_answers/0, fact/2]).

:- dynamic answer/2.
:- dynamic fact/2.

clear_answers :-
    retractall(answer(_, _)),
    retractall(fact(_, _)).

ask_question(Id, Question) :-
    write(Question), nl,
    read(Response),
    assertz(answer(Id, Response)),
    assertz(fact(Id, Response)).

get_answer(Id, Response) :- answer(Id, Response).
