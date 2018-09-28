void phase_period_ending(struct game *gm){

    struct phase *ph = createPhase("Fim de período: O inferno universitário", 4);

        struct day *dy = createDay("Dia 1: Reposição 1\n\tVocê dormiu demais e tem que se apressar para chegar a tempo na Uni", 1);
            
            struct mission *msn = createMission("O dia começou (8h)\nPrimeira prova às 8h (reposição de Calculo II)\n\t Deve se concentrar na prova, pois ela influenciará na sua nota\n\tIsto é, se sair bem ajudará na prova final", 3);

                struct action *act = createAction("Quero primeiro tomar café e tomar um banho, assim fico novo em folha para enfrentar o dia", "Perderei tempo preparando meu café, ainda tenho que pegar o busão", 2, 0, 3, 0);
                addActionToMission(msn, act);

                act = createAction("Vou tomar um banho rápido e comprar um café no Amarelinho", "Perderei mais dinheiro, mas assim não perco tanto tempo", -2, -3, 1, 0);
                addActionToMission(msn, act);

                act = createAction("Não vou tomar banho nem tomar café", "Economizo dinheiro e tempo, mas assim não despertarei meu corpo o suficiente", -5, 0, -3, -1);
                addActionToMission(msn, act);
            
            addMissionToDay(dy, msn);

        addDayToPhase(ph, dy);

        dy = createDay("Dia 1: Reposição 2\n\tVocê está cansado e começa a ter um ínicio de crise de ansiedade\n\tporque não achou que foi bem na prova anterior", 1);
            
            msn = createMission("10h - Próxima prova às 14h (reposição de EDA). Preciso me se sentir melhor para a prova", 3);

                act = createAction("Volto pra casa, tomo banho e descanso/reviso o assunto", "Perderei tempo e dinheiro (ainda terei que voltar para facul), mas me sentirei melhor para o resto do dia", 3, -4, 1, -2);
                addActionToMission(msn, act);

                act = createAction("Vou almoçar lá em humanas e depois tirar um cochilo na quadra", "Perderei tempo e dineiro, mas me sentirei melhor", 1, -3, 1, -2);
                addActionToMission(msn, act);

                act = createAction("Vou comprar mais café, almoçar e revisar um assunto que não lembro tão bem", "Aproveitarei meu tempo, mas perderei dinheiro e sanidade", -5, -5, 0, 1);
                addActionToMission(msn, act);
            
            addMissionToDay(dy, msn);

        addDayToPhase(ph, dy);

        dy = createDay("Dia 2: Final 1\n\tVocê descansou pouco essa noite devido à final de hoje,\n\testá desmotivado devido a dificuldade do dia anterior e sabe que hoje vai ser pior", 1);
            
            msn = createMission("8h - Próxima prova às 10h (final de Calculo II). Preciso me se sentir melhor para a prova", 3);

                act = createAction("Durante o café decido mandar uma mensagem pro contatinho da facul: 'Almoçar juntos?' e vou pra facul", "Ansiedade aumenta, ela visualizou e não respondeu", -2, 1, 3, 0);
                addActionToMission(msn, act);

                act = createAction("Decido tomar café na facul, no caminho encontro amigos e começo a discutir sobre a prova final", "Aumento meu conhecimento, mas perco dinheiro e energia ", 0, -5, -2, 1);
                addActionToMission(msn, act);

                act = createAction("Faço um café e levo pra facul, apresso o passo para chegar logo na sala e revisar algo antes da prova", "Ganho pouco conecimento, economizo tempo e dineiro, mas perco energia e sanidade", -3, 0, -3, 2);
                addActionToMission(msn, act);
            
            addMissionToDay(dy, msn);

        addDayToPhase(ph, dy);

        dy = createDay("Dia 3: Final 2\n\tVocê descansou um pouco mais essa manhã,\n\tcontinua desmotivado devido a dificuldade do dia anterior e sabe que hoje é tudo ou nada", 1);
            
            msn = createMission("10h - Próxima prova às 14h (final de EDA). Preciso me se sentir melhor para a prova", 4);

                act = createAction("Só faço comer e revisar o dia todo", "Ganho conhecimento, mas perco muita sanidade e energia", -4, -1, -4, 5);
                addActionToMission(msn, act);

                act = createAction("Durante o café converso com um amigo por telefone sobre a prova de hoje", "Ansiedade aumenta, mas economizo tempo e dinheiro, além de ganhar um pouco de conhecimento por ter tirado uma dúvida com meu colega de sala", -4, -1, 3, 1);
                addActionToMission(msn, act);

                act = createAction("Decido tomar café na facul, fico na biblioteca dando o gás para a última prova do semestre", "Aumento meu conhecimento, mas perco sanidade, dinheiro e energia ", -2, -4, -3, 5);
                addActionToMission(msn, act);

                act = createAction("Fico em casa e descanso um pouco mais, assisto um desenho e ligo pro meu contatinho", "Ganho um pouco de sanidade e energia, economizo tempo e dinheiro, mas perco muito conhecimento", 2, -2, 3, -6);
                addActionToMission(msn, act);
            
            addMissionToDay(dy, msn);

        addDayToPhase(ph, dy);

    addPhaseToGameLoop(gm, ph);
}