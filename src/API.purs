module API where

import Prelude

import Affjax (get, Response)
import Affjax.ResponseFormat (ResponseFormatError, json, printResponseFormatError)
import Data.Argonaut (class DecodeJson, decodeJson, Json)
import Data.Bifunctor (bimap, lmap)
import Data.Either (Either)
import Data.Maybe (Maybe)
import Data.Newtype (class Newtype)
import Effect.Aff (Aff)

newtype EulerLimit = EulerLimit { number :: Int }
derive instance eulerLimitNT :: Newtype EulerLimit _
derive newtype instance decodeJsonEulerLimit :: DecodeJson EulerLimit

instance showEuler :: Show EulerLimit where
  show (EulerLimit eulerLimit) = "limit: " <> (show eulerLimit.number)

lookupEulerLimit :: Aff (Either String EulerLimit)
lookupEulerLimit = get json "/api" <#> (_.body >>> decode)
    where
        decode :: Either ResponseFormatError Json -> Either String EulerLimit
        decode body = lmap printResponseFormatError body >>= decodeJson
