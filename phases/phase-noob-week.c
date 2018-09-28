void phase_max(struct game *gm){
	struct phase *ph = createPhase("Semana Fera", 2);

		struct day *dy = createDay("Bem vindo a UFCG.", "Ao fim dessa etapa, começamos nossa jornada Universitaria.", 3);

			struct mission *msn = createMission("Ao iniciar o Curso, todos tem que passar pelo\n processo de montagem de grade. Desse modo, decida\nquais cadeiras escolher.", 3);

				struct action *act = createAction("FMCC1, P1, LP1, IC, LPT", "Você faz o perfil de Aluno Padrao" -5, 0, +5, +5);
				addActionToMission(msn, act);

				act = createAction("Vet, Direito, InfoSoc, Adm, LPT", "Você faz o perfil de Aluno Easy" +5, +5, 0, -5);
				addActionToMission(msn, act);

				act = createAction("FMCC1, P1, LP1, IC, LPT, AA", "Voce faz o perfil de Aluno Competitivo", -5, 0, 0, +10);
				addActionToMission(msn, act);


		addMissionToDay(dy, msn);

			msn = createMission("Apos o cadastro das cadeiras, todos devem passar pela apresentacao\nem publico. Desse modo, decida como voce se apresentarah.", 3);

				act = createAction("Ficarei timido, e citarei apenas meu nome.", "Arrancou poucas risadas, mas tenho certeza que alguem notou voce ali." -5, 0, 0, 0);
				addActionToMission(msn, act);

				act = createAction("Improvisarei algo divertido, de acordo com o que falarem.", "Parabens, uma mina ao fundo gritou por ti, e abriu muitas risadas." +5, 0, 0, 0);
				addActionToMission(msn, act);

				act = createAction("Inaugurarei a dancia que estive treinando esses dias.", "Apesar de ter sido bem desajeitado(a), voce se saiu bem.", +5, 0, -5, 0);
				addActionToMission(msn, act);

		addMissionToDay(dy, msn);

			msn = createMission("Voce esta chegando ao fim da semana fera, e tudo que falta concluir\neh o ciclo de amizades inicial. Voce se identificou com 3 grupos iniciais,\nmas soh poderah escolher apenas um.", 3);

				act = createAction("Escolho esse grupo que cantou a abertura de DB GT.", "Esse grupo eh fiel, seu poder de forca sera +8000." +5, 0, 0, 0);
				addActionToMission(msn, act);

				act = createAction("Escolho ficar com esses caras que vieram do IF.", "Parabens! Esse grupo eh muito inteligente, tens muito suporte de agora em diante." 0, 0, 0, +5);
				addActionToMission(msn, act);

				act = createAction("Essa galera animada me animou junto, e tem um(a) crush no meio.", "Opa, por sorte, eles ainda te bancaram o role dessa semana.", 0, +5, 0, 0);
				addActionToMission(msn, act);

		addMissionToDay(dy, msn);

	addDayToPhase(ph, dy);
	
addPhaseToGameLoop(gm, ph);
}