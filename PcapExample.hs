module Main where

import Network.Pcap
import qualified Data.ByteString as B
import qualified Data.Word8 as W8
import qualified Data.ByteString.Char8 as C

main = do
    pcap <- openOffline "kopi.pcap"
    b <- nextBS pcap
    print b
    print $ B.length . snd $ b

main1 = (openOffline "kopi.pcap") >>= (\pcap -> nextBS pcap >> nextBS pcap >>= \(hd, bs) -> return $ B.dropWhile (/= W8._B) bs)
main2 = C.putStrLn (B.pack [0x42, 0x36, 0x30, 0x33, 0x34, 0x4b])

