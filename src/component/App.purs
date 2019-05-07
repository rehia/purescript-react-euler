module App where

import Prelude
import React.Basic (Component, JSX, createComponent, makeStateless)
import React.Basic.DOM as R

import Euler (answer)
import App.Euler (euler)

component :: Component Unit
component = createComponent "App"

app :: JSX
app = unit # makeStateless component \_ ->
  R.div_
    [ euler { answer: answer }
    ]
