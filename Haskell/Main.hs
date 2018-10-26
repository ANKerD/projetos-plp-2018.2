module Main where

import Types
import Game

import Data.Char

getInt :: IO Int          
getInt = do  
    s <- getLine
    return (read s)

promptInt x = do
    putStr "Digite um numero entre 1 e " 
    print x
    n <- getInt
    return n

endGame :: ChangeAttr -> (Bool, String)
endGame attr
    | sanity attr < 20 = (True, "Seus pontos de sanidade atingiram um nível muito baixo. Você\n\t enlouqueceu e acabou pulando do terceiro andar do CAA")
    | money attr < -10 = (True, "Voce acabou fazendo dividas demais. seu dinheiro acaou e voce \n\t acabou precisando largar a faculdade para pagar as contas \n\t com o agiota antes que ele te mate.")
    | energy attr < 15 = (True, "Voce esta sem energia. Muito fraco e debilitado, \n\t acabou no hospital para se recuperar e no fim das contas\n\t perdeu esse periodo completamente")
    | wisdom attr < 15 = (True, "Voce esta estudando de maneira errada ou nao estudando \n\tde qualquer forma. suas notas cairam ao ponto em que a coordenador \n\tachou sensato te remover fisicamente do curso para\n\t abrir vaga para alguem mais dedicado")
    | otherwise = (False, "Lambda")

missionAction [] count = putStrLn ""
missionAction (opts:other) count = do
    print count
    putStr ". " ++ (msn)
    missionAction other (succ count)

-- printMissionActionsStatements (ac:other) = do
--     putStrLn 

invokeMsn msn = do
    printMissionActionsStatements (options msn)
    choose <- promptInt (length msn)
    putStrLn (consequence ((options msn)!!(choose-1)))
    changes ((options msn)!!(choose-1))

invokeMissions [] = ChangeAttr 0 0 0 0
invokeMissions (msn:morework) = sumChanges (invokeMsn msn) invokeMissions(morework)

invokeDays [] attr = ChangeAttr 0 0 0 0
invokeDays (day:left) attr = do
    putStrLn (dayDefinition day)
    sumChanges (invokeMissions (missions day)) (invokeDays left)

invokePhase :: Phase -> ChangeAttr -> ChangeAttr
invokePhase ph attr = sumChanges attr (invokeDays (days ph))

-- Mensagem de vitoria
invokeGame [] attr = putStrLn "Parabens por ter chegado ate aqui. A vida de universitario\n\t mas voce conseguiu lidar com todos os desafios dessa vida\n\t de cao e ainda conseguiu tirar um tempinho pra dar uns rolet loko"
invokeGame phs attr = do
    putStrLn "9"
    let newAttr = invokePhase (head phs) attr
    let res = endGame newAttr
    if (fst res) then putStrLn (snd res)
    else invokeGame (tail phs) newAttr


play = do 
    putStrLn "Seja bem vindo ao *Sobrevivendo a UFCG*"
    putStrLn "Será que é capaz de sobre viver a vida normal de um estudante universitario?"
    invokeGame (phases game) (ChangeAttr 80 80 80 80)
    
    
main = do
    x <- promptInt 5
    print (x+9)
    play    
