#include <stdlib.h>
#include <stdio.h>
#include "classes.c"
#include "utils.c"
#include "phases/phase-marathon-girfriend.c"


// addPhaseToGameLoop

int main() {
	struct game *gm = createGame(5, 80, 80, 80, 80);
	phase_marathon_girfriend(gm);

	for(int i = 0; i < gm->total; i++){
		struct phase *ph = &gm->phases[i];
		for(int j = 0; j < ph->total; j++){
			struct day *dy = &ph->days[j];
			for(int k = 0; k < dy->total; k++){
				struct mission *msn = &dy->missions[k];
				for(int l = 0; l < msn->total; l++){
					struct action *act = &msn->actions[l];
					printf("%d) %s\n", l+1, act->definition);
					// printf(" %s\n", act->consequence);
				}
				// getchar();
			}
		}
	}
}
