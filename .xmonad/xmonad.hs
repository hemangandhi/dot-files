import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run (spawnPipe, hPutStrLn)
import XMonad.Util.EZConfig (additionalKeys, removeKeys)
import XMonad.Util.Scratchpad
import XMonad.Actions.WindowBringer
import XMonad.Actions.WorkspaceNames
import XMonad.Layout.NoBorders (smartBorders)
import XMonad.Layout.ThreeColumns
import XMonad.Layout.Spiral
import XMonad.Layout.ResizableTile
import Graphics.X11.ExtraTypes.XF86
-- import Layout.Nested

import qualified XMonad.StackSet as W

myBringer = WindowBringerConfig
            { menuCommand  = "dmenu"
            , menuArgs     = ["-b", "-fn", "\"Ubuntu\""]
            , windowTitler = windowTitler (def :: WindowBringerConfig)
            }

-- myLayouts = (myTiles ||| Mirror myTiles ||| Full  ||| my3Col ||| mySpiral ||| myResize)
myLayouts = (myResize ||| Full ||| my3Col ||| mySpiral )
    where nmaster  = 1
          ratio    = 1/2
          delta    = 2/100
          -- myTiles  = Tall nmaster delta ratio
          my3Col   = ThreeCol nmaster delta ratio
          mySpiral = spiral ratio
          myResize = ResizableTall nmaster delta ratio []
          -- nested   = NestedLayout ["ChangeLayout", "NextNoWrap"] (myTiles ||| Mirror myTiles ||| Full)


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
         ((mod4Mask, xK_t), scratchpadSpawnAction (def {terminal = "urxvt"})),
         ((mod4Mask .|. shiftMask, xK_h), sendMessage Expand),
         ((mod4Mask .|. shiftMask, xK_l), sendMessage Shrink),
         ((mod4Mask .|. shiftMask, xK_k), sendMessage MirrorExpand),
         ((mod4Mask .|. shiftMask, xK_j), sendMessage MirrorShrink),
         ((mod4Mask, xK_j), windows W.focusDown),
         ((mod4Mask, xK_k), windows W.focusUp),
         ((mod4Mask, xK_h), windows W.swapUp),
         ((mod4Mask, xK_l), windows W.swapDown),
         ((0, xF86XK_AudioMute), spawn "amixer sset Master toggle"),
         ((0, xF86XK_AudioRaiseVolume), spawn "amixer sset Master 5%+"),
         ((0, xF86XK_AudioLowerVolume), spawn "amixer sset Master 5%-"),
         ((0 .|. shiftMask, xF86XK_AudioMute), spawn "amixer sset Capture toggle"),
         ((0 .|. shiftMask, xF86XK_AudioRaiseVolume), spawn "amixer sset Capture 5%+"),
         ((0 .|. shiftMask, xF86XK_AudioLowerVolume), spawn "amixer sset Capture 5%-"),
         ((0, 0xffe4), gotoMenuConfig myBringer),
         ((0, 0xffc1), kill),
         ((0, 0xff61), spawn "scrot"),
         ((0, 0xff67), spawn "rofi -modi \"run,ssh\" -show \"run\" -font \"Ubuntu 14\"")
         -- ((0, 0xffeb), spawn "urxvt -e zsh -c \"xrandr && zsh\"")
         ]
