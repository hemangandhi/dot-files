import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe, hPutStrLn)
import XMonad.Util.EZConfig(additionalKeys, removeKeys)
import XMonad.Actions.WindowBringer

myBringer = WindowBringerConfig
            { menuCommand  = "dmenu"
            , menuArgs     = ["-b", "-fn", "\"Ubuntu\""]
            , windowTitler = windowTitler (def :: WindowBringerConfig)
            }

main = do
    xmproc <- spawnPipe "xmobar ~/.config/xmobar/xmobarrc"
    xmonad $ docks def
        { manageHook = manageDocks <+> manageHook def
        , layoutHook = avoidStruts  $  layoutHook def
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
        [((mod4Mask, xK_p), spawn "rofi -modi \"run,ssh\" -show \"run\" -font \"Ubuntu 14\""),
         ((mod4Mask, xK_w), gotoMenuConfig myBringer)]
