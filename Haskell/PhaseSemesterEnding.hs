module PhaseSemesterEnding(phaseSemesterEnding) where
import Types

phaseSemesterEnding = Phase [
    Day "Dia 1: Reposição 1\n\tVocê dormiu demais e tem que se apressar para chegar a tempo na Uni." [
        Mission "O dia começou (8h)\nPrimeira prova às 8h (reposição de Calculo II)\n\t Devo me concentrar na prova, pois ela influenciará na sua nota\n\tIsto é, se sair bem ajudará na prova final." [
            Action "Quero primeiro tomar café e tomar um banho, assim fico novo em folha para enfrentar o dia" "Perderei tempo preparando meu café, ainda tenho que pegar o busão." (ChangeAttr 2 0 3 0),
            Action "Vou tomar um banho rápido e comprar um café no Amarelinho" "Perderei mais dinheiro, mas assim não perco tanto tempo." (ChangeAttr (-2) (-3) 1 0),
            Action "Não vou tomar banho nem tomar café" "Economizo dinheiro e tempo, mas assim não despertarei meu corpo o suficiente." (ChangeAttr (-4) 0 (-3) (-1))
        ]
    ]

    Day "Dia 2: Reposição 2\n\tVocê está cansado e começa a ter um ínicio de crise de ansiedade\n\tporque não achou que foi bem na prova anterior." [
        Mission "10h - Próxima prova às 14h (reposição de EDA). Preciso me se sentir melhor para a prova." [
            Action "Volto pra casa, tomo banho e descanso/reviso o assunto" "Perderei tempo e dinheiro (ainda terei que voltar para facul), mas me sentirei melhor para o resto do dia." (ChangeAttr 3 (-4) 1 (-2)),
            Action "Vou almoçar lá em humanas e depois tirar um cochilo na quadra" "Perderei tempo e dineiro, mas me sentirei melhor." ChangeAttr (1 (-3) 1 (-1)),
            Action "Vou comprar mais café, almoçar e revisar um assunto que não lembro tão bem" "Aproveitarei meu tempo, mas perderei dinheiro e sanidade." (ChangeAttr (-3) (-3) 0 1)
        ]
    ]

    Day "Dia 3: Final 1\n\tVocê descansou pouco essa noite devido à final de hoje,\n\testá desmotivado devido a dificuldade do dia anterior e sabe que hoje vai ser pior." [
        Mission "8h - Próxima prova às 10h (final de Calculo II). Preciso me se sentir melhor para a prova." [
            Action "Durante o café decido mandar uma mensagem pro contatinho da facul: 'Almoçar juntos?' e vou pra facul" "Ansiedade aumenta, ela visualizou e não respondeu." (ChangeAttr (-2) 1 3 0),
            Action "Decido tomar café na facul, no caminho encontro amigos e começo a discutir sobre a prova final" "Aumento meu conhecimento, mas perco dinheiro e energia." ChangeAttr (0 (-3) (-2) 1),
            Action "Faço um café e levo pra facul, apresso o passo para chegar logo na sala e revisar algo antes da prova" "Ganho pouco conecimento, economizo tempo e dineiro, mas perco energia e sanidade." (ChangeAttr (-3) 0 (-3) 2),
        ]
    ]

    Day "Dia 3: Final 2\n\tVocê descansou um pouco mais essa manhã,\n\tcontinua desmotivado devido a dificuldade do dia anterior e sabe que hoje é tudo ou nada." [
        Mission "10h - Próxima prova às 14h (final de EDA). Preciso me se sentir melhor para a prova." [
            Action "Só faço comer e revisar o dia todo" "Ganho conhecimento, mas perco muita sanidade e energia." (ChangeAttr (-4) (-1) (-3) 5),
            Action "Durante o café converso com um amigo por telefone sobre a prova de hoje" "Ansiedade aumenta, mas economizo tempo e dinheiro, além de ganhar um pouco de conhecimento por ter tirado uma dúvida com meu colega de sala." (ChangeAttr (-4) (-1) 3 1),
            Action "Decido tomar café na facul, fico na biblioteca dando o gás para a última prova do semestre" "Aumento meu conhecimento, mas perco sanidade, dinheiro e energia." (ChangeAttr (-2) (-3) (-3) 5)
            Action "Fico em casa e descanso um pouco mais, assisto um desenho e ligo pro meu contatinho" "Ganho um pouco de sanidade e energia, economizo tempo e dinheiro, mas perco muito conhecimento" (ChangeAttr 2 (-1) 3 (-5))
        ]
    ]
]    