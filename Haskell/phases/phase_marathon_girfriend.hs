import "../types"

ph = Phase [
    Day "Primeiro dia de treinos - você acorda e vai para a UFCG assistir a aula de estruturas de dados" [
        Mission "A aula comecou - prof. Dalbas explica a árove vermelho e preta, voce fica na duvida sobre a parte das insercoes." [
            Action "Levanta a mão, espera ele te notar e pergunta sobre\n\tessas regras malucas que esses russos inventaram" "Dalbas não gostou de ser interrompido. Voce leva um esporro \n\tna frente da turma toda e ele explica resmungando. Voce entende uma parte. \n\tainda restam duvidas mas voce decide nao incomodar mais" (ChangeAttr +1 0 0 +7),
            Action "Interrompe a explicacao, explica o problema que esta tendo \n\te solicita que o prof explique melhor como que essa coisa funciona" "Você faz o perfil de Aluno Easy" (ChangeAttr (-2) 0 0 4),
            Action "Voce acha que esse assunto nunca vai te fazer falta resolve\n\tse aconchegar melhor na cadeira e tirar uma soneca por que pqp,\n\taula de 8h? isso nao e coisa de gente" "voce dorme como um condenado e acorda no fim da aula as energias revigoradas" (ChangeAttr 2 0 7 (-3)
        ],

        Mission "Saindo da aula voce encontra com Maria Joaquina, sua tao amada namorada. \n\t ela te pergunta onde vao almocar" [
        	Action "Bora pro estaurante universitario, mesmo com aquela fila e nao sendo uma \n\t comida gourmet, eh de graca acima de tudo." "A maria Joaquina faz cara feia mas aceita ir para lá com Voce" (ChangeAttr (-3) 0 (-3) 0),
        	Action "Vamo comer aquele pastelao la de seu olavo." "A maria Joaquina reluta em aceitar ate pq isso nao e comida\n\t de almoco mas aquele pastel e muito bom" (ChangeAttr 3 (-3) 3 0),
        	Action "Acabei de ganhar minha mesada. Vamos comer aquele meio almoco top\n\t" "A Maria Joaquina aceita com um sorriso brilhante. Voce depois\n\t se da conta do rombo que fez na sua carteira e diz pra si proprio \n\tque vai ser mais responsavel com as financas" (ChangeAttr 3 (-4) 3 0)
        ],

        Mission "Voltando a sequencia de Estudo, você possui uma aula de LPT,\n\tno entando, possui uma prova que se aproxima na proxima semana.\n\tDesse modo, voce:" [
        	Action "Faltar essa aula, indo estudar na biblioteca para prova \n\t da semana que vem." "Voce encontrou mais dois amigos que fizeram o mesmo.\n\tPor sorte, o estudo foi positivo, mas os gastos em cafe e xerox foram rasoaveis." (ChangeAttr 3 (-4) (-3) 3),
        	Action "Enfrentar a aula, mesmo com sono e com assunto prova proxima semana." "A falta de descanso, e aumento de fome,\n\t resultou em uma aula nao tao produtiva, mas voce ganhou presenca." (ChangeAttr (-3) 0 0 1),
        	Action "Ir para aula, mas antes passarei na cantina\n\tpara revigorar os animos e assistir aula." "Apesar de nao estudar para prova da semana que vem\n\t foi possivel tirar proveito da aula." (ChangeAttr 2 (-3) 2 1)
		]
	]

	Day "Segundo dia de treinos - você acorda e vai para a UFCG submeter roteiros de estruturas de dados" [
		Mission "Hoje eh dia de colocar todo o aprendizado adquirido em aula em pratica. Desse modo: " [
			Action "Voce decide juntar-se a um grupo de amigos no qual\n\tsabe que sempre tem um pra ajudar" "Apesar de voce ter concluido parte do Roteiro,\n\tseus amigos puxaram otimas conversas. Termine em casa." (ChangeAttr 1 0 (-3) 1),
			Action "Voce decide ficar soh e programar feito louco para adiantar o maximo possivel." "Voce ate tentou se adiantar, mas dificuldades sempre surgem quando estamos so.\n\tApesar da frustacao, voce ja identificou possiveis erros e pode completar em casa." (ChangeAttr (-5) 0 (-4) 2),
			Action "Prefiro descansar, irei pegar minha presenca e concluo em casa." "Apesar de que voce tenha descansado, nao pode\n\treceber dicar de professores, monitor ou colegas. Boa sorte em casa." (ChangeAttr 1 0 2 (-3)
		],

		Mission "Chegando em casa, voce esta com fome, cansado e, ainda assim,\n\tdeve submeter o Roteiro." [
			Action "Melhor comer e descansar antes. Apos esse descanso, irei\n\tconcluir todo o Roteiro." "Voce se alimentou bem, mas exagerou sem querer no descanso.\n\tQuando acordou, ficou louco, mas conseguiu concluir." (ChangeAttr (-6) 0 (-2) 2),
			Action "Uma boa alimentacao basta, apos concluir o roteiro eu descanso." "Parabens, concluiu o Roteiro ate rapido.\n\tApesar disso, o cansaco foi grande e dormir sem responder ninguem foi consequencia." (ChangeAttr (-1) 0 (-4) 2)
			Action "Irei dormir agora, acordo de madrugada, me alimento e programo depois." "Foi duro acordar de madrugada, mas a estrategia rendeu.\n\tRoteiro concluido e energia bem gasta." (ChangeAttr 1 0 (-4) 1),
			Action "Irei dormir e comer, posso pegar o codigo com Flavio Quirino." "Parabens, Roteiro enviado, boa pontuacao.\n\tConciencia limpa, mas dignidade pro saco." (ChangeAttr (-1) 0 1 (-6)
		],

		Mission "Chegou a hora de fazer a prova de LEDA.\n\tVoce assistiu todas as aulas, mas nao se ve tao confiante, ainda mais com\n\ttoda essa apreensao da turma." [
			Action "Irei sentar ao lado do meu amigo, ele pode me dar ajuda.\n\t'Ola velho amigo!'" "Seu amigo ate tenta lhe ajudar de alguma forma, mas nao lhe passa cola para\n\tnao se prejudicar, uma pena, sua prova foi mediana." (ChangeAttr (-3) 0 (-2) (-3)),
			Action "Vou procurar nem pensar muito, tou conversando bobagens com quem espera comecar a prova tambem." "Deu sorte, conseguiu nos ultimos minutos, implementar o problema.\n\tApesar disso, o cansaco foi grande e energia foi pro saco." (ChangeAttr (-2) 0 (-4) 1),
			Action "Melhor eu dar uma revisada, tem mais duas pessoas aqui olhando anotacoes tambem." "A revisao nao ajudou muito, apesar disso, voce se dedicou e conseguiu alguns casos testes." (ChangeAttr (-1) 0 (-2) 1),
			Action "Nem pensei muito, debati rapido sobre provaveis questoes, e vamos pelo que sei." "Deu muita sorte, passou em todos os testes.\n\tO Design nao foi o melhor, mas deu para manter acima da media." (ChangeAttr 1 0 (-3) 1)
		]
	]