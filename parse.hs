{-# LANGUAGE OverloadedStrings #-}

import Control.Applicative
import Data.Attoparsec.Char8
import Data.Word

-- | Type for IP's.
data IP = IP Word8 Word8 Word8 Word8 deriving Show

parseIP :: Parser IP
parseIP = liftA3 IP d d d <*> decimal
    where
        d = decimal <* char '.'

s = "131.45.68.123"

main :: IO ()
main = print $ parseOnly parseIP s

