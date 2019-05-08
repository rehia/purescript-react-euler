module App.EulerIncrement where
  
import Prelude

import React.Basic (Self, Component, JSX, createComponent, make)
import React.Basic.DOM as R
import React.Basic.Events as E

type Props = 
    { euler :: Int -> Int
    }

type State =
    { iteration :: Int
    , value :: Int
    }

component :: Component Props
component = createComponent "EulerIncrement"

eulerIncrement :: Props -> JSX
eulerIncrement = make component { render, initialState }

initialState :: State
initialState = 
    { iteration: 0
    , value: 0
    }

nextEulerValue :: (Int -> Int) -> State -> State
nextEulerValue euler state =
    { iteration: next
    , value: euler next
    }
    where
      next = state.iteration + 1

render :: Self Props State -> JSX
render self = R.div_
    [ R.button 
        { onClick: E.handler_ do
          self.setState $ nextEulerValue self.props.euler
        , children: [ R.text "Next Euler value" ]
        }
    , R.div_ [ R.text (show self.state.value) ]
    ]
