module Design exposing (..)

import Element exposing (paddingXY)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input



-- COLORS


white : Element.Color
white =
    Element.rgb255 255 255 255


purple : Element.Color
purple =
    Element.rgb255 84 13 110


pink : Element.Color
pink =
    Element.rgb255 238 66 102


yellow : Element.Color
yellow =
    Element.rgb255 255 210 63


blue : Element.Color
blue =
    Element.rgb255 59 206 172


green : Element.Color
green =
    Element.rgb255 14 173 105


hoverColor : Element.Color -> Element.Color
hoverColor color =
    let
        colorRgbRecord =
            Element.toRgb color

        opaqueColor =
            { colorRgbRecord | alpha = 0.7 }
    in
    Element.fromRgb opaqueColor



-- COMPONENTS


button : List (Element.Attribute msg) -> { onPress : Maybe msg, label : Element.Element msg } -> Element.Element msg
button attributes { onPress, label } =
    Input.button
        (List.concat
            [ attributes
            , [ Background.color blue
              , paddingXY 10 5
              , Border.rounded 5
              , Font.color white
              , Element.mouseOver [ Background.color (hoverColor blue) ]
              ]
            ]
        )
        { onPress = onPress, label = label }
