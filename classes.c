enum attr {sanity, money, energy, wisdom};

struct action {
  // Texto que aparece nessa opção
  char defition[];

  // Array das mudanças que ocorrerão nos atributos do
  // jogador caso ele faça essa ação
  int changes[4];

  // 
  char defition[];
}

struct mission {
  // Texto sobre a Missao
  char defition[];

  int action_count;
  action *actions;
}

struct day {
  // Titulo ao iniciar o dia
  char defition[];

  int mission_count;
  mission *missions;

  // Texto que aparece ao finalizar o dia
  char defition[];
}

struct fase {
  int day_count;
  day *days;
}

void main() {

  /////////////////////////////////////////////////////////////////////

  //                        DIA 1                                    //

  /////////////////////////////////////////////////////////////////////

  day day1 = day();
  // Titulo: Semana Fera.

  mission mission1 = mission();
  // Definicao: Ao iniciar o Curso, todos tem que passar pelo processo
  //            de montagem de grade. Desse modo, decida quais cadeiras
  //            escolher.

  action action1 = action();
  // Acoes: a) FMCC1, P1, LP1, IC, LPT
  //        b) Vet, Direito, InfoSoc, Adm, LPT
  //        c) FMCC1, P1, LP1, IC, LPT, AA

  // Resultados: a) Aluno Padrao
  //             b) Aluno Easy
  //             c) Aluno Competitivo

  /////////////////////////////////////////////////////////////////////

  mission mission2 = mission();
  // Definicao: Ao iniciar o Curso, todos tem que passar pelo processo
  //            de montagem de grade. Desse modo, decida quais cadeiras
  //            escolher.

  action action2 = action();
  // Acoes: a) FMCC1, P1, LP1, IC, LPT
  //        b) Vet, Direito, InfoSoc, Adm, LPT
  //        c) FMCC1, P1, LP1, IC, LPT, AA

  // Resultados: a) Aluno Padrao
  //             b) Aluno Easy
  //             c) Aluno Competitivo

  /////////////////////////////////////////////////////////////////////

  mission mission3 = mission();
  // Definicao: Ao iniciar o Curso, todos tem que passar pelo processo
  //            de montagem de grade. Desse modo, decida quais cadeiras
  //            escolher.

  action action3 = action();
  // Acoes: a) FMCC1, P1, LP1, IC, LPT
  //        b) Vet, Direito, InfoSoc, Adm, LPT
  //        c) FMCC1, P1, LP1, IC, LPT, AA

  // Resultados: a) Aluno Padrao
  //             b) Aluno Easy
  //             c) Aluno Competitivo


  /////////////////////////////////////////////////////////////////////

  //                        DIA 2                                    //

  /////////////////////////////////////////////////////////////////////

  day day2 = day();
  // Titulo: Semana Fera.

  mission mission1 = mission();
  // Definicao: Ao iniciar o Curso, todos tem que passar pelo processo
  //            de montagem de grade. Desse modo, decida quais cadeiras
  //            escolher.

  action action1 = action();
  // Acoes: a) FMCC1, P1, LP1, IC, LPT
  //        b) Vet, Direito, InfoSoc, Adm, LPT
  //        c) FMCC1, P1, LP1, IC, LPT, AA

  // Resultados: a) Aluno Padrao
  //             b) Aluno Easy
  //             c) Aluno Competitivo

  /////////////////////////////////////////////////////////////////////

  mission mission2 = mission();
  // Definicao: Ao iniciar o Curso, todos tem que passar pelo processo
  //            de montagem de grade. Desse modo, decida quais cadeiras
  //            escolher.

  action action2 = action();
  // Acoes: a) FMCC1, P1, LP1, IC, LPT
  //        b) Vet, Direito, InfoSoc, Adm, LPT
  //        c) FMCC1, P1, LP1, IC, LPT, AA

  // Resultados: a) Aluno Padrao
  //             b) Aluno Easy
  //             c) Aluno Competitivo

  /////////////////////////////////////////////////////////////////////

  mission mission3 = mission();
  // Definicao: Ao iniciar o Curso, todos tem que passar pelo processo
  //            de montagem de grade. Desse modo, decida quais cadeiras
  //            escolher.

  action action3 = action();
  // Acoes: a) FMCC1, P1, LP1, IC, LPT
  //        b) Vet, Direito, InfoSoc, Adm, LPT
  //        c) FMCC1, P1, LP1, IC, LPT, AA

  // Resultados: a) Aluno Padrao
  //             b) Aluno Easy
  //             c) Aluno Competitivo

}