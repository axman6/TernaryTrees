module Data.Map.StringMap.Internal where

-- | StringMap v is ternary tree. It is commonly used for storing word lists
-- like dictionaries.
data StringMap v = 
                    -- | Nodes contain key elements only
                      Node {-# UNPACK #-}!Char !(StringMap v) !(StringMap v) !(StringMap v)
                    -- | Null nodes contain the value pointed to by the key list
                    | Null  v !(StringMap v)
                    -- | An empty tree
                    | End
               deriving (Show, Eq)