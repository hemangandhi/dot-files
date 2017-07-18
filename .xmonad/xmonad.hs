import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run (spawnPipe, hPutStrLn)
import XMonad.Util.EZConfig (additionalKeys, removeKeys)
import XMonad.Util.Scratchpad
import XMonad.Actions.WindowBringer
import XMonad.Actions.WorkspaceNames
import XMonad.Actions.Navigation2D
import XMonad.Layout.NoBorders (smartBorders)
import XMonad.Layout.Spiral
import XMonad.Layout.Grid
import XMonad.Layout.Tabbed
import XMonad.Layout.BinarySpacePartition
import XMonad.Layout.ResizableTile
import Graphics.X11.ExtraTypes.XF86

import qualified XMonad.StackSet as W

myBringer = WindowBringerConfig
            { menuCommand  = "dmenu"
            , menuArgs     = ["-b", "-fn", "\"Ubuntu\""]
            , windowTitler = windowTitler (def :: WindowBringerConfig)
            }

myLayouts = (simpleTabbed ||| mySpiral ||| emptyBSP ||| Grid)
    where nmaster  = 1
          ratio    = 1/2
          delta    = 2/100
          mySpiral = spiral ratio
          -- myResize = ResizableTall nmaster delta ratio []


main = do
    xmproc <- spawnPipe "xmobar ~/.config/xmobar/xmobarrc"
    xmonad $ docks def
        { manageHook = manageDocks <+> manageHook def
        , layoutHook = avoidStruts $ (smartBorders myLayouts)
        , logHook    = workspaceNamesPP xmobarPP {ppOutput = hPutStrLn xmproc} >>= dynamicLogWithPP
        , terminal   = "urxvt"
        , modMask    = mod4Mask
        }
        `additionalKeys`
        [((mod4Mask, xK_p), spawn "rofi -modi \"run,ssh\" -show \"run\" -font \"Ubuntu 14\""),
         ((mod4Mask, xK_r), renameWorkspace def),
         ((mod4Mask .|. shiftMask, xK_Left), swapTo Prev),
         ((mod4Mask .|. shiftMask, xK_Right), swapTo Next),
         ((mod4Mask, xK_t), scratchpadSpawnActionTerminal "urxvt"),
         ((0, xF86XK_AudioMute), spawn "amixer sset Master toggle"),
         ((0, xF86XK_AudioRaiseVolume), spawn "amixer sset Master 5%+"),
         ((0, xF86XK_AudioLowerVolume), spawn "amixer sset Master 5%-"),
         ((0 .|. shiftMask, xF86XK_AudioMute), spawn "amixer sset Capture toggle"),
         ((0 .|. shiftMask, xF86XK_AudioRaiseVolume), spawn "amixer sset Capture 5%+"),
         ((0 .|. shiftMask, xF86XK_AudioLowerVolume), spawn "amixer sset Capture 5%-"),
         ((0, 0xffe4), gotoMenuConfig myBringer),
         ((0, 0xffc1), kill),
         ((mod4Mask , 0xffc1), spawn "systemctl suspend && slock"),
         ((0, 0xffc2), sendMessage NextLayout),
         ((0 .|. shiftMask, 0xffc2), sendMessage FirstLayout),
         ((0, 0xff61), spawn "scrot"),
         ((0, 0xff67), spawn "urxvt"),
         --navigation 2D
         ((mod4Mask, xK_h), windowGo L True),
         ((mod4Mask, xK_j), windowGo D True),
         ((mod4Mask, xK_k), windowGo U True),
         ((mod4Mask, xK_l), windowGo R True),
         ((mod4Mask .|. shiftMask, xK_h), windowSwap L True),
         ((mod4Mask .|. shiftMask, xK_j), windowSwap D True),
         ((mod4Mask .|. shiftMask, xK_k), windowSwap U True),
         ((mod4Mask .|. shiftMask, xK_l), windowSwap R True)
         ]
