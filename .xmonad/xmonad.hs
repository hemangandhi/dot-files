import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe, hPutStrLn)
import XMonad.Util.EZConfig(additionalKeys, removeKeys)
import XMonad.Util.Scratchpad
import XMonad.Actions.WindowBringer
import XMonad.Actions.WorkspaceNames

myBringer = WindowBringerConfig
            { menuCommand  = "dmenu"
            , menuArgs     = ["-b", "-fn", "\"Ubuntu\""]
            , windowTitler = windowTitler (def :: WindowBringerConfig)
            }

--myLog = workspaceNamesPP (dynamicLogWithPP (xmobarPP {
--    ppOutput = hPutStrLn xmproc
--}))

main = do
    xmproc <- spawnPipe "xmobar ~/.config/xmobar/xmobarrc"
--    workspaceNamesPP xmobarPP >>= dynamicLogString >>= xmonadPropLog
    xmonad $ docks def
        { manageHook = manageDocks <+> manageHook def
        , layoutHook = avoidStruts  $  layoutHook def
        , logHook    = workspaceNamesPP xmobarPP {ppOutput = hPutStrLn xmproc} >>= dynamicLogWithPP
--        , logHook    = workspaceNamesPP {ppOutput = hPutStrLn xmproc} >>= dynamicLogString >>= xmonadPropLog
        , terminal   = "urxvt"
        , modMask    = mod4Mask
        }
        `additionalKeys`
        [((mod4Mask, xK_p), spawn "rofi -modi \"run,ssh\" -show \"run\" -font \"Ubuntu 14\""),
         ((mod4Mask, xK_w), gotoMenuConfig myBringer),
         ((mod4Mask, xK_r), renameWorkspace def),
         ((mod4Mask .|. shiftMask, xK_Left), swapTo Prev),
         ((mod4Mask .|. shiftMask, xK_Right), swapTo Next),
         ((mod4Mask, xK_t), scratchpadSpawnAction (def {terminal = "urxvt"}))
         ]
