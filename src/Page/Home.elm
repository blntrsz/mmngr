module Page.Home exposing (..)

import Design exposing (button)
import Element exposing (Element, column, el, padding, rgb255, text)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font


myRowOfStuff : Element msg
myRowOfStuff =
    column []
        [ el [] (text "Home")
        , button []
            { label = text "button"
            , onPress = Maybe.Nothing
            }
        ]


myElement : Element msg
myElement =
    el
        [ Background.color (rgb255 240 0 245)
        , Font.color (rgb255 255 255 255)
        , Border.rounded 3
        , padding 30
        ]
        (text "stylish!")


view : { title : String, content : Element msg }
view =
    { title = "home"
    , content =
        myRowOfStuff
    }
