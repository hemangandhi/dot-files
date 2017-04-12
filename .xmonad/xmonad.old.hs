{-# LANGUAGE FlexibleContexts #-}
import XMonad
import XMonad.Util.CustomKeys
import XMonad.Hooks.ManageDocks
import qualified Data.Map

main = do
    xmproc <- spanPipe "xmobar"
    xmonad defaults

myMod = mod4Mask

delKeys XConfig {XMonad.modMask = modMask} =
    [(modMask, xK_p)]

insKeys conf@(XConfig {XMonad.modMask = modMask}) =
    [((modMask, xK_p), spawn "dmenu_run -b -fn 'Ubuntu'")]

defaults = docks def
    { terminal = "urxvt"
    , modMask  = myMod
    , keys     = customKeys delKeys insKeys
    , layoutHook   = myLayout
    }

myLayout = avoidStruts $ Tall ||| Wide
