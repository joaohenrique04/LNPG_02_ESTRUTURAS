import System.IO

main :: IO ()
main = do
    hSetBuffering stdout NoBuffering
    putStrLn "Seja bem-vindo(a) ao nosso aeroporto!"
    putStr "Primeiro me informe o número de passageiros => "
    qtdPassageiros <- readLn :: IO Int
    validarPassageiros qtdPassageiros

validarPassageiros :: Int -> IO ()
validarPassageiros 0 = putStrLn "Todos os passageiros foram validados."
validarPassageiros n = do
    putStrLn $ "Olá passageiro " ++ show n ++ "! Vamos validar suas informações..."
    docRG <- prompt "Insira seu RG => "
    dataRG <- prompt "Insira a data de nasc. de seu RG (DD/MM/YYYY) => "
    docPassagem <- prompt "Insira sua passagem => "
    dataPassagem <- prompt "Insira a data de nasc. da sua passagem (DD/MM/YYYY) => "
    assento <- prompt "Insira seu assento => "
    if docRG /= "RG"
        then putStrLn "A saída é nessa direção..."
        else if docPassagem /= "Passagem"
            then putStrLn "A recepção é nessa direção..."
            else if dataPassagem /= dataRG
                then putStrLn "190"
                else putStrLn $ "Seu assento é " ++ assento ++ "! Tenha um ótimo dia."
    validarPassageiros (n - 1)

prompt :: String -> IO String
prompt promptMsg = do
    putStrLn promptMsg
    getLine

splitOn :: Eq a => [a] -> [a] -> [[a]]
splitOn _ [] = [[]]
splitOn delim str =
    let (pre, suf) = breakList delim str
    in pre : case suf of
        [] -> []
        x -> splitOn delim (drop (length delim) x)

breakList :: Eq a => [a] -> [a] -> ([a], [a])
breakList _ [] = ([], [])
breakList pat str@(x:xs)
    | pat `isPrefixOf` str = ([], str)
    | otherwise = let (pre, suf) = breakList pat xs
                  in (x : pre, suf)

isPrefixOf :: Eq a => [a] -> [a] -> Bool
isPrefixOf [] _ = True
isPrefixOf _ [] = False
isPrefixOf (x:xs) (y:ys)
    | x == y = isPrefixOf xs ys
    | otherwise = False
