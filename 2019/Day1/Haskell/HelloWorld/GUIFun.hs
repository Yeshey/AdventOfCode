{-# LANGUAGE OverloadedStrings #-}
import GHCJS.DOM
import GHCJS.DOM.Element
import GHCJS.DOM.EventM
import GHCJS.DOM.HTMLButtonElement
import GHCJS.DOM.Node

main :: IO ()
main = do
  Just doc <- currentDocument
  Just body <- getBody doc
  button <- createButton doc "Click Me"
  appendChild body (Just button)
  button `on` click $ do
    putStrLn "Button was clicked"
