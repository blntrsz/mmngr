module Page.Home exposing (..)

import Browser
import Element exposing (Element, column, el, fill, link, padding, rgb255, row, spacing, text, width)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Html exposing (Html)


myView : Html msg
myView =
    Element.layout []
        myRowOfStuff


myRowOfStuff : Element msg
myRowOfStuff =
    column []
        [ row [ width fill, spacing 30 ]
            [ link [] { url = "/", label = text "home" }
            , link [] { url = "/about", label = text "about" }
            ]
        , el [] (text "Home")
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


view : Browser.Document msg
view =
    { title = "home"
    , body =
        [ myView ]
    }
