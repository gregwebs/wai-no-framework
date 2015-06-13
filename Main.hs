{-# Language OverloadedStrings #-}
import Network.HTTP.Types
import Network.Wai
import Network.Wai.Handler.Warp (run)
import Data.ByteString (ByteString)

main :: IO ()
main = do
    -- session <- Vault.newKey
    run 3000 routes

typeText :: (HeaderName, ByteString)
typeText = ("Content-Type", "text/plain")

routes :: Application
routes req respond = respond $
  case pathInfo req of
    ("app":_rest)    -> responseLBS status200 [typeText] "Hello World"
    ("static":_rest) -> responseLBS status200 [typeText] "Hello World"
    _ -> error "could not route"
