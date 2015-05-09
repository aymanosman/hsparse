import Data.Word
import Data.Binary.Get
import qualified Data.ByteString.Lazy as BL

data Trade = Trade {
       dataType :: !Word16
     , infoType :: !Word16
     , marketType :: !Word8
     , issueCode :: !Word64
     } deriving (Show)

getTrade = do
    -- word <- getWord32le
    dataType <- getWord16le
    infoType <- getWord16le
    marketType <- getWord8
    issueCode <- getWord64le
    return $! Trade dataType infoType marketType issueCode

main = do
    input <- BL.readFile "kopi.pcap"
    let trade = runGet getTrade input
    print trade

--     Data Type                               2   B6
--     Information Type                        2   03
--     Market Type                             1   4
--     Issue code                             12   ISIN code
--     Issue seq.-no.                          3
--     Market Status Type                      2
--     Total bid quote volume                  7
--     Best bid price(1st)                     5
--     Best bid quantity(1st)                  7
--     Best bid price(2nd)                     5
--     Best bid quantity(2nd)                  7
--     Best bid price(3rd)                     5
--     Best bid quantity(3rd)                  7
--     Best bid price(4th)                     5
--     Best bid quantity(4th)                  7
--     Best bid price(5th)                     5
--     Best bid quantity(5th)                  7
--     Total ask quote volume                  7
--     Best ask price(1st)                     5
--     Best ask quantity(1st)                  7
--     Best ask price(2nd)                     5
--     Best ask quantity(2nd)                  7
--     Best ask price(3rd)                     5
--     Best ask quantity(3rd)                  7
--     Best ask price(4th)                     5
--     Best ask quantity(4th)                  7
--     Best ask price(5th)                     5
--     Best ask quantity(5th)                  7
--     No. of best bid valid quote(total)      5
--     No. of best bid quote(1st)              4
--     No. of best bid quote(2nd)              4
--     No. of best bid quote(3rd)              4
--     No. of best bid quote(4th)              4
--     No. of best bid quote(5th)              4
--     No. of best ask valid quote(total)      5
--     No. of best ask quote(1st)              4
--     No. of best ask quote(2nd)              4
--     No. of best ask quote(3rd)              4
--     No. of best ask quote(4th)              4
--     No. of best ask quote(5th)              4
--     *Quote accept time*                     8  HHMMSSuu
--     End of Message                          1  0xff
