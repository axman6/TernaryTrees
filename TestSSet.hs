module Main where
import Data.Set.StringSet


import Test.QuickCheck
import Test.QuickCheck.Batch
import Control.Monad
import Data.Monoid
import Data.Binary
import Data.List hiding (insert)

main = do
    putStrLn "Running tests..."
    runTests "simple" defOpt [
        run prop_singleton,
        run prop_insert1
        ]
    runTests "complex" defOpt [
        -- run prop_
        ]


    

instance Arbitrary StringSet where
    arbitrary = arbitrary >>= return . fromList
    -- arbitrary = oneof
    --                 [return End,
    --                 liftM Null arbitrary,
    --                 liftM4 Node arbitrary arbitrary arbitrary arbitrary]

prop_singleton xs = insert xs empty == singleton xs

prop_insert1 xs = member xs (singleton xs)

prop_sorted xs = (nub . sort $ xs) == (elems . fromList $ xs)

prop_counts xs = (length . nub $ xs) == (size . fromList $ xs)

prop_binary xs = fromList xs == (decode . encode . fromList $ xs)

--prop_ratio xs = Prelude.null xs || all Prelude.null xs || compRatio set <= 1
  --  where set = fromList xs
