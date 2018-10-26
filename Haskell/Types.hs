module Types where

data ChangeAttr = ChangeAttr {
    sanity :: Int,
    money :: Int,
    energy :: Int,
    wisdom :: Int
}

sumChanges :: ChangeAttr -> ChangeAttr -> ChangeAttr
sumChanges a b = ChangeAttr (sanity a + sanity b) (money a + money b) (energy a + energy b) (wisdom a + wisdom b)

data Action = Action {
    desciption :: String,
    consequence :: String,
    changes :: ChangeAttr
}

data Mission = Mission {
    missionDefinition :: String,
    options :: [Action]
}

data Day = Day {
    dayDefinition :: String,
    missions :: [Mission]
}

data Phase = Phase {
    days :: [Day]
}

data Game = Game {
    phases :: [Phase]
}

-- main :: IO ()
-- main = do
--     let ts = ChangeAttr 2 3 4 5
--     let st = ChangeAttr 2 3 4 5
--     print (energy (sumChanges ts st))