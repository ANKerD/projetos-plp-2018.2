#include <stdlib.h>
#include <stdio.h>
#include "classes.c"
#include "utils.c"
#include "phases/phase-marathon-girfriend.c"
#include "phases/phase-noob-week.c"
#define SANITY_DEATH 20
#define MONEY_DEATH -10
#define ENERGY_DEATH 15
#define WISDOM_DEATH 15

int readNumber(int bound){
	char c[255];
	scanf(" %s", c);
	while(c[0] < '1' || c[0] > bound+'0') {
		if(c[0] == 27 || c[0] == 24 || c[0] == 3 || c[0] == 4) exit(0);
		printf("Digite uma opcao valida\n");
		scanf(" %s", c);
	}
	return c[0]-1-'0';
}

int play() {
	int day_count = 1;
	// system ("/bin/stty raw");
	system("clear");
	struct game *gm = createGame(5, 80, 80, 80, 80);
	phase_noob_week(gm);
	phase_marathon_girfriend(gm);
	int win = 1;
	for(int i = 0; i < gm->total; i++){
		struct phase *ph = &gm->phases[i];
		for(int j = 0; j < ph->total; j++){
			struct day *dy = &ph->days[j];
			printf("Dia %d:\n", day_count++);
			for(int k = 0; k < dy->total; k++){
				struct mission *msn = &dy->missions[k];
				printf("-------------------------------------------------------\n");
				printf("%s", msn->definition);
				printf("\n-------------------------------------------------------\n");
				printf("Define o numero referente a sua decisao:\n\n");
				for(int l = 0; l < msn->total; l++){
					struct action *act = &msn->actions[l];
					printf("%d) %s\n", l+1, act->definition);
					// printf(" %s\n", act->consequence);
				}
				int option = readNumber(msn->total);
				// printf("\n\n-------------------------------\n\n");
				gm->attr[sanity] += msn->actions[option].changes[sanity];
				gm->attr[money] += msn->actions[option].changes[money];
				gm->attr[energy] += msn->actions[option].changes[energy];
				gm->attr[wisdom] += msn->actions[option].changes[wisdom];
				if(gm->attr[sanity] < SANITY_DEATH || gm->attr[money] < MONEY_DEATH || gm->attr[energy] < ENERGY_DEATH || gm->attr[wisdom] < WISDOM_DEATH){
					// break loops
					i = j = k = 1e9;
					win = 0;
					printf("-------------------------------------------------------\n");
					if(gm->attr[sanity] < SANITY_DEATH)
						printf("Seus pontos de sanidade atingiram um nível muito baixo. Você\n\t enlouqueceu e acabou pulando do terceiro andar do CAA\n");
					else if(gm->attr[money] < MONEY_DEATH)
						printf("Voce acabou fazendo dividas demais. seu dinheiro acaou e voce \n\t acabou precisando largar a faculdade para pagar as contas \n\t com o agiota antes que ele te mate.\n");
					else if(gm->attr[energy] < ENERGY_DEATH)
						printf("Voce esta sem energia. Muito fraco e debilitado, \n\t acabou no hospital para se recuperar e no fim das contas\n\t perdeu esse periodo completamente");
					else
						printf("Voce esta estudando de maneira errada ou nao estudando \n\tde qualquer forma. suas notas cairam ao ponto em que a coordenador \n\tachou sensato te remover fisicamente do curso para\n\t abrir vaga para alguem mais dedicado\n");
					printf("\n-------------------------------------------------------\n");
				} else {

					printf("\n\nA consequencia da sua decisao foi:\n\n");
					printf("%s\n\n\n", msn->actions[option].consequence);
					system("read -p \"pressione enter para continuar\" saindo");
					system("clear");
					printf("\n\n");
				}

			}
		}
	}
	if(win){
		printf("Parabens por ter chegado ate aqui. A vida de universitario\n\t mas voce conseguiu lidar com todos os desafios dessa vida\n\t de cao e ainda conseguiu tirar um tempinho pra dar uns rolet loko\n");
		// TODO: desenhar aquelas caras ascii fodonas
	}
}

int main(){
	printf("Seja bem vindo ao *Sobrevivendo a UFCG*\n");
	printf("Será que é capaz de sobre viver a vida normal de um estudante universitario?\n");
	int cont;
	do{
		play();
		printf("Deseja jogar novamente?\n");
		printf("1. Continuar\n");
		printf("2. Sair\n");
		cont = readNumber(2);
	} while(cont == 0);
}
