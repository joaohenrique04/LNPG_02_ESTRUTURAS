main :: IO ()
main = do
    putStrLn "Olá Catarina, vamos fazer sua prestação de contas."
    putStrLn "Quantos jogos foram vendidos este mês? "
    qtdJogos <- readLn :: IO Int
    let valorArrecadado = calcularValorArrecadado qtdJogos
        qtd15 = div qtdJogos 15
        pct = qtd15 * 8
        valorBonus = calcularValorBonus valorArrecadado pct
        valorReceber = (valorArrecadado / 2) + valorBonus
    putStrLn $ "Valor arrecadado no mês: " ++ show valorArrecadado
    putStrLn $ "Valor do bônus: " ++ show valorBonus
    putStrLn $ "Valor a receber total: " ++ show valorReceber

calcularValorArrecadado :: Int -> Double
calcularValorArrecadado qtdJogos = fromIntegral qtdJogos * 19.9

calcularValorBonus :: Double -> Int -> Double
calcularValorBonus valorArrecadado pct = valorArrecadado * fromIntegral pct / 100
