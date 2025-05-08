:- encoding(utf8).
:- module(rules_auto, [regra/2]).
:- dynamic regra/2.

regra([\+ fact(dm_7, sim), \+ fact(dm_3, sim), \+ fact(dm_8, sim), \+ fact(dm_9, sim), \+ fact(dm_1, sim)], amarelo:0.67).
regra([\+ fact(dm_7, sim), \+ fact(dm_3, sim), \+ fact(dm_8, sim), \+ fact(dm_9, sim), \+ fact(dm_1, sim)], azul:0.33).
regra([\+ fact(dm_7, sim), \+ fact(dm_3, sim), \+ fact(dm_8, sim), \+ fact(dm_9, sim), fact(dm_1, sim)], amarelo:1.00).
regra([\+ fact(dm_7, sim), \+ fact(dm_3, sim), \+ fact(dm_8, sim), fact(dm_9, sim), \+ fact(dm_1, sim)], amarelo:0.88).
regra([\+ fact(dm_7, sim), \+ fact(dm_3, sim), \+ fact(dm_8, sim), fact(dm_9, sim), \+ fact(dm_1, sim)], azul:0.12).
regra([\+ fact(dm_7, sim), \+ fact(dm_3, sim), \+ fact(dm_8, sim), fact(dm_9, sim), fact(dm_1, sim)], amarelo:0.20).
regra([\+ fact(dm_7, sim), \+ fact(dm_3, sim), \+ fact(dm_8, sim), fact(dm_9, sim), fact(dm_1, sim)], laranja:0.80).
regra([\+ fact(dm_7, sim), \+ fact(dm_3, sim), fact(dm_8, sim), \+ fact(dm_6, sim), \+ fact(dm_1, sim)], amarelo:1.00).
regra([\+ fact(dm_7, sim), \+ fact(dm_3, sim), fact(dm_8, sim), \+ fact(dm_6, sim), fact(dm_1, sim)], amarelo:0.30).
regra([\+ fact(dm_7, sim), \+ fact(dm_3, sim), fact(dm_8, sim), \+ fact(dm_6, sim), fact(dm_1, sim)], laranja:0.70).
regra([\+ fact(dm_7, sim), \+ fact(dm_3, sim), fact(dm_8, sim), fact(dm_6, sim), \+ fact(dm_2, sim)], amarelo:0.17).
regra([\+ fact(dm_7, sim), \+ fact(dm_3, sim), fact(dm_8, sim), fact(dm_6, sim), \+ fact(dm_2, sim)], laranja:0.83).
regra([\+ fact(dm_7, sim), \+ fact(dm_3, sim), fact(dm_8, sim), fact(dm_6, sim), fact(dm_2, sim)], laranja:0.33).
regra([\+ fact(dm_7, sim), \+ fact(dm_3, sim), fact(dm_8, sim), fact(dm_6, sim), fact(dm_2, sim)], vermelho:0.67).
regra([\+ fact(dm_7, sim), fact(dm_3, sim), \+ fact(dm_4, sim), \+ fact(dm_6, sim), \+ fact(dm_9, sim)], amarelo:0.89).
regra([\+ fact(dm_7, sim), fact(dm_3, sim), \+ fact(dm_4, sim), \+ fact(dm_6, sim), \+ fact(dm_9, sim)], laranja:0.11).
regra([\+ fact(dm_7, sim), fact(dm_3, sim), \+ fact(dm_4, sim), \+ fact(dm_6, sim), fact(dm_9, sim)], amarelo:0.40).
regra([\+ fact(dm_7, sim), fact(dm_3, sim), \+ fact(dm_4, sim), \+ fact(dm_6, sim), fact(dm_9, sim)], laranja:0.60).
regra([\+ fact(dm_7, sim), fact(dm_3, sim), \+ fact(dm_4, sim), fact(dm_6, sim), \+ fact(dm_1, sim)], amarelo:0.36).
regra([\+ fact(dm_7, sim), fact(dm_3, sim), \+ fact(dm_4, sim), fact(dm_6, sim), \+ fact(dm_1, sim)], laranja:0.55).
regra([\+ fact(dm_7, sim), fact(dm_3, sim), \+ fact(dm_4, sim), fact(dm_6, sim), \+ fact(dm_1, sim)], vermelho:0.09).
regra([\+ fact(dm_7, sim), fact(dm_3, sim), \+ fact(dm_4, sim), fact(dm_6, sim), fact(dm_1, sim)], laranja:1.00).
regra([\+ fact(dm_7, sim), fact(dm_3, sim), fact(dm_4, sim), \+ fact(dm_1, sim), \+ fact(dm_8, sim)], laranja:1.00).
regra([\+ fact(dm_7, sim), fact(dm_3, sim), fact(dm_4, sim), \+ fact(dm_1, sim), fact(dm_8, sim)], laranja:0.80).
regra([\+ fact(dm_7, sim), fact(dm_3, sim), fact(dm_4, sim), \+ fact(dm_1, sim), fact(dm_8, sim)], vermelho:0.20).
regra([\+ fact(dm_7, sim), fact(dm_3, sim), fact(dm_4, sim), fact(dm_1, sim), \+ fact(dm_9, sim)], amarelo:0.20).
regra([\+ fact(dm_7, sim), fact(dm_3, sim), fact(dm_4, sim), fact(dm_1, sim), \+ fact(dm_9, sim)], laranja:0.80).
regra([\+ fact(dm_7, sim), fact(dm_3, sim), fact(dm_4, sim), fact(dm_1, sim), fact(dm_9, sim)], laranja:0.50).
regra([\+ fact(dm_7, sim), fact(dm_3, sim), fact(dm_4, sim), fact(dm_1, sim), fact(dm_9, sim)], vermelho:0.50).
regra([fact(dm_7, sim), \+ fact(dm_3, sim), \+ fact(dm_5, sim), \+ fact(dm_6, sim)], amarelo:0.40).
regra([fact(dm_7, sim), \+ fact(dm_3, sim), \+ fact(dm_5, sim), \+ fact(dm_6, sim)], laranja:0.60).
regra([fact(dm_7, sim), \+ fact(dm_3, sim), \+ fact(dm_5, sim), fact(dm_6, sim)], laranja:1.00).
regra([fact(dm_7, sim), \+ fact(dm_3, sim), fact(dm_5, sim), \+ fact(dm_1, sim), \+ fact(dm_4, sim)], amarelo:0.62).
regra([fact(dm_7, sim), \+ fact(dm_3, sim), fact(dm_5, sim), \+ fact(dm_1, sim), \+ fact(dm_4, sim)], laranja:0.38).
regra([fact(dm_7, sim), \+ fact(dm_3, sim), fact(dm_5, sim), \+ fact(dm_1, sim), fact(dm_4, sim)], amarelo:0.20).
regra([fact(dm_7, sim), \+ fact(dm_3, sim), fact(dm_5, sim), \+ fact(dm_1, sim), fact(dm_4, sim)], laranja:0.80).
regra([fact(dm_7, sim), \+ fact(dm_3, sim), fact(dm_5, sim), fact(dm_1, sim), \+ fact(dm_6, sim)], laranja:0.80).
regra([fact(dm_7, sim), \+ fact(dm_3, sim), fact(dm_5, sim), fact(dm_1, sim), \+ fact(dm_6, sim)], vermelho:0.20).
regra([fact(dm_7, sim), \+ fact(dm_3, sim), fact(dm_5, sim), fact(dm_1, sim), fact(dm_6, sim)], laranja:0.40).
regra([fact(dm_7, sim), \+ fact(dm_3, sim), fact(dm_5, sim), fact(dm_1, sim), fact(dm_6, sim)], vermelho:0.60).
regra([fact(dm_7, sim), fact(dm_3, sim), \+ fact(dm_9, sim), \+ fact(dm_4, sim)], amarelo:0.11).
regra([fact(dm_7, sim), fact(dm_3, sim), \+ fact(dm_9, sim), \+ fact(dm_4, sim)], laranja:0.78).
regra([fact(dm_7, sim), fact(dm_3, sim), \+ fact(dm_9, sim), \+ fact(dm_4, sim)], vermelho:0.11).
regra([fact(dm_7, sim), fact(dm_3, sim), \+ fact(dm_9, sim), fact(dm_4, sim), \+ fact(dm_8, sim)], laranja:0.67).
regra([fact(dm_7, sim), fact(dm_3, sim), \+ fact(dm_9, sim), fact(dm_4, sim), \+ fact(dm_8, sim)], vermelho:0.33).
regra([fact(dm_7, sim), fact(dm_3, sim), \+ fact(dm_9, sim), fact(dm_4, sim), fact(dm_8, sim)], laranja:0.25).
regra([fact(dm_7, sim), fact(dm_3, sim), \+ fact(dm_9, sim), fact(dm_4, sim), fact(dm_8, sim)], vermelho:0.75).
regra([fact(dm_7, sim), fact(dm_3, sim), fact(dm_9, sim), \+ fact(dm_4, sim)], laranja:0.50).
regra([fact(dm_7, sim), fact(dm_3, sim), fact(dm_9, sim), \+ fact(dm_4, sim)], vermelho:0.50).
regra([fact(dm_7, sim), fact(dm_3, sim), fact(dm_9, sim), fact(dm_4, sim)], vermelho:1.00).

regra([true], azul:0.0).
