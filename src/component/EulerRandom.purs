module App.EulerRandom where
  
import Prelude

import Effect (Effect)
import Effect.Aff (Error, runAff_)
import Effect.Console (error)
import Data.Either (Either, either)
import React.Basic (Self, Component, JSX, createComponent, make)
import React.Basic.DOM as R
import React.Basic.Events as E
import API (lookupEulerLimit, EulerLimit (..))
import Data.Newtype (unwrap)

type Props = 
    { euler :: Int -> Int
    }

type State =
    { value :: Int
    }

component :: Component Props
component = createComponent "EulerRandom"

eulerRandom :: Props -> JSX
eulerRandom = make component { render, initialState }

initialState :: State
initialState = 
    { value: 0
    }

nextEulerValue :: Self Props State -> Effect Unit 
nextEulerValue self =
    runAff_ (either onFailure onSuccess) lookupEulerLimit
    where
        onFailure :: Error -> Effect Unit
        onFailure = show >>> error
        onSuccess :: Either String EulerLimit -> Effect Unit
        onSuccess = either error (\(EulerLimit limit) -> 
            self.setState $ \state -> 
                state 
                { value = self.props.euler limit.number 
                }
            )

render :: Self Props State -> JSX
render self = R.div_
    [ R.button 
        { onClick: E.handler_ do
            nextEulerValue self
        , children: [ R.text "Next Euler value" ]
        }
    , R.div_ [ R.text (show self.state.value) ]
    ]
