import Control.Monad (when)
import Text.Printf (printf)

main :: IO ()
main = do
    putStrLn "Vamos fazer um cálculo de IPCA (Índice Nacional de Preços ao Consumidor)!"
    putStrLn "Insira os dados do IPCA (mês/ano IPCA) separados por espaço, ou * para finalizar:"
    calcularIPCA (1/0) (-1/0) 0 0 "" ""

calcularIPCA :: Double -> Double -> Double -> Int -> String -> String -> IO ()
calcularIPCA menor maior somaIPCA quantidadeMeses menorMes maiorMes = do
    linha <- getLine
    if linha /= "*"
        then do
            let (mesAno:ipcaStr:_) = words linha
                ipca = read (replaceComma ipcaStr) :: Double
            let menor' = min ipca menor
                menorMes' = if ipca == menor' then mesAno else menorMes
                maior' = max ipca maior
                maiorMes' = if ipca == maior' then mesAno else maiorMes
                somaIPCA' = somaIPCA + ipca
                quantidadeMeses' = quantidadeMeses + 1
            calcularIPCA menor' maior' somaIPCA' quantidadeMeses' menorMes' maiorMes'
        else printResult menor maior somaIPCA menorMes maiorMes quantidadeMeses

replaceComma :: String -> String
replaceComma = map (\c -> if c == ',' then '.' else c)

printResult :: Double -> Double -> Double -> String -> String -> Int -> IO ()
printResult menor maior somaIPCA menorMes maiorMes quantidadeMeses = do
    let mediaIPCA = if quantidadeMeses /= 0 then somaIPCA / fromIntegral quantidadeMeses else 0
    printf "Menor IPCA: %.2f" menor
    when (menorMes /= "") $ printf " (%s)" menorMes
    putStrLn ""
    printf "Maior IPCA: %.2f" maior
    when (maiorMes /= "") $ printf " (%s)" maiorMes
    putStrLn ""
    printf "Média IPCA: %.2f\n" mediaIPCA
