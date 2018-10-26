void phase_noob_week(struct game *gm){
	struct phase *ph = createPhase("Semana Fera", 2);

		struct day *dy = createDay("Bem vindo a UFCG.\n Ao fim dessa etapa, começamos nossa jornada Universitaria.", 3);

			struct mission *msn = createMission("Ao iniciar o Curso, todos tem que passar pelo\n\tprocesso de montagem de grade. Desse modo, decida\n\tquais cadeiras escolher.", 3);

				struct action *act = createAction("FMCC1, P1, LP1, IC, LPT", "Você faz o perfil de Aluno Padrao", -5, 0, +5, +5);
				addActionToMission(msn, act);

				act = createAction("Vet, Direito, InfoSoc, Adm, LPT", "Você faz o perfil de Aluno Easy", +5, +5, 0, -5);
				addActionToMission(msn, act);

				act = createAction("FMCC1, P1, LP1, IC, LPT, AA", "Voce faz o perfil de Aluno Competitivo", -5, 0, 0, +10);
				addActionToMission(msn, act);


		addMissionToDay(dy, msn);

			msn = createMission("Apos o cadastro das cadeiras, todos devem passar pela apresentacao\n\tem publico. Desse modo, decida como voce se apresentar.", 3);

				act = createAction("Ficarei timido, e citarei apenas meu nome.", "Arrancou poucas risadas, mas tenho certeza que alguem notou voce ali.", -5, 0, 0, 0);
				addActionToMission(msn, act);

				act = createAction("Improvisarei algo divertido, de acordo com o que falarem.", "Parabens, uma mina ao fundo gritou por ti, e abriu muitas risadas.", +5, 0, 0, 0);
				addActionToMission(msn, act);

				act = createAction("Inaugurarei a dancia que estive treinando esses dias.", "Apesar de ter sido bem desajeitado(a), voce se saiu bem.", +5, 0, -5, 0);
				addActionToMission(msn, act);

		addMissionToDay(dy, msn);

			msn = createMission("Voce esta chegando ao fim da semana fera, e tudo que falta concluir\n\teh o ciclo de amizades inicial. Voce se identificou com 3 grupos iniciais,\n\tmas soh poderah escolher apenas um.", 3);

				act = createAction("Escolho esse grupo que cantou a abertura de DB GT.", "Esse grupo eh fiel, seu poder de forca sera +8000.", +5, 0, 0, 0);
				addActionToMission(msn, act);

				act = createAction("Escolho ficar com esses caras que vieram do IF.", "Parabens! Esse grupo eh muito inteligente, tens muito suporte de agora em diante.", 0, 0, 0, +5);
				addActionToMission(msn, act);

				act = createAction("Essa galera animada me animou junto, e tem uma crush no meio.", "Opa, por sorte, eles ainda te bancaram o role dessa semana.", 0, +5, 0, 0);
				addActionToMission(msn, act);

		addMissionToDay(dy, msn);

	addDayToPhase(ph, dy);

	dy = createDay("Primeiro Fim de Semana Fera se aproxima.\nApesar desse fim de semana ter passado rapido, seus objetivos continuam.", 2);

		msn = createMission("Diversas propostas surgiram para esse fim de semana universitario.", 3);

			act = createAction("Gustavo chamou para tomar uma com a galera, voce decide ir.", "Comecou bebendo pouco e acabou ficando ressacado no sabado,\n\tcom tempo de estudo livre apenas no domingo.", +2, -5, -1, +1);
			addActionToMission(msn, act);

			act = createAction("Anderson chamou para programar nas madrugas de sexta e sabado, voce decide aceitar.", "Codaram muito bem, ate conseguiram descansar um pouco mais no domingo.", +1, 0, -3, +4);
			addActionToMission(msn, act);

			act = createAction("Voce decide ir para casa descansar, estudar e se der sorte, jogar CS.", "Os estudos na sexta-feira foram por agua abaixo,\n\tno entando conseguiu recuperar, sozinho, os estudos e ainda jogou CS.", -1, +2, -1, +2);
			addActionToMission(msn, act);

		addMissionToDay(dy, msn);

		msn = createMission("Amanha e segunda, quais serao as prioridades dessa semana?", 3);

			act = createAction("Focar nos estudos, irei expor com os colegar sobre meu resumo feito hoje.", "Sua dedicacao atraiu um amigo de sala, e ainda\n\tresultou em um bom inicio de semana.", +1, 0, -2, +2);
			addActionToMission(msn, act);

			act = createAction("Juntar uma galera pra farrear depois da prova.", "Por sorte, um desses amigos que se interessaram eh muito \n\tinteligente. E ele ja se dispos a lhe ajudar quanto a prova tambem.", +1, -1, -1, +2);
			addActionToMission(msn, act);

			act = createAction("Como a prova eh quarta, irei focar individualmente ate la.", "Como o estudo foi sozinho, voce teve algumas duvidas\n\tconseguiu tirar algumas duvidas com os colegas antes da prova, mas nao foi o suficiente.", -1, 0, -2, +1);
			addActionToMission(msn, act);

		addMissionToDay(dy, msn);

	addDayToPhase(ph, dy);

addPhaseToGameLoop(gm, ph);
}
