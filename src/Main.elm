module Main exposing (..)

import Browser
import Browser.Navigation as Nav exposing (Key)
import Dict exposing (update)
import Page.About as About
import Page.Home as Home
import Url



-- MODEL


type alias Model =
    { key : Nav.Key
    , url : Url.Url
    }



-- UPDATE


type Msg
    = ClickedLink Browser.UrlRequest
    | ChangedUrl Url.Url


init : flags -> Url.Url -> Key -> ( Model, Cmd msg )
init _ url key =
    ( Model key url, Cmd.none )


update : Msg -> Model -> ( Model, Cmd a )
update msg model =
    case msg of
        ClickedLink urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( model, Nav.pushUrl model.key (Url.toString url) )

                Browser.External href ->
                    ( model, Nav.load href )

        ChangedUrl url ->
            ( { model | url = url }
            , Cmd.none
            )



-- VIEW


view : Model -> Browser.Document msg
view model =
    case model.url.path of
        "/" ->
            Home.view

        "/about" ->
            About.view

        _ ->
            Home.view



-- MAIN


main : Program () Model Msg
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        , onUrlChange = ChangedUrl
        , onUrlRequest = ClickedLink
        }
