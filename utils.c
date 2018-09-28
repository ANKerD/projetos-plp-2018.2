/*
cria uma ação e define seus atributos,
deixando a alocação de memória transparente
*/
action* createAction(char[] definition, char[] consequence, int san, int mon, int enrgy, wis){
    action *newAction = malloc(sizeof(action));

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
mission* createMission(char[] definition, int capacity){
    mission *newMission = malloc(sizeof(mission));

    newMission->definition = definition;
    newMission->capacity = capacity;

    return newMission;
}

/*
Cria um dia com missões em branco
e capacidade de n missões;
*/
day* createDay(char[] definition, char[] consequence, int capacity){
    day *newDay = malloc(sizeof(day));

    newPhase->definition = definition;
    newPhase->capacity = capacity;

    return newPhase;
}

/*
Cria um dia com missões em branco
e capacidade de n missões;
*/
phase* createPhase(char[] definition, int capacity){
    phase *newPhase = malloc(sizeof(phase));

    newPhase->definition = definition;
    newPhase->capacity = capacity;

    return newPhase;
}

void addActionToMission(mission *msn, action *act){
	if(msn->total < ms->capacity){
		msn->actions[msn->total++] = *act;
	}
}

void addMissionToDay(day *dy, mission *msn){
	if(dy->total < dy->capacity){
		dy->actions[dy->total++] = *msn;
	}
}

void addDayToPhase(phase *ph,day *dy){
	if(ph->total < ph->capacity){
		ph->actions[ph->total++] = *dy;
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
