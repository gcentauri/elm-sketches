import Html exposing (..)
import Html.Events exposing (onClick)
import Svg exposing (Svg, svg, circle, rect)
import Svg.Attributes exposing ( x, y, width, height
                               , cx, cy, r
                               , fill)


main =
  Html.beginnerProgram
    { model = model
    , view = view
    , update = update
    }



-- MODEL

type State 
    = Red
    | Yellow
    | Green
    
type alias Model =
    { state : State
    }
    
      
model : Model
model =
    Model Red

-- UPDATE
      
type Msg
    = Change

update : Msg -> Model -> Model
update msg model =
  case msg of
      Change ->
          { model | state = nextState model.state }

nextState : State -> State
nextState state =
    case state of
        Red ->
            Green

        Green ->
            Yellow

        Yellow ->
            Red

-- VIEW


view : Model -> Html Msg
view model =
    div []
      [ button [ onClick Change ] [ text "next" ]
      , svg []
            [ background
            , makeLight model.state
            ]
      ]

stateString : State -> String
stateString state =
    case state of
        Red ->
            "red"

        Yellow ->
            "yellow"

        Green ->
            "lightgreen"

makeLight : State -> Svg msg
makeLight state =
    let
        color = stateString state

    in
        case state of
            Red ->
                circle [ cx "100"
                       , cy "80"
                       , r "45"
                       , fill color ] []
                    
            Yellow ->
                circle [ cx "100"
                       , cy "160"
                       , r "45"
                       , fill color ] []

            Green ->
                circle [ cx "100"
                       , cy "240"
                       , r "45"
                       , fill color ] []

background : Svg msg
background =
    rect [ x "34", y "10"
         , width "130", height "300"
         , fill "black"] []
