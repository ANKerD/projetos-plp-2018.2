#include <stdlib.h>
#include <stdio.h>
#include "classes.c"
#include "utils.c"
#include "phases/phase-marathon-girfriend.c"


// addPhaseToGameLoop

int main() {
	struct game *gm = createGame(5, 80, 80, 80, 80);
	addPhaseToGameLoop(gm, phase-marathon-girfriend);

	printf("Hello World\n");
	for(int i = 0; i < gm->capacity; i++){
		struct phase *ph = gm->phases[i];
		for(int j = 0; j < ph->capacity; j++){
			struct day *dy = ph->days[j];
			for(int k = 0; k < dy->capacity; k++){
				struct mission *msn = dy->missions[k];
				for(int l = 0; l < mission->capacity; l++){
					struct action *act = msn->actions[l];
					printf(" %s\n", act->definition);
					printf(" %s\n", act->consequence);
				}
				getchar();
			}
		}
	}
}
