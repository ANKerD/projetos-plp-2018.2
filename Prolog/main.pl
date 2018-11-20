lerNumero(X) :-
	read_line_to_codes(user_input, Z),
	string_to_atom(Z, A),
	atom_number(A, X).

dynamic(wisdom/1).
dynamic(money/1).
dynamic(sanity/1).
dynamic(energy/1).

wisdom(80).
money(80).
sanity(80).
energy(80).

% :- wisdom(X), Y is 8+X, retract(wisdom(X)), asserta(wisdom(Y)).
% :- wisdom(X), write(X).

updateAttr([Wis, Mon, San, En]) :- 
	wisdom(W), Ws is (Wis+W), asserta(wisdom(Ws)),
	wisdom(M), Ms is (M+Mon), asserta(wisdom(Ms)),
	wisdom(S), Sn is (San+S), asserta(wisdom(Sn)),
	wisdom(E), Eg is (En+E),  asserta(wisdom(Eg)).

:- initialization(main).

main :- lerNumero(X), Y is X+1, write(Y), nl.	


mission(
	"Ao iniciar o Curso, todos tem que passar pelo\n\tprocesso de montagem de grade. Desse modo, decida\n\tquais cadeiras escolher.",
	[
		acao("FMCC1, P1, LP1, IC, LPT", "Você faz o perfil de Aluno Padrao", [-5, 0, +5, +5]),
		acao("Vet, Direito, InfoSoc, Adm, LPT", "Você faz o perfil de Aluno Easy", [+5, +5, 0, -5]),
		acao("FMCC1, P1, LP1, IC, LPT, AA", "Voce faz o perfil de Aluno Competitivo", [-5, 0, 0, +10])
	]
).