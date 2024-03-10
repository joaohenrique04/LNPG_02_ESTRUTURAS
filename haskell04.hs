import qualified Data.Map.Strict as Map
import Text.Printf

main :: IO ()
main = do
    putStrLn "Vamos calcular notas do vestibular!"
    putStrLn "Insira o gabarito da prova com 10 inteiros separados por espaço (1 a 5):"
    gabaritoStr <- words <$> getLine
    let gabarito = map read gabaritoStr :: [Int]
    participantes <- lerParticipantes Map.empty
    let notas = calcularNotas participantes gabarito
    putStrLn "a) Participantes e notas:"
    mapM_ (\(nome, nota) -> putStrLn $ nome ++ ": " ++ show nota) (Map.toList notas)
    let (melhores, piores) = encontrarMelhoresEPiores notas
    putStrLn $ "b) Maior pontuação: " ++ show (fst melhores) ++ ", Participantes: " ++ show (snd melhores)
    putStrLn $ "   Menor pontuação: " ++ show (fst piores) ++ ", Participantes: " ++ show (snd piores)
    let percentualMaisDaMetade = calcularPercentualMaisDaMetade notas
    putStrLn $ "c) Percentual de participantes com mais da metade das questões certas: " ++ printf "%.1f%%" percentualMaisDaMetade

lerParticipantes :: Map.Map String [Int] -> IO (Map.Map String [Int])
lerParticipantes participantes = do
    putStrLn "Insira o nome do participante seguido de suas respostas (10 inteiros separados por espaço), ou * para finalizar:"
    linha <- getLine
    if linha == "*"
        then return participantes
        else do
            let (nomeParticipante:respostasStr) = words linha
                respostas = map read respostasStr :: [Int]
                participantesAtualizados = Map.insert nomeParticipante respostas participantes
            lerParticipantes participantesAtualizados

calcularNotas :: Map.Map String [Int] -> [Int] -> Map.Map String Int
calcularNotas participantes gabarito = Map.map (\respostas -> calcularNota respostas gabarito) participantes

calcularNota :: [Int] -> [Int] -> Int
calcularNota respostas gabarito = length $ filter (\(r, g) -> r == g) (zip respostas gabarito)

encontrarMelhoresEPiores :: Map.Map String Int -> ((Int, [String]), (Int, [String]))
encontrarMelhoresEPiores notas =
    let maxNota = maximum (Map.elems notas)
        minNota = minimum (Map.elems notas)
        melhores = Map.keys $ Map.filter (== maxNota) notas
        piores = Map.keys $ Map.filter (== minNota) notas
    in ((maxNota, melhores), (minNota, piores))

calcularPercentualMaisDaMetade :: Map.Map String Int -> Double
calcularPercentualMaisDaMetade notas =
    let totalParticipantes = fromIntegral $ Map.size notas
        contagemMaisDaMetade = fromIntegral $ length $ filter (> 5) $ Map.elems notas
    in (contagemMaisDaMetade / totalParticipantes) * 100
