module Main where

import Types
import Game

import Data.Char

inInterval :: Char -> Int -> Bool
inInterval hd x = ord hd > 0 && ord hd <= x

readIntValidInt :: Int -> Int
readIntValidInt x = do
    putStr "Digite um numero entre 1 e " 
    putStrLn (show x)
    inp <- getLine
    let hd = head inp
    if isDigit hd && inInterval hd x then do
        putStrLn "Voce digitou uma entrada inválida. Corrija o erro" 
        return ord hd - ord '0'
    else readIntValidInt x

play :: IO()
play = do 
    putStrLn "Seja bem vindo ao *Sobrevivendo a UFCG*"
    putStrLn "Será que é capaz de sobre viver a vida normal de um estudante universitario?"
    -- invokePhase 
    
main :: IO()
main = do
    play 
    readIntValidInt 5
    -- putStrLn (dayDefinition (head (days (head (phases game)))))