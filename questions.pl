:- encoding(utf8).
:- module(questions, [question/2]).
:- dynamic question/2.

question(tia_1, '1ª questão - A pessoa apresenta sinais de agressividade ou lesão autoprovocada? (sim/nao)').
question(tia_2a, '2A) A pessoa apresenta sinais de lesões autoprovocadas? (sim/nao)').
question(tia_2b, '2B) A pessoa apresenta odor a álcool ou fala arrastada? (sim/nao)').
question(tia_3, 'A pessoa apresenta alucinações ou discurso incoerente? (sim/nao)').
question(tia_4, 'A pessoa tem sintomas físicos como tontura, sudorese ou palidez? (sim/nao)').

question(dm_1, 'Doença Mental Fase Vermelha - A pessoa está com dificuldades ao respirar e/ou parece sufocado? (sim/nao)').
question(dm_2, 'Doença Mental Fase Vermelha - A pessoa está muito pálida, a tremer ou a suar? (sim/nao)').
question(dm_3, 'Doença Mental Fase Laranja - A pessoa está muito agressiva, tenta magoar alguém ou menciona querer magoar alguém? (sim/nao)').
question(dm_4, 'Doença Mental Fase Laranja - A pessoa está muito agitada ou com um olhar perdido? (sim/nao)').
question(dm_5, 'Doença Mental Fase Amarela - A pessoa está a dizer coisas sem sentido ou diz ver coisas que não existem? (sim/nao)').
question(dm_6, 'Doença Mental Fase Verde - A pessoa está calma e consegue falar coerentemente? (sim/nao)').
question(dm_7, 'Doença Mental Fase Verde - A pessoa não apresenta sinais de fraqueza, mal estar ou tonturas? (sim/nao)').

question(aa_1, 'AutoAgressão Fase Vermelha - O paciente apresenta respiração inadequada, impossibilitada, hemorragia maciça, sinais de choque? (sim/nao)').
question(aa_2, 'AutoAgressão Fase Laranja - Houve alteração súbita da consciência ou fala incoerente, agitação severa não controlável? (sim/nao)').
question(aa_3, 'AutoAgressão Fase Laranja - A pessoa apresenta dor intensa? (sim/nao)').
question(aa_4, 'AutoAgressão Fase Amarela - A pessoa apresenta um indício de tosse com sangue? (sim/nao)').
question(aa_5, 'AutoAgressão Fase Amarela - A pessoa apresenta vómito com sangue? (sim/nao)').
question(aa_6, 'AutoAgressão Fase Verde - A pessoa está febril (acima de 37,8°C) mas sem outros sinais de gravidade? (sim/nao)').
question(aa_7, 'AutoAgressão Fase Verde - A pessoa sente alguma dor leve que começou recentemente? (sim/nao)').

question(me_1, 'Mal Estar Adulto Fase Vermelha - A pessoa apresenta pressão arterial muito baixa, extremidades frias, confusão, pulso muito fraco, tremores, suor frio (agora ou há menos de 5 minutos)? (sim/nao)').
question(me_2, 'Mal Estar Adulto Fase Vermelha - A pessoa está com obstrução das vias aéreas ou respiração muito difícil? (sim/nao)').
question(me_3, 'Mal Estar Adulto Fase Laranja - Houve alteração súbita da consciência, como confusão repentina ou sonolência incomum? (sim/nao)').
question(me_4, 'Mal Estar Adulto Fase Laranja - Você apresenta pressão arterial muito baixa ou pulso muito rápido, lento ou irregular? (sim/nao)').
question(me_5, 'Mal Estar Adulto Fase Amarela - A pessoa sente dor no peito forte ou irradiação para o braço ou mandíbula ou suor frio? (sim/nao)').
question(me_6, 'Mal Estar Adulto Fase Verde - A pessoa está febril (acima de 37,8°C) mas sem outros sinais de gravidade? (sim/nao)').
question(me_7, 'Mal Estar Adulto Fase Verde - A pessoa sente alguma dor leve que começou recentemente? (sim/nao)').

question(ag_1, 'Agressão Fase Vermelha - A pessoa apresenta ferimentos superficiais? (sim/nao)').
question(ag_2, 'Agressão Fase Vermelha - A pessoa diz ter causado ferimentos graves a si própria ou a terceiros? (sim/nao)').
question(ag_3, 'Agressão Fase laranja - A pessoa apresenta sinais moderados de agressividade? (sim/nao)').
question(ag_4, 'Agressão Fase Laranja - A pessoa tem comportamento extremamente agitado ou imprevisível, representando risco iminente? (sim/nao)').
question(ag_5, 'Agressão Fase Amarela - A pessoa apresenta hematomas extensos ou lacerações que requerem sutura? (sim/nao)').
question(ag_6, 'Agressão Fase Verde - A pessoa parece ansiosa ou agitada, mas sem risco imediato? (sim/nao)').
question(ag_7, 'Agressão Fase Verde - A pessoa está ciente de suas ações e demonstra capacidade de autocontrolo? (sim/nao)').

question(emb_1, 'Embriaguez Fase Vermelha - A pessoa apresenta sinais de intoxicação alcoólica grave? (sim/nao)').
question(emb_2, 'Embriaguez Fase Vermelha - A pessoa está inconsciente ou em risco de sufocamento devido à intoxicação? (sim/nao)').  
question(emb_3, 'Embriaguez Fase Laranja - A pessoa está desorientada? (sim/nao)').
question(emb_4, 'Embriaguez Fase Laranja - A pessoa apresenta fala arrastada e dificuldade de coordenação? (sim/nao)').
question(emb_5, 'Embriaguez Fase Amarela - A pessoa está levemente desorientada ou com dificuldades para manter o equilíbrio? (sim/nao)'). 
question(emb_6, 'Embriaguez Fase Verde - A pessoa está mais relaxada, mas ainda ciente de seu ambiente? (sim/nao)').  
question(emb_7, 'Embriaguez Fase Verde - A pessoa apresenta sinais iniciais de intoxicação, como fala ligeiramente alterada? (sim/nao)'). 
