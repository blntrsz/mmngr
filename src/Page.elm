module Page exposing (Flags, view)

import Browser exposing (Document)
import Element exposing (Element, centerX, classifyDevice, column, el, fill, link, maximum, padding, paddingEach, row, spaceEvenly, spacing, text, width)


type alias Flags =
    { x : Int
    , y : Int
    }


header : Element msg
header =
    let
        _ =
            classifyDevice
                { height = 1
                , width = 2
                }
    in
    row
        [ width fill
        , paddingEach
            { bottom = 20
            , top = 0
            , left = 0
            , right = 0
            }
        , spaceEvenly
        ]
        [ link [] { url = "/", label = text "MMNGR" }
        , row [ spacing 20 ]
            [ link [] { url = "/", label = text "home" }
            , link [] { url = "/about", label = text "about" }
            ]
        ]


footer : Element msg
footer =
    el [] (row [] [])


layout : Element msg -> Flags -> Element msg
layout content flags =
    column [ width fill, centerX, width (fill |> maximum 800), padding 20 ]
        [ header
        , contentWrapper content
        , text (String.fromInt flags.x)
        , footer
        ]


contentWrapper : Element msg -> Element msg
contentWrapper content =
    el [] content


view : Flags -> { title : String, content : Element msg } -> Document msg
view flags { title, content } =
    { title = title
    , body =
        [ Element.layout
            [ width fill
            ]
            (layout content flags)
        ]
    }
