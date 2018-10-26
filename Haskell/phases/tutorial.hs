-- import "../types"

data ChangeAttr = ChangeAttr {
    sanity :: Int,
    money :: Int,
    energy :: Int,
    wisdom :: Int
}

sumChanges :: ChangeAttr -> ChangeAttr -> ChangeAttr
sumChanges a b = ChangeAttr (sanity a + sanity b) (money a + money b) (energy a + energy b) (wisdom a + wisdom b)

data Action = Action {
    description :: String,
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

ph = Phase [
    Day "Bem vindo a UFCG.\n Ao fim dessa etapa, começamos nossa jornada Universitaria." [
        Mission "Ao iniciar o Curso, todos tem que passar pelo\n\tprocesso de montagem de grade. Desse modo, decida\n\tquais cadeiras escolher." [
            Action "FMCC1, P1, LP1, IC, LPT" "Você faz o perfil de Aluno Padrao" (ChangeAttr (-5) 0 (5) (5)),
            Action "Vet, Direito, InfoSoc, Adm, LPT" "Você faz o perfil de Aluno Easy" (ChangeAttr 5 5 0 (-5)),
            Action "FMCC1, P1, LP1, IC, LPT, AA" "Voce faz o perfil de Aluno Competitivo" (ChangeAttr (-5) 0 0 10)
        ],

        Mission "Apos o cadastro das cadeiras, todos devem passar pela apresentacao\n\tem publico. Desse modo, decida como voce se apresentar." [
            Action "Ficarei timido, e citarei apenas meu nome." "Arrancou poucas risadas, mas tenho certeza que alguem notou voce ali." (ChangeAttr (-5) 0 0 0),
            Action "Improvisarei algo divertido, de acordo com o que falarem." "Parabens, uma mina ao fundo gritou por ti, e abriu muitas risadas." (ChangeAttr 5 0 0 0),
            Action "Inaugurarei a dancia que estive treinando esses dias." "Apesar de ter sido bem desajeitado(a), voce se saiu bem." (ChangeAttr 5 0 (-5) 0)
        ],

        Mission "Voce esta chegando ao fim da semana fera, e tudo que falta concluir\n\teh o ciclo de amizades inicial. Voce se identificou com 3 grupos iniciais,\n\tmas soh poderah escolher apenas um." [
            Action "Escolho esse grupo que cantou a abertura de DB GT." "Esse grupo eh fiel, seu poder de forca sera +8000." (ChangeAttr 5 0 0 0),
            Action "Escolho ficar com esses caras que vieram do IF." "Parabens! Esse grupo eh muito inteligente, tens muito suporte de agora em diante." (ChangeAttr 0 0 0 5),
            Action "Essa galera animada me animou junto, e tem uma crush no meio." "Opa, por sorte, eles ainda te bancaram o role dessa semana." (ChangeAttr 0 5 0 0)
        ]
    ],

    Day "Primeiro Fim de Semana Fera se aproxima.\nApesar desse fim de semana ter passado rapido, seus objetivos continuam." [
        Mission "Diversas propostas surgiram para esse fim de semana universitario." [
            Action "Gustavo chamou para tomar uma com a galera, voce decide ir." "Comecou bebendo pouco e acabou ficando ressacado no sabado,\n\tcom tempo de estudo livre apenas no domingo." (ChangeAttr 2 (-5) (-1) 1),
            Action "Anderson chamou para programar nas madrugas de sexta e sabado, voce decide aceitar." "Codaram muito bem, ate conseguiram descansar um pouco mais no domingo." (ChangeAttr 1 0 (-3) 4),
            Action "Voce decide ir para casa descansar, estudar e se der sorte, jogar CS." "Os estudos na sexta-feira foram por agua abaixo,\n\tno entando conseguiu recuperar, sozinho, os estudos e ainda jogou CS." (ChangeAttr (-1) 2 (-1) 2)
        ],
        
        Mission "Amanha e segunda, quais serao as prioridades dessa semana?" [
            Action "Focar nos estudos, irei expor com os colegar sobre meu resumo feito hoje." "Sua dedicacao atraiu um amigo de sala, e ainda\n\tresultou em um bom inicio de semana." (ChangeAttr 1 0 (-2) 2),
            Action "Juntar uma galera pra farrear depois da prova." "Por sorte, um desses amigos que se interessaram eh muito \n\tinteligente. E ele ja se dispos a lhe ajudar quanto a prova tambem." (ChangeAttr 1 (-1) (-1) 2),
            Action "Como a prova eh quarta, irei focar individualmente ate la." "Como o estudo foi sozinho, voce teve algumas duvidas\n\tconseguiu tirar algumas duvidas com os colegas antes da prova, mas nao foi o suficiente." (ChangeAttr (-1) 0 (-2) 1)
        ]
    ]
    ]

main = do
    -- putStrLn (dayDefinition (head (days ph)))
    putStrLn (dayDefinition (head (days ph)))
    -- print (energy (ChangeAttr 3 3 3 3))