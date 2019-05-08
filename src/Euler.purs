module Euler where

import Prelude

import Data.Foldable (sum)
import Data.List (range, filter, List, take)

suite :: Int -> List Int
suite = range 1

eulerFilter :: List Int -> List Int
eulerFilter = filter (\n -> mod n 3 == 0 || mod n 5 == 0)

eulerFigures :: List Int
eulerFigures = eulerFilter $ suite 999

sumMod :: Int
sumMod = sum eulerFigures

answerTo :: Int -> Int
answerTo n = sum $ take n eulerFigures

answer :: Int
answer = answerTo 999
