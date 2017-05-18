{-# LANGUAGE FlexibleInstances, MultiParamTypeClasses, PatternGuards, DeriveDataTypeable, ExistentialQuantification #-}

-- Ungracefully copied from github.com/jojheifer/dot-xmonad/lib/Layout/Nested.hs

module Layout.Nested (
  NestedLayout(..),
  NestedMessage(..),
  firstLayout,
  nextLayout
  ) where

import XMonad.Core
import Data.Maybe (fromMaybe)
import Control.Monad
import Control.Arrow (second)
import Data.Typeable (typeOf)

import qualified XMonad.StackSet as W
import qualified XMonad.Layout as XL

-- | Message wrapping any message with a nesting depth
data NestedMessage = forall a. Message a => NestedMessage Integer a deriving Typeable

instance Message NestedMessage

-- | A layout which wraps any other layout and handles nested messages
data NestedLayout l a = NestedLayout [String] (l a) deriving (Read, Show)

instance LayoutClass l a => LayoutClass (NestedLayout l) a where
  runLayout (W.Workspace i (NestedLayout bs l) ms) =
    fmap (second $ fmap (NestedLayout bs)) . runLayout (W.Workspace i l ms)

  description (NestedLayout _ l) = description l

  handleMessage (NestedLayout bs _) (SomeMessage m)
    | show (typeOf m) `elem` bs = return Nothing

  handleMessage (NestedLayout bs l) m =
    (return . ((return . NestedLayout bs) =<<)) =<< handleMessage l m' where
      m' | Just (NestedMessage 0 im) <- fromMessage m = SomeMessage im
         | Just (NestedMessage n im) <- fromMessage m = SomeMessage $ NestedMessage (n-1) im
         | otherwise = m

-- | Next layout, nested
nextLayout  = flip NestedMessage XL.NextLayout
-- | First layout, nested
firstLayout = flip NestedMessage XL.FirstLayout
