module Main exposing (..)

import Http


type alias Model =
    { title : String
    }


type Msg
    = MsgGotTitle Result


getTitle =
    Http.get
        { url = "https://jsonplaceholder.typicode.com/posts/20"
        , expect = Http.expectJson MsgGotTitle dataTitleDecoder
        }


dataTitleDecoder =
    Json.decode.field "title" Json.decode.string
