#define max_missions_in_day 5
#define max_actions_in_mission 5
#define max_days_in_phase 5
enum attr {sanity, money, energy, wisdom};

struct action {
// Array das mudanças que ocorrerão nos atributos do
// jogador caso ele faça essa ação
int changes[4];

// Texto que aparece nessa opção
char definition[255];

// Mensagem que vai aparecer depois dele escolher essa ação
char consequence[255];
};

struct mission {
    // Texto sobre a Missao
    char definition[255];
    int total = 0;
    int capacity;
    action actions[max_actions_in_mission];
};

struct day {
    // Titulo ao iniciar o dia
    char definition[255];

    int total = 0;
    int capacity;
    mission missions[max_missions_in_day];

    // Texto que aparece ao finalizar o dia
    char consequence[255];
};

struct phase {
    int total = 0;
    int capacity;
    day days[max_days_in_phase];
};
