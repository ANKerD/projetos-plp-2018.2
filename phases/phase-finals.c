void phase_finals(struct game *gm){
	struct phase *ph = createPhase("Semana das Finais", 2);

		struct day *dy = createDay("Você está se aproximando das provas finais do segundo periodo.", 3);

			struct mission *msn = createMission("Você tem uma prova do terceiro estágio de lp2, porém seu desempenho esse periodo não foi tão bom\n\t e você também tem algumas finais semana que vem. Decida o que você fará!", 3);

				struct action *act = createAction("Irei fazer essa prova de qualquer modo pois devo priorizar minhas finais", "Você não foi tão bem na prova já que não estava preparado, mas certamente irá melhor nas finais!", 0 , 0, -5, 0);
				addActionToMission(msn, act);

				act = createAction("Deixarei para repor farei semana que vem junto com as finais", "Você deixa pra repor e deixa os problemas para o seu eu do futuro!", +5, 0, +5, -5);
				addActionToMission(msn, act);

				act = createAction("Vou pedir conselhos pra uma amiga que estou conhecendo melhor", "A amiga em questão, diz que é melhor fazer a prova e\n\t te ajuda a se preparar com algumas dicas encima da hora!", -5, 0, -5, +5);
				addActionToMission(msn, act);


		addMissionToDay(dy, msn);

			msn = createMission("Você lembra que o final de semana está chegando e você está andando lado a lado com sua colega, você se recorda\n\t o quanto ela já te ajudou em provas passadas e como você viu ela pela primeira vez na semana do fera.\n\t O que você deseja fazer?", 3);

				act = createAction("Chamarei ela para uma festa esse final de semana, para que possa conhece-la melhor!", "Ela recusa na hora, -quem pensaria em festa num momento desses!! não imaginava isso de você!-", -5, 0, 0, 0);
				addActionToMission(msn, act);

				act = createAction("Acho que agora não é a hora de tentar nada, temos finais semana que vem!", "Você não fala nada e vai embora, porém fica com palavras presas na garganta, isso não faz bem pra saúde!", -5, 0, 0, +5);
				addActionToMission(msn, act);

				act = createAction("Vou chama-la para estudar comigo, quem sabe isso nos aproxima mais!", "Ela recusa pois já marcou de estudar com algumas amigas, mas fica feliz com o seu convite!", +5, 0, 0, 0);
				addActionToMission(msn, act);

		addMissionToDay(dy, msn);

			msn = createMission("Já é noite e você está no seu quarto, a fome bate na sua porta e você decide:", 3);

				act = createAction("Estou cansado porem farei comida, já que assim posso economizar mais!", "Você faz a comida, porém depois de cheio soma-se o cansaço e você pega no sono!", 0, +5, -5, 0);
				addActionToMission(msn, act);

				act = createAction("De modo algum eu vou fazer comida uma hora dessas, vou é pedir no ifood isso sim!", "A comida chega depois de um tempo, estava deliciosa, só doeu um pouco na carteira!!", 0, -10, 0, +5);
				addActionToMission(msn, act);

				act = createAction("Comer? comer não dá xp, eu vou estudar que vai ter aquele aulão agora!!", "Você não come de imediato mas vai ao aulão e recupera o conteúdo atrasado!", -5, 0, -10, +10);
				addActionToMission(msn, act);

		addMissionToDay(dy, msn);

	addDayToPhase(ph, dy);

	dy = createDay("Você já fez algumas das provas finais!", 3);

		msn = createMission("Hoje você tem um dia de folga, só tem provas amanhã! o que você fará?", 3);

			act = createAction("Vou chamar minha amiga de sempre pra estudar, hoje vai dar certo!", "Vocês estudam juntos e com isso vão bem nas provas!\n porém você está chateado por não aproveitar seu dia melhor!", +2, 0, -10, +5);
			addActionToMission(msn, act);

			act = createAction("AAAh finalmente um dia sem provas, vou dormir e jogar CS isso sim!", "Você se diverte bastante porém não estuda nada! e ainda perde o sono jogando! vai se dar mal hein...", +5, 0, -5, -5);
			addActionToMission(msn, act);

			act = createAction("Acho que vou sair com a galera, comemorar os resultados até agora!", "Você sai com o pessoal e se diverte bastante, porem gasta muito e não estuda nada!", +10, -10, -5, -5);
			addActionToMission(msn, act);

		addMissionToDay(dy, msn);

		msn = createMission("Você está fazendo a última prova final, porém está empacado em uma questão e agora?", 3);

			act = createAction("Vou tentar fazer de qualquer jeito e correr o risco de reprovar! pelo menos serei honesto!", "Você acaba desenvolvendo mais da questão do que esperava, talvez o professor reconheça seu esforço!", -5, 0, -5, +5);
			addActionToMission(msn, act);

			act = createAction("Tento olhar a resposta no celular já que deixei os slides preparados por precaução...", "O Professor passa por você enquanto você olha o celular\n\t, ele aparenta ter percebido porém você esconde\n\t o celular rápido e se safa dessa vez.", -5, 0, 0, 0);
			addActionToMission(msn, act);

			act = createAction("Tento ver a resposta por cima do ombro de alguém do lado...", "Sua amiga de sempre estava atrás de você e percebe sua agonia\n\t, ela te passa um papel com as respostas e o professor nem desconfia\n\tdeu sorte!", -1, 0, -2, +1);
			addActionToMission(msn, act);

		addMissionToDay(dy, msn);

		
		msn = createMission("Você sai da prova e quando estava indo embora lembra de algo que queria fazer, o que era mesmo?", 3);

			act = createAction("Vou esperar minha amiga sair da prova, hoje eu vou me declarar pra ela!", "Vocês saem e e vão andando embora, no caminho\n\tvocê a diz como se sente e ela... corresponde!\n\t Você agora está namorando com Maria Joaquina!", +10, 0, -5, 0);
			addActionToMission(msn, act);

			act = createAction("acho melhor ir embora, realmente preciso descansar!.", "No caminho saindo da faculdade, ela te alcança e te diz algo inesperado...\n\temocionado você corresponde seus sentimentos. \n\tVocê agora está namorando Maria Joaquina!", +10, 0, -5, 0);
			addActionToMission(msn, act);

			act = createAction("Vou espera-la, pelo menos para agradecer por ter me dado a resposta!!", "Você agradece pela resposta e pergunta porquê ela sempre lhe ajuda\n\t, a resposta não podia te deixar mais feliz, ela gosta de você\n\t você não perde tempo e também se declara.\n\tVocê agora está namorando Maria Joaquina!", +10, 0, -5, 0);
			addActionToMission(msn, act);

		addMissionToDay(dy, msn);

	addDayToPhase(ph, dy);

addPhaseToGameLoop(gm, ph);
}
