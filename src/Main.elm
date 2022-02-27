port module Main exposing (main)

import Browser
import Browser.Navigation as Nav exposing (Key)
import Dict exposing (update)
import Page
import Page.About as About
import Page.Home as Home
import Url



-- PORTS


port onResize : (Page.Flags -> msg) -> Sub msg


subscriptions : Model -> Sub Msg
subscriptions _ =
    onResize Resize



-- MODEL


type alias Model =
    { key : Nav.Key
    , url : Url.Url
    , flags : Page.Flags
    }



-- UPDATE


type Msg
    = ClickedLink Browser.UrlRequest
    | ChangedUrl Url.Url
    | Resize Page.Flags


init : Page.Flags -> Url.Url -> Key -> ( Model, Cmd msg )
init flags url key =
    ( Model key url flags, Cmd.none )


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

        Resize { x, y } ->
            ( { model | flags = { x = x, y = y } }, Cmd.none )



-- VIEW


view : Model -> Browser.Document msg
view model =
    case model.url.path of
        "/" ->
            Page.view model.flags Home.view

        "/about" ->
            Page.view model.flags About.view

        _ ->
            Page.view model.flags Home.view



-- MAIN


main : Program Page.Flags Model Msg
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlChange = ChangedUrl
        , onUrlRequest = ClickedLink
        }
