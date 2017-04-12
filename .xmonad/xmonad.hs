import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe, hPutStrLn)
import XMonad.Util.EZConfig(additionalKeys, removeKeys)

main = do
    xmproc <- spawnPipe "xmobar ~/.config/xmobar/xmobarrc"
    xmonad $ docks def
        { manageHook = manageDocks <+> manageHook defaultConfig
        , layoutHook = avoidStruts  $  layoutHook defaultConfig
        , logHook    = dynamicLogWithPP $ xmobarPP {
            ppOutput = hPutStrLn xmproc
          -- , ppTitle = xmobarColor xmobarTitleColor "" . shorten 100
          -- , ppCurrent = xmobarColor xmobarCurrentWorkspaceColor ""
          -- , ppSep = "   "
      }
        , terminal   = "urxvt"
        , modMask    = mod4Mask
        }
        `additionalKeys`
        [((mod4Mask, xK_p), spawn "dmenu_run -b -fn 'Ubuntu'")]
