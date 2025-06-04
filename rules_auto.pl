:- encoding(utf8).
:- module(rules_auto, [regra/2]).
:- dynamic regra/2.

if(\+ fact(dm_7, sim) , \+ fact(dm_3, sim) , \+ fact(dm_8, sim) , \+ fact(dm_9, sim) , \+ fact(dm_1, sim)) then amarelo:0.67.
if(\+ fact(dm_7, sim) , \+ fact(dm_3, sim) , \+ fact(dm_8, sim) , \+ fact(dm_9, sim) , \+ fact(dm_1, sim)) then azul:0.33.
if(\+ fact(dm_7, sim) , \+ fact(dm_3, sim) , \+ fact(dm_8, sim) , \+ fact(dm_9, sim) , fact(dm_1, sim)) then amarelo:1.00.
if(\+ fact(dm_7, sim) , \+ fact(dm_3, sim) , \+ fact(dm_8, sim) , fact(dm_9, sim) , \+ fact(dm_1, sim)) then amarelo:0.88.
if(\+ fact(dm_7, sim) , \+ fact(dm_3, sim) , \+ fact(dm_8, sim) , fact(dm_9, sim) , \+ fact(dm_1, sim)) then azul:0.12.
if(\+ fact(dm_7, sim) , \+ fact(dm_3, sim) , \+ fact(dm_8, sim) , fact(dm_9, sim) , fact(dm_1, sim)) then amarelo:0.20.
if(\+ fact(dm_7, sim) , \+ fact(dm_3, sim) , \+ fact(dm_8, sim) , fact(dm_9, sim) , fact(dm_1, sim)) then laranja:0.80.
if(\+ fact(dm_7, sim) , \+ fact(dm_3, sim) , fact(dm_8, sim) , \+ fact(dm_6, sim) , \+ fact(dm_1, sim)) then amarelo:1.00.
if(\+ fact(dm_7, sim) , \+ fact(dm_3, sim) , fact(dm_8, sim) , \+ fact(dm_6, sim) , fact(dm_1, sim)) then amarelo:0.30.
if(\+ fact(dm_7, sim) , \+ fact(dm_3, sim) , fact(dm_8, sim) , \+ fact(dm_6, sim) , fact(dm_1, sim)) then laranja:0.70.
if(\+ fact(dm_7, sim) , \+ fact(dm_3, sim) , fact(dm_8, sim) , fact(dm_6, sim) , \+ fact(dm_2, sim)) then amarelo:0.17.
if(\+ fact(dm_7, sim) , \+ fact(dm_3, sim) , fact(dm_8, sim) , fact(dm_6, sim) , \+ fact(dm_2, sim)) then laranja:0.83.
if(\+ fact(dm_7, sim) , \+ fact(dm_3, sim) , fact(dm_8, sim) , fact(dm_6, sim) , fact(dm_2, sim)) then laranja:0.33.
if(\+ fact(dm_7, sim) , \+ fact(dm_3, sim) , fact(dm_8, sim) , fact(dm_6, sim) , fact(dm_2, sim)) then vermelho:0.67.
if(\+ fact(dm_7, sim) , fact(dm_3, sim) , \+ fact(dm_4, sim) , \+ fact(dm_6, sim) , \+ fact(dm_9, sim)) then amarelo:0.89.
if(\+ fact(dm_7, sim) , fact(dm_3, sim) , \+ fact(dm_4, sim) , \+ fact(dm_6, sim) , \+ fact(dm_9, sim)) then laranja:0.11.
if(\+ fact(dm_7, sim) , fact(dm_3, sim) , \+ fact(dm_4, sim) , \+ fact(dm_6, sim) , fact(dm_9, sim)) then amarelo:0.40.
if(\+ fact(dm_7, sim) , fact(dm_3, sim) , \+ fact(dm_4, sim) , \+ fact(dm_6, sim) , fact(dm_9, sim)) then laranja:0.60.
if(\+ fact(dm_7, sim) , fact(dm_3, sim) , \+ fact(dm_4, sim) , fact(dm_6, sim) , \+ fact(dm_1, sim)) then amarelo:0.36.
if(\+ fact(dm_7, sim) , fact(dm_3, sim) , \+ fact(dm_4, sim) , fact(dm_6, sim) , \+ fact(dm_1, sim)) then laranja:0.55.
if(\+ fact(dm_7, sim) , fact(dm_3, sim) , \+ fact(dm_4, sim) , fact(dm_6, sim) , \+ fact(dm_1, sim)) then vermelho:0.09.
if(\+ fact(dm_7, sim) , fact(dm_3, sim) , \+ fact(dm_4, sim) , fact(dm_6, sim) , fact(dm_1, sim)) then laranja:1.00.
if(\+ fact(dm_7, sim) , fact(dm_3, sim) , fact(dm_4, sim) , \+ fact(dm_1, sim) , \+ fact(dm_8, sim)) then laranja:1.00.
if(\+ fact(dm_7, sim) , fact(dm_3, sim) , fact(dm_4, sim) , \+ fact(dm_1, sim) , fact(dm_8, sim)) then laranja:0.80.
if(\+ fact(dm_7, sim) , fact(dm_3, sim) , fact(dm_4, sim) , \+ fact(dm_1, sim) , fact(dm_8, sim)) then vermelho:0.20.
if(\+ fact(dm_7, sim) , fact(dm_3, sim) , fact(dm_4, sim) , fact(dm_1, sim) , \+ fact(dm_9, sim)) then amarelo:0.20.
if(\+ fact(dm_7, sim) , fact(dm_3, sim) , fact(dm_4, sim) , fact(dm_1, sim) , \+ fact(dm_9, sim)) then laranja:0.80.
if(\+ fact(dm_7, sim) , fact(dm_3, sim) , fact(dm_4, sim) , fact(dm_1, sim) , fact(dm_9, sim)) then laranja:0.50.
if(\+ fact(dm_7, sim) , fact(dm_3, sim) , fact(dm_4, sim) , fact(dm_1, sim) , fact(dm_9, sim)) then vermelho:0.50.
if(fact(dm_7, sim) , \+ fact(dm_3, sim) , \+ fact(dm_5, sim) , \+ fact(dm_6, sim)) then amarelo:0.40.
if(fact(dm_7, sim) , \+ fact(dm_3, sim) , \+ fact(dm_5, sim) , \+ fact(dm_6, sim)) then laranja:0.60.
if(fact(dm_7, sim) , \+ fact(dm_3, sim) , \+ fact(dm_5, sim) , fact(dm_6, sim)) then laranja:1.00.
if(fact(dm_7, sim) , \+ fact(dm_3, sim) , fact(dm_5, sim) , \+ fact(dm_1, sim) , \+ fact(dm_4, sim)) then amarelo:0.62.
if(fact(dm_7, sim) , \+ fact(dm_3, sim) , fact(dm_5, sim) , \+ fact(dm_1, sim) , \+ fact(dm_4, sim)) then laranja:0.38.
if(fact(dm_7, sim) , \+ fact(dm_3, sim) , fact(dm_5, sim) , \+ fact(dm_1, sim) , fact(dm_4, sim)) then amarelo:0.20.
if(fact(dm_7, sim) , \+ fact(dm_3, sim) , fact(dm_5, sim) , \+ fact(dm_1, sim) , fact(dm_4, sim)) then laranja:0.80.
if(fact(dm_7, sim) , \+ fact(dm_3, sim) , fact(dm_5, sim) , fact(dm_1, sim) , \+ fact(dm_6, sim)) then laranja:0.80.
if(fact(dm_7, sim) , \+ fact(dm_3, sim) , fact(dm_5, sim) , fact(dm_1, sim) , \+ fact(dm_6, sim)) then vermelho:0.20.
if(fact(dm_7, sim) , \+ fact(dm_3, sim) , fact(dm_5, sim) , fact(dm_1, sim) , fact(dm_6, sim)) then laranja:0.40.
if(fact(dm_7, sim) , \+ fact(dm_3, sim) , fact(dm_5, sim) , fact(dm_1, sim) , fact(dm_6, sim)) then vermelho:0.60.
if(fact(dm_7, sim) , fact(dm_3, sim) , \+ fact(dm_9, sim) , \+ fact(dm_4, sim)) then amarelo:0.11.
if(fact(dm_7, sim) , fact(dm_3, sim) , \+ fact(dm_9, sim) , \+ fact(dm_4, sim)) then laranja:0.78.
if(fact(dm_7, sim) , fact(dm_3, sim) , \+ fact(dm_9, sim) , \+ fact(dm_4, sim)) then vermelho:0.11.
if(fact(dm_7, sim) , fact(dm_3, sim) , \+ fact(dm_9, sim) , fact(dm_4, sim) , \+ fact(dm_8, sim)) then laranja:0.67.
if(fact(dm_7, sim) , fact(dm_3, sim) , \+ fact(dm_9, sim) , fact(dm_4, sim) , \+ fact(dm_8, sim)) then vermelho:0.33.
if(fact(dm_7, sim) , fact(dm_3, sim) , \+ fact(dm_9, sim) , fact(dm_4, sim) , fact(dm_8, sim)) then laranja:0.25.
if(fact(dm_7, sim) , fact(dm_3, sim) , \+ fact(dm_9, sim) , fact(dm_4, sim) , fact(dm_8, sim)) then vermelho:0.75.
if(fact(dm_7, sim) , fact(dm_3, sim) , fact(dm_9, sim) , \+ fact(dm_4, sim)) then laranja:0.50.
if(fact(dm_7, sim) , fact(dm_3, sim) , fact(dm_9, sim) , \+ fact(dm_4, sim)) then vermelho:0.50.
if(fact(dm_7, sim) , fact(dm_3, sim) , fact(dm_9, sim) , fact(dm_4, sim)) then vermelho:1.00.

% Regra padrão para casos não cobertos
if(true) then azul:0.0.
