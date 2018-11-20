
dynamic(wisdom/1).
dynamic(money/1).
dynamic(sanity/1).
dynamic(energy/1).

% Ler de forma 0-indexado.
lerNumero(X) :-
	read(Y),
	X is Y-1.

% Atributos do jogador.
wisdom(80).
money(80).
sanity(80).
energy(80).

% Atualiza os atributos no banco de dados...
updateAttr([Wis, Mon, San, En]) :- 
	wisdom(W), Ws is (Wis+W), asserta(wisdom(Ws)),
	wisdom(M), Ms is (M+Mon), asserta(wisdom(Ms)),
	wisdom(S), Sn is (San+S), asserta(wisdom(Sn)),
	wisdom(E), Eg is (En+E),  asserta(wisdom(Eg)).

prt(Des) :- write(Des), nl.

:- initialization(main).

showActions([], _).
showActions([acao(Txt,_,_)|T], Idx) :- 
	format("~d) ~w\n", [Idx, Txt]),
	Ids is (Idx+1), 
	showActions(T, Ids).

main :- 
	mission(Desc, Actions),
	prt(Desc),	
	showActions(Actions, 1),
	lerNumero(X),
	nth0(X, Actions, acao(_, Cons, Attr)),
	prt(Cons),
	updateAttr(Attr),
	halt.

mission(
	"Ao iniciar o Curso, todos tem que passar pelo\n\tprocesso de montagem de grade. Desse modo, decida\n\tquais cadeiras escolher.",
	[
		acao("FMCC1, P1, LP1, IC, LPT", "Você faz o perfil de Aluno Padrao", [-5, 0, +5, +5]),
		acao("Vet, Direito, InfoSoc, Adm, LPT", "Você faz o perfil de Aluno Easy", [+5, +5, 0, -5]),
		acao("FMCC1, P1, LP1, IC, LPT, AA", "Voce faz o perfil de Aluno Competitivo", [-5, 0, 0, +10])
	]
).