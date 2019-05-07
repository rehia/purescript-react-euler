module Main where

import Prelude

import Data.Maybe (maybe)
import Effect (Effect)
import Effect.Console (log)
import Euler (answer)
import App (app)

import React.Basic.DOM (render)
import Web.DOM (Element)
import Web.DOM.NonElementParentNode (getElementById)
import Web.HTML (window)
import Web.HTML.HTMLDocument (toNonElementParentNode)
import Web.HTML.Window (document)

noBrowser :: Effect Unit
noBrowser = log ("Euler's problem answer is " <> show answer)

browser :: Element -> Effect Unit
browser = render app 

main :: Effect Unit
main = do
  root <- getElementById "root" =<< (map toNonElementParentNode $ document =<< window)
  maybe noBrowser browser root
