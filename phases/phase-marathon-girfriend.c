void phase_marathon_girfriend(struct game *gm){
	struct phase *ph = createPhase("A maratona dos sertoes", 4);


		struct day *dy = createDay("Primeiro dia de treinos - você acorda e vai para a UFCG assistir a aula de estruturas de dados", 3);


			struct mission *msn = createMission("A aula comecou - prof. Dalbas explica a árove vermelho e preta, voce fia na duvida sobre a parte das insercoes", 3);


				struct action *act = createAction("Levanta a mão, espera ele te notar e pergunta sobre\n\tessas regras malucas que esses russos inventaram", "Ele te nota, responde calmamente e voce entende perfeitamente", +1, 0, 0, +7);
				addActionToMission(msn, act);

				act = createAction("Interrompe a explicacao, explica o problema que esta tendo \n\te solicita que o prof explique melhor como que essa coisa funciona", "Dalbas não gostou de ser interrompido. Voce leva um esporro \n\tna frente da turma toda e ele explica resmungando. Voce entende uma parte. \n\tainda restam duvidas mas voce decide nao incomodar mais", -2, 0, 0, +4);
				addActionToMission(msn, act);

				act = createAction("Voce acha que esse assunto nunca vai te fazer falta resolve\n\tse aconchegar melhor na cadeira e tirar uma soneca por que pqp, aula de 8h? isso nao e coisa de gente", "voce dorme como um condenado e acorda no fim da aula as energias revigoradas", +2, 0, +7, -3);
				addActionToMission(msn, act);


		addMissionToDay(dy, msn);
	addDayToPhase(ph, dy);
	addPhaseToGameLoop(gm, ph);
}
