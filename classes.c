#define max_missions_in_day 5
#define max_actions_in_mission 5
#define max_days_in_phase 5
#define max_phase_in_game 10
enum attr {sanity, money, energy, wisdom};

struct action {
	// Array das mudanças que ocorrerão nos atributos do
	// jogador caso ele faça essa ação
	int changes[4];

	// Texto que aparece nessa opção
	char *definition;

	// Mensagem que vai aparecer depois dele escolher essa ação
	char *consequence;
};

struct mission {
    // Texto sobre a Missao
    char *definition;
    int total;
    int capacity;
    struct action actions[max_actions_in_mission];
};

struct day {
    // Titulo ao iniciar o dia
    char *definition;

    int total;
    int capacity;
    struct mission missions[max_missions_in_day];

    // Texto que aparece ao finalizar o dia
    char *consequence;
};

struct phase {
    int total;
    int capacity;
    struct day days[max_days_in_phase];
};

struct game {
    int total;
    int capacity;
    struct phase phases[max_phase_in_game];
	int attr[4];
};
