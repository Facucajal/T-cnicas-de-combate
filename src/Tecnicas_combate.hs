module Tecnicas_combate where
import PdePreludat


type Horas = Number
type Objetivo = String
type Presion = Number

presionGolpe :: Horas -> Objetivo -> Presion
presionGolpe horas objetivo = poder horas / fortaleza objetivo

poder :: Horas -> Number
poder = (* 15)

fortaleza :: Objetivo -> Number
fortaleza = (2*) . length

type Golpe = Objetivo -> Number

gomuGomu :: Golpe
gomuGomu = presionGolpe 180

normalesConsecutivos :: Golpe 
normalesConsecutivos = presionGolpe 240

esDificil :: Objetivo -> Bool
esDificil = (<100) . gomuGomu

focalizarObjetivo :: Objetivo -> Objetivo
focalizarObjetivo = take 7

normalesConsecutivosFocalizados :: Golpe
normalesConsecutivosFocalizados = normalesConsecutivos . focalizarObjetivo

between :: Ord a => a -> a -> a -> Bool
between bajo alto medio = bajo <= medio && medio <= alto

rangoAccesible :: Number -> Bool
rangoAccesible = between 200 400

esAccesible :: String -> Bool
esAccesible = rangoAccesible . normalesConsecutivosFocalizados