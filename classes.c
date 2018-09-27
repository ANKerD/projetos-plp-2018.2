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
  int action_count;
  action *actions;
}

struct day {
  int mission_count;
  mission *missions;
}
