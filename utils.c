// #include <stdlib.h>
// #include "classes.c"
/*
cria uma ação e define seus atributos,
deixando a alocação de memória transparente
*/
struct action* createAction(char definition[255], char consequence[255], int san, int mon, int enrgy, int wis){
    struct action *newAction = malloc(sizeof(struct action));

    newAction->definition = definition;
    newAction->consequence = consequence;
    newAction->changes[sanity] = san;
    newAction->changes[money] = mon;
    newAction->changes[energy] = enrgy;
    newAction->changes[wisdom] = wis;

    return newAction;
}

/*
Cria uma missão com opoes em branco
e capacidade de n ações;
*/
struct mission* createMission(char definition[255], int capacity){
    struct mission *newMission = malloc(sizeof(struct mission));

    newMission->definition = definition;
	newMission->total = 0;
    newMission->capacity = capacity;

    return newMission;
}

/*
Cria um dia com missões em branco
e capacidade de n missões;
*/
struct day* createDay(char definition[255], char consequence[255], int capacity){
    struct day *newDay = malloc(sizeof(struct day));

    newDay->definition = definition;
	newDay->total = 0;
    newDay->capacity = capacity;

    return newDay;
}

/*
Cria um dia com missões em branco
e capacidade de n missões;
*/
struct phase* createPhase(char definition[255], int capacity){
    struct phase *newPhase = malloc(sizeof(struct phase));

    newPhase->total = 0;
    newPhase->capacity = capacity;

    return newPhase;
}

struct game* createGame(int capacity, int san, int mon, int enrgy, int wis){
    struct game *newGame = malloc(sizeof(struct game));

	newGame->capacity = capacity;
	newGame->total = 0;

	newGame->attr[sanity] = san;
    newGame->attr[money] = mon;
    newGame->attr[energy] = enrgy;
    newGame->attr[wisdom] = wis;

    return newGame;
}

void addActionToMission(struct mission *msn, struct action *act){
	if(msn->total < msn->capacity){
		msn->actions[msn->total++] = *act;
	}
}

void addMissionToDay(struct day *dy, struct mission *msn){
	if(dy->total < dy->capacity){
		dy->missions[dy->total++] = *msn;
	}
}

void addDayToPhase(struct phase *ph, struct day *dy){
	if(ph->total < ph->capacity){
		ph->days[ph->total++] = *dy;
	}
}

void addPhaseToGameLoop(struct game *gm, struct phase *ph){
	if(gm->total < gm->capacity){
		gm->phases[gm->total++] = *ph;
	}
}
/*
// addActionTo
// Exemplo

cria as ações
action *a1 = createAction("Estudar 5 horas pa prova", "Voce está mais seguro ṕara fazer a prova", -1, 0, 0, +10);
action *a2 = createAction("Falar com a namorada", "seu relacionamento está mais sólido", 10, 0, 0, -2);
action *a3 = createAction("Jogar poker com os colegas", "Voce acabou de ganhar money derrotando os seus amigos", -2, 10, 0, -2);
action *a4 = createAction("Jogar poker com os colegas", "Voce acabou de perder seu inútil", -2, -5, 0, -2);

mission *m1 = createMission("inicio da noite, o que você vai fazer dela?", 3);

addActionToMission(m1, a1);
addActionToMission(m1, a2);
addActionToMission(m1, a3);

// TODO: addMissionToDay
// TODO: addDayToPhase
*/
