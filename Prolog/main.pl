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
	format("Missão ~d: ", [MsnCnt]),
	prt(Desc),	
	showActions(Actions, 1),
	lerNumero(X),
	nth0(X, Actions, acao(_, Cons, Attr)),
	prt(Cons),
	updateAttr(Attr, MsnCnt, Nms),
	% prt(Nms),
	playMissions(T, Nms).

missions(
[
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
	)	
]).