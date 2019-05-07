module Euler where

import Prelude
import Data.List (range, filter, List)
import Data.Foldable (sum)

suite :: List Int
suite = range 0 999

sumMod :: List Int -> Int
sumMod = filter (\n -> mod n 3 == 0 || mod n 5 == 0) >>> sum

answer :: Int
answer = sumMod suite
