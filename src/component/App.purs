module App where

import Prelude

import App.Euler (euler)
import App.EulerIncrement (eulerIncrement)
import App.EulerRandom (eulerRandom)
import Euler (answer, answerTo)
import React.Basic (Component, JSX, createComponent, makeStateless)
import React.Basic.DOM as R

component :: Component Unit
component = createComponent "App"

app :: JSX
app = unit # makeStateless component \_ ->
  R.div_
    [ euler { answer }
    , eulerIncrement { euler: answerTo }
    , eulerRandom { euler: answerTo }
    ]
