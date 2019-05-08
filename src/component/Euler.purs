module App.Euler where
  
import Prelude

import React.Basic (Component, JSX, createComponent, makeStateless, fragment)
import React.Basic.DOM as R

component :: Component Props
component = createComponent "Euler"

type Props = 
    { answer :: Int
    }

euler :: Props -> JSX
euler props = props # makeStateless component \props ->
    fragment
    [ R.h1_ [ R.text "Euler's problem solution" ]
    , R.div_[ R.text (show props.answer) ] 
    ]
