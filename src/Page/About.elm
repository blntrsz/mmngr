module Page.About exposing (..)

import Element exposing (Element, centerX, el, fill, maximum, paragraph, spacing, text, width)


content : Element msg
content =
    el
        [ spacing 30
        , centerX
        ]
        (paragraph [] [ text "About aslkdjhalks asklksd dksadas dasoidapois udapos iudapos udaposd iuaposdi uapsodiu aposidu aposid uaposd uapos iduaposiudpoai supodu asoi uaposi uaod iud" ])


view : { title : String, content : Element msg }
view =
    { title = "About"
    , content = content
    }
