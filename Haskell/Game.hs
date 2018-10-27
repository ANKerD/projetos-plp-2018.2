module Game(game) where
import Types
import PhaseTutorial(phaseTutorial)
import PhaseMarathonGirfriend(phaseMarathonGirfriend)
import PhaseFinals(phaseFinals)
import PhaseSemesterEnding(phaseSemesterEnding)

game = Game [phaseTutorial, phaseMarathonGirfriend]