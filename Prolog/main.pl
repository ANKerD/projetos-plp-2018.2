dynamic(wisdom/2).
dynamic(money/2).
dynamic(sanity/2).
dynamic(energy/2).

% Ler de forma 0-indexado.
lerNumero(X) :-
	read(Y),
	X is Y-1.

% Atributos do jogador.
wisdom(1, 80).
money( 1, 80).
sanity(1, 80).
energy(1, 80).

% Atualiza os atributos no banco de dados...
updateAttr([Wis, Mon, San, En], Cnt, Nms) :- 
	Nms is (Cnt+1),
	wisdom(Cnt, W), Ws is (Wis+W), asserta(wisdom(Nms, Ws)),
	money(Cnt, M),  Ms is (M+Mon), asserta(money( Nms, Ms)),
	sanity(Cnt, S), Sn is (San+S), asserta(sanity(Nms, Sn)),
	energy(Cnt, E), Eg is (En+E) , asserta(energy(Nms, Eg)).

lost(Cnt) :-
	wisdom(Cnt, W), W < 15;
	money(Cnt, M), M < -10;
	sanity(Cnt, S), S < 20;
	energy(Cnt, E), E < 15.

prt(Des) :- write(Des), nl.

main :- missions(Msn), playMissions(Msn, 1).

:- initialization(main).


showActions([], _).
showActions([acao(Txt,_,_)|T], Idx) :- 
	format("~d) ~w\n", [Idx, Txt]),
	Ids is (Idx+1), 
	showActions(T, Ids).


playMissions([], Cnt) :- lost(Cnt) -> prt("Voce perdeu...") ; prt("Vencedor, parabéns").
playMissions([mission(Desc, Actions)|T], MsnCnt) :- 
	(lost(MsnCnt) -> (prt("Voce perdeu..."),halt); true), %TODO morte por cada tipo de attributo)
	clearChat(),
	format("Missão ~d: ", [MsnCnt]),
	prt(Desc),	
	showActions(Actions, 1),
	lerNumero(X),
	nth0(X, Actions, acao(_, Cons, Attr)),
	prt(Cons),
	updateAttr(Attr, MsnCnt, Nms),
	% prt(Nms),
	playMissions(T, Nms).

clearChat() :-
	shell("clear"),
	true.

missions(
[
	% Noob Week Phase
	mission(
		"Ao iniciar o Curso, todos tem que passar pelo\n\tprocesso de montagem de grade. Desse modo, decida\n\tquais cadeiras escolher.",
		[
			acao("FMCC1, P1, LP1, IC, LPT", "Você faz o perfil de Aluno Padrao", [-5, 0, +5, +5]),
			acao("Vet, Direito, InfoSoc, Adm, LPT", "Você faz o perfil de Aluno Easy", [+5, +5, 0, -5]),
			acao("FMCC1, P1, LP1, IC, LPT, AA", "Voce faz o perfil de Aluno Competitivo", [-5, 0, 0, +10])
		]
	),
	mission(
		"Apos o cadastro das cadeiras, todos devem passar pela apresentacao\n\tem publico. Desse modo, decida como voce se apresentar.",
		[
			acao("Ficarei timido, e citarei apenas meu nome.", "Arrancou poucas risadas, mas tenho certeza que alguem notou voce ali.", [-5, 0, 0, 0]),
			acao("Improvisarei algo divertido, de acordo com o que falarem.", "Parabens, uma mina ao fundo gritou por ti, e abriu muitas risadas.", [+5, 0, 0, 0]),
			acao("Inaugurarei a dancia que estive treinando esses dias.", "Apesar de ter sido bem desajeitado(a), voce se saiu bem.", [+5, 0, -5, 0])
		]
	),
	mission(
		"Voce esta chegando ao fim da semana fera, e tudo que falta concluir\n\teh o ciclo de amizades inicial. Voce se identificou com 3 grupos iniciais,\n\tmas soh poderah escolher apenas um.",
		[
			acao("Escolho esse grupo que cantou a abertura de DB GT.", "Esse grupo eh fiel, seu poder de forca sera +8000.", [+5, 0, 0, 0]),
			acao("Escolho ficar com esses caras que vieram do IF.", "Parabens! Esse grupo eh muito inteligente, tens muito suporte de agora em diante.", [0, 0, 0, +5]),
			acao("Essa galera animada me animou junto, e tem uma crush no meio.", "Opa, por sorte, eles ainda te bancaram o role dessa semana.", [0, +5, 0, 0])
		]
	),
	mission(
		"Diversas propostas surgiram para esse fim de semana universitario.",
		[
			acao("Gustavo chamou para tomar uma com a galera, voce decide ir.", "Comecou bebendo pouco e acabou ficando ressacado no sabado,\n\tcom tempo de estudo livre apenas no domingo.", [+2, -5, -1, +1]),
			acao("Anderson chamou para programar nas madrugas de sexta e sabado, voce decide aceitar.", "Codaram muito bem, ate conseguiram descansar um pouco mais no domingo.", [+1, 0, -3, +4]),
			acao("Voce decide ir para casa descansar, estudar e se der sorte, jogar CS.", "Os estudos na sexta-feira foram por agua abaixo,\n\tno entando conseguiu recuperar, sozinho, os estudos e ainda jogou CS.", [-1, +2, -1, +2])
		]
	),
	mission(
		"Amanha e segunda, quais serao as prioridades dessa semana?",
		[
			acao("Focar nos estudos, irei expor com os colegar sobre meu resumo feito hoje.", "Sua dedicacao atraiu um amigo de sala, e ainda\n\tresultou em um bom inicio de semana.", [+1, 0, -2, +2]),
			acao("Juntar uma galera pra farrear depois da prova.", "Por sorte, um desses amigos que se interessaram eh muito \n\tinteligente. E ele ja se dispos a lhe ajudar quanto a prova tambem.", [+1, -1, -1, +2]),
			acao("Como a prova eh quarta, irei focar individualmente ate la.", "Como o estudo foi sozinho, voce teve algumas duvidas\n\tconseguiu tirar algumas duvidas com os colegas antes da prova, mas nao foi o suficiente.", [-1, 0, -2, +1])
		]
	),
	
	% Semester Ending Phase
	mission(
		"O dia começou (8h)\nPrimeira prova às 8h (reposição de Calculo II)\n\t Devo me concentrar na prova, pois ela influenciará na sua nota\n\tIsto é, se sair bem ajudará na prova final",
		[
			acao("Quero primeiro tomar café e tomar um banho, assim fico novo em folha para enfrentar o dia", "Perderei tempo preparando meu café, ainda tenho que pegar o busão", [2, 0, 3, 0]),
			acao("Vou tomar um banho rápido e comprar um café no Amarelinho", "Perderei mais dinheiro, mas assim não perco tanto tempo", [-2, -3, 1, 0]),
			acao("Não vou tomar banho nem tomar café", "Economizo dinheiro e tempo, mas assim não despertarei meu corpo o suficiente", [-4, 0, -3, -1])
		]
	),
	mission(
		"10h - Próxima prova às 14h (reposição de EDA). Preciso me se sentir melhor para a prova",
		[
			acao("Volto pra casa, tomo banho e descanso/reviso o assunto", "Perderei tempo e dinheiro (ainda terei que voltar para facul), mas me sentirei melhor para o resto do dia", [3, -4, 1, -2]),
			acao("Vou almoçar lá em humanas e depois tirar um cochilo na quadra", "Perderei tempo e dineiro, mas me sentirei melhor", [1, -3, 1, -1]),
			acao("Vou comprar mais café, almoçar e revisar um assunto que não lembro tão bem", "Aproveitarei meu tempo, mas perderei dinheiro e sanidade", [-3, -3, 0, 1])
		]
	),
	mission(
		"8h - Próxima prova às 10h (final de Calculo II). Preciso me se sentir melhor para a prova",
		[
			acao("Durante o café decido mandar uma mensagem pro contatinho da facul: 'Almoçar juntos?' e vou pra facul", "Ansiedade aumenta, ela visualizou e não respondeu", [-2, 1, 3, 0]),
			acao("Decido tomar café na facul, no caminho encontro amigos e começo a discutir sobre a prova final", "Aumento meu conhecimento, mas perco dinheiro e energia ", [0, -3, -2, 1]),
			acao("Faço um café e levo pra facul, apresso o passo para chegar logo na sala e revisar algo antes da prova", "Ganho pouco conecimento, economizo tempo e dineiro, mas perco energia e sanidade", [-3, 0, -3, 2])
		]
	),
	mission(
		"10h - Próxima prova às 14h (final de EDA). Preciso me se sentir melhor para a prova",
		[
			acao("Só faço comer e revisar o dia todo", "Ganho conhecimento, mas perco muita sanidade e energia", [-4, -1, -3, 5]),
			acao("Durante o café converso com um amigo por telefone sobre a prova de hoje", "Ansiedade aumenta, mas economizo tempo e dinheiro, além de ganhar um pouco de conhecimento por ter tirado uma dúvida com meu colega de sala", [-4, -1, 3, 1]),
			acao("Decido tomar café na facul, fico na biblioteca dando o gás para a última prova do semestre", "Aumento meu conhecimento, mas perco sanidade, dinheiro e energia ", [-2, -3, -3, 5]),
			acao("Fico em casa e descanso um pouco mais, assisto um desenho e ligo pro meu contatinho", "Ganho um pouco de sanidade e energia, economizo tempo e dinheiro, mas perco muito conhecimento", [2, -1, 3, -5])
		]
	),

	% Marathon GirlFriend Phase
	mission(
		"A aula comecou - prof. Dalbas explica a árove vermelho e preta, voce fica na duvida sobre a parte das insercoes",
		[
			acao("Levanta a mão, espera ele te notar e pergunta sobre\n\tessas regras malucas que esses russos inventaram", "Ele te nota, responde calmamente e voce entende perfeitamente", [+1, 0, 0, +7]),
			acao("Interrompe a explicacao, explica o problema que esta tendo \n\te solicita que o prof explique melhor como que essa coisa funciona", "Dalbas não gostou de ser interrompido. Voce leva um esporro \n\tna frente da turma toda e ele explica resmungando. Voce entende uma parte. \n\tainda restam duvidas mas voce decide nao incomodar mais", [-2, 0, 0, +4]),
			acao("Voce acha que esse assunto nunca vai te fazer falta resolve\n\tse aconchegar melhor na cadeira e tirar uma soneca por que pqp,\n\taula de 8h? isso nao e coisa de gente", "voce dorme como um condenado e acorda no fim da aula as energias revigoradas", [+2, 0, +7, -3])
		]
	),
	mission(
		"Saindo da aula voce encontra com Maria Joaquina, sua tao amada namorada. \n\t ela te pergunta onde vao almocar",
		[
			acao("Bora pro estaurante universitario, mesmo com aquela fila e nao sendo uma \n\t comida gourmet, eh de graca acima de tudo.", "A maria Joaquina faz cara feia mas aceita ir para lá com Voce", [-3, 0, -3, 0]),
			acao("Vamo comer aquele pastelao la de seu olavo.", "A maria Joaquina reluta em aceitar ate pq isso nao e comida\n\t de almoco mas aquele pastel e muito bom", [3, -2, +3, 0]),
			acao("Acabei de ganhar minha mesada. Vamos comer aquele meio almoco top\n\t", "A Maria Joaquina aceita com um sorriso brilhante. Voce depois\n\t se da conta do rombo que fez na sua carteira e diz pra si proprio \n\tque vai ser mais responsavel com as financas", [3, -4, +3, 0])
		]
	),
	mission(
		"Voltando a sequencia de Estudo, você possui uma aula de LPT,\n\tno entando, possui uma prova que se aproxima na proxima semana.\n\tDesse modo, voce:",
		[
			acao("Faltar essa aula, indo estudar na biblioteca para prova \n\t da semana que vem.", "Voce encontrou mais dois amigos que fizeram o mesmo.\n\tPor sorte, o estudo foi positivo, mas os gastos em cafe e xerox foram rasoaveis.", [+3, -4, -3, +3]),
			acao("Enfrentar a aula, mesmo com sono e com assunto prova proxima semana.", "A falta de descanso, e aumento de fome,\n\t resultou em uma aula nao tao produtiva, mas voce ganhou presenca.", [-3, 0, 0, +1]),
			acao("Ir para aula, mas antes passarei na cantina\n\tpara revigorar os animos e assistir aula.", "Apesar de nao estudar para prova da semana que vem\n\t foi possivel tirar proveito da aula.", [+2, -2, +2,+1])
		]
	),
	mission(
		"Hoje eh dia de colocar todo o aprendizado adquirido em aula em pratica. Desse modo: ",
		[
			acao("Voce decide juntar-se a um grupo de amigos no qual\n\tsabe que sempre tem um pra ajudar", "Apesar de voce ter concluido parte do Roteiro,\n\tseus amigos puxaram otimas conversas. Termine em casa.", [+1, 0, -3, +1]),
			acao("Voce decide ficar soh e programar feito louco para adiantar o maximo possivel.", "Voce ate tentou se adiantar, mas dificuldades sempre surgem quando estamos so.\n\tApesar da frustacao, voce ja identificou possiveis erros e pode completar em casa.", [-5, 0, -4, +2]),
			acao("Prefiro descansar, irei pegar minha presenca e concluo em casa.", "Apesar de que voce tenha descansado, nao pode\n\treceber dicar de professores, monitor ou colegas. Boa sorte em casa.", [+1, 0, +2, -2])
		]
	),
	mission(
		"Chegando em casa, voce esta com fome, cansado e, ainda assim,\n\tdeve submeter o Roteiro.",
		[
			acao("Melhor comer e descansar antes. Apos esse descanso, irei\n\tconcluir todo o Roteiro.", "Voce se alimentou bem, mas exagerou sem querer no descanso.\n\tQuando acordou, ficou louco, mas conseguiu concluir.", [-6, 0, -2, +2]),
			acao("Uma boa alimentacao basta, apos concluir o roteiro eu descanso.", "Parabens, concluiu o Roteiro ate rapido.\n\tApesar disso, o cansaco foi grande e dormir sem responder ninguem foi consequencia.", [-1, 0, -4, +2]),
			acao("Irei dormir agora, acordo de madrugada, me alimento e programo depois.", "Foi duro acordar de madrugada, mas a estrategia rendeu.\n\tRoteiro concluido e energia bem gasta.", [+1, 0, -4, +1]),
			acao("Irei dormir e comer, posso pegar o codigo com Flavio Quirino.", "Parabens, Roteiro enviado, boa pontuacao.\n\tConciencia limpa, mas dignidade pro saco.", [-1, 0, +1, -6])
		]
	),
	mission(
		"Chegou a hora de fazer a prova de LEDA.\n\tVoce assistiu todas as aulas, mas nao se ve tao confiante, ainda mais com\n\ttoda essa apreensao da turma.",
		[
			acao("Irei sentar ao lado do meu amigo, ele pode me dar ajuda.\n\t'Ola velho amigo!'", "Seu amigo ate tenta lhe ajudar de alguma forma, mas nao lhe passa cola para\n\tnao se prejudicar, uma pena, sua prova foi mediana.", [-3, 0, -2, -3]),
			acao("Vou procurar nem pensar muito, tou conversando bobagens com quem espera comecar a prova tambem.", "Deu sorte, conseguiu nos ultimos minutos, implementar o problema.\n\tApesar disso, o cansaco foi grande e energia foi pro saco.", [-2, 0, -4, +1]),
			acao("Melhor eu dar uma revisada, tem mais duas pessoas aqui olhando anotacoes tambem.", "A revisao nao ajudou muito, apesar disso, voce se dedicou e conseguiu alguns casos testes.", [-1, 0, -2, +1]),
			acao("Nem pensei muito, debati rapido sobre provaveis questoes, e vamos pelo que sei.", "Deu muita sorte, passou em todos os testes.\n\tO Design nao foi o melhor, mas deu para manter acima da media.", [+1, 0, -3, +1])
		]
	),

	% Finals Phase
	mission(
		"Você tem uma prova do terceiro estágio de lp2, porém seu desempenho esse periodo não foi tão bom\n\t e você também tem algumas finais semana que vem. Decida o que você fará!",
		[
			acao("Irei fazer essa prova de qualquer modo pois devo priorizar minhas finais", "Você não foi tão bem na prova já que não estava preparado, mas certamente irá melhor nas finais!", [0 , 0, -5, 0]),
			acao("Deixarei para repor farei semana que vem junto com as finais", "Você deixa pra repor e deixa os problemas para o seu eu do futuro!", [+5, 0, +5, -5]),
			acao("Vou pedir conselhos pra uma amiga que estou conhecendo melhor", "A amiga em questão, diz que é melhor fazer a prova e\n\t te ajuda a se preparar com algumas dicas encima da hora!", [-5, 0, -5, +5])
		]
	),
	mission(
		"Você lembra que o final de semana está chegando e você está andando lado a lado com sua colega, você se recorda\n\t o quanto ela já te ajudou em provas passadas e como você viu ela pela primeira vez na semana do fera.\n\t O que você deseja fazer?",
		[
			acao("Chamarei ela para uma festa esse final de semana, para que possa conhece-la melhor!", "Ela recusa na hora, -quem pensaria em festa num momento desses!! não imaginava isso de você!-", [-5, 0, 0, 0]),
			acao("Acho que agora não é a hora de tentar nada, temos finais semana que vem!", "Você não fala nada e vai embora, porém fica com palavras presas na garganta, isso não faz bem pra saúde!", [-5, 0, 0, +5]),
			acao("Vou chama-la para estudar comigo, quem sabe isso nos aproxima mais!", "Ela recusa pois já marcou de estudar com algumas amigas, mas fica feliz com o seu convite!", [+5, 0, 0, 0])
		]
	),
	mission(
		"Já é noite e você está no seu quarto, a fome bate na sua porta e você decide:",
		[
			acao("Estou cansado porem farei comida, já que assim posso economizar mais!", "Você faz a comida, porém depois de cheio soma-se o cansaço e você pega no sono!", [0, +5, -5, 0]),
			acao("De modo algum eu vou fazer comida uma hora dessas, vou é pedir no ifood isso sim!", "A comida chega depois de um tempo, estava deliciosa, só doeu um pouco na carteira!!", [0, -10, 0, +5]),
			acao("Comer? comer não dá xp, eu vou estudar que vai ter aquele aulão agora!!", "Você não come de imediato mas vai ao aulão e recupera o conteúdo atrasado!", [-5, 0, -10, +10])
		]
	),
	mission(
		"Hoje você tem um dia de folga, só tem provas amanhã! o que você fará?",
		[
			acao("Vou chamar minha amiga de sempre pra estudar, hoje vai dar certo!", "Vocês estudam juntos e com isso vão bem nas provas!\n porém você está chateado por não aproveitar seu dia melhor!", [+2, 0, -10, +5]),
			acao("AAAh finalmente um dia sem provas, vou dormir e jogar CS isso sim!", "Você se diverte bastante porém não estuda nada! e ainda perde o sono jogando! vai se dar mal hein...", [+5, 0, -5, -5]),
			acao("Acho que vou sair com a galera, comemorar os resultados até agora!", "Você sai com o pessoal e se diverte bastante, porem gasta muito e não estuda nada!", [+10, -10, -5, -5])
		]
	),
	mission(
		"Você está fazendo a última prova final, porém está empacado em uma questão e agora?",
		[
			acao("Vou tentar fazer de qualquer jeito e correr o risco de reprovar! pelo menos serei honesto!", "Você acaba desenvolvendo mais da questão do que esperava, talvez o professor reconheça seu esforço!", [-5, 0, -5, +5]),
			acao(Tento olhar a resposta no celular já que deixei os slides preparados por precaução...", "O Professor passa por você enquanto você olha o celular\n\t, ele aparenta ter percebido porém você esconde\n\t o celular rápido e se safa dessa vez.", [-5, 0, 0, 0]),
			acao("Tento ver a resposta por cima do ombro de alguém do lado...", "Sua amiga de sempre estava atrás de você e percebe sua agonia\n\t, ela te passa um papel com as respostas e o professor nem desconfia\n\tdeu sorte!", [-1, 0, -2, +1])
		]
	),
	mission(
		"Você sai da prova e quando estava indo embora lembra de algo que queria fazer, o que era mesmo?",
		[
			acao("Vou esperar minha amiga sair da prova, hoje eu vou me declarar pra ela!", "Vocês saem e e vão andando embora, no caminho\n\tvocê a diz como se sente e ela... corresponde!\n\t Você agora está namorando com Maria Joaquina!", [6, 0, -5, 0]),
			acao("Acho melhor ir embora, realmente preciso descansar!.", "No caminho saindo da faculdade, ela te alcança e te diz algo inesperado...\n\temocionado você corresponde seus sentimentos. \n\tVocê agora está namorando Maria Joaquina!", [6, 0, -5, 0]),
			acao("Vou espera-la, pelo menos para agradecer por ter me dado a resposta!!", "Você agradece pela resposta e pergunta porquê ela sempre lhe ajuda\n\t, a resposta não podia te deixar mais feliz, ela gosta de você\n\t você não perde tempo e também se declara.\n\tVocê agora está namorando Maria Joaquina!", [6, 0, -5, 0])
		]
	),

	% Last Of Course Phase
	mission(
		"O dia começou (8h)\nPrimeira prova às 8h (reposição de Calculo II)\n\t Devo me concentrar na prova, pois ela influenciará na sua nota\n\tIsto é, se sair bem ajudará na prova final",
		[
			acao("Quero primeiro tomar café e tomar um banho, assim fico novo em folha para enfrentar o dia", "Perderei tempo preparando meu café, ainda tenho que pegar o busão", [2, 0, 2, 0]),
			acao("Vou tomar um banho rápido e comprar um café no Amarelinho", "Perderei mais dinheiro, mas assim não perco tanto tempo", [-2, -3, 1, 0]),
			acao("Não vou tomar banho nem tomar café", "Economizo dinheiro e tempo, mas assim não despertarei meu corpo o suficiente", [-5, 0, -3, -1])
		]
	),
	mission(
		"Dia 1: Reposição 2\n\tVocê está cansado e começa a ter um ínicio de crise de ansiedade\n\tporque não achou que foi bem na prova anterior",
		[
			acao("Volto pra casa, tomo banho e descanso/reviso o assunto", "Perderei tempo e dinheiro (ainda terei que voltar para facul), mas me sentirei melhor para o resto do dia", [2, -4, 1, -3]),
			acao("Vou almoçar lá em humanas e depois tirar um cochilo na quadra", "Perderei tempo e dineiro, mas me sentirei melhor", [1, -3, 1, -3]),
			acao("Vou comprar mais café, almoçar e revisar um assunto que não lembro tão bem", "Aproveitarei meu tempo, mas perderei dinheiro e sanidade", [-6, -6, 0, 1])
		]
	),
	mission(
		"8h - Próxima prova às 10h (final de Calculo II). Preciso me se sentir melhor para a prova",
		[
			acao("Durante o café decido mandar uma mensagem pro contatinho da facul: 'Almoçar juntos?' e vou pra facul", "Ansiedade aumenta, ela visualizou e não respondeu", [-4, 1, 2, 0]),
			acao("Decido tomar café na facul, no caminho encontro amigos e começo a discutir sobre a prova final", "Aumento meu conhecimento, mas perco dinheiro e energia ", [0, -5, -3, 1]),
			acao("Faço um café e levo pra facul, apresso o passo para chegar logo na sala e revisar algo antes da prova", "Ganho pouco conecimento, economizo tempo e dineiro, mas perco energia e sanidade", [-5, 0, -5, 2])
		]
	),
	mission(
		"10h - Próxima prova às 14h (final de EDA). Preciso me se sentir melhor para a prova",
		[
			acao("Só faço comer e revisar o dia todo", "Ganho conhecimento, mas perco muita sanidade e energia", [-4, -1, -4, 5]),
			acao("Durante o café converso com um amigo por telefone sobre a prova de hoje", "Ansiedade aumenta, mas economizo tempo e dinheiro, além de ganhar um pouco de conhecimento por ter tirado uma dúvida com meu colega de sala", [-4, -1, 2, 1]),
			acao("Decido tomar café na facul, fico na biblioteca dando o gás para a última prova do semestre", "Aumento meu conhecimento, mas perco sanidade, dinheiro e energia ", [-4, -5, -4, 3]),
			acao("Fico em casa e descanso um pouco mais, assisto um desenho e ligo pro meu contatinho", "Ganho um pouco de sanidade e energia, economizo tempo e dinheiro, mas perco muito conhecimento", [1, -3, 2, -6])
		]
	)

]).