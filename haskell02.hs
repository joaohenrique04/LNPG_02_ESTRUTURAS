import Text.Printf

main :: IO ()
main = do
    putStrLn "Vamos calcular o valor aproximado de PI!"
    putStrLn "Com quantos termos devemos fazer o cálculo? "
    qtdTermos <- readLn :: IO Int
    let piValue = calcularPi qtdTermos
    printf "pi = %.5f\n" piValue

calcularPi :: Int -> Double
calcularPi qtdTermos =
    let loop soma _ 0 = soma
        loop soma denominador n =
            let termo = if n `mod` 2 == 0 then 1 / denominador ^ 3 else -1 / denominador ^ 3
            in loop (soma + termo) (denominador + 2) (n - 1)
        somaFinal = loop 0 1 qtdTermos
    in cbrt (somaFinal * 32)

cbrt :: Double -> Double
cbrt x = x ** (1/3)
