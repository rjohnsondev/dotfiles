import XMonad
import XMonad.Hooks.EwmhDesktops

import qualified Data.Map as M
import Data.Bits ((.|.))

import XMonad.Layout.Grid
import XMonad.Config.Gnome
import XMonad.Layout.TwoPane
import XMonad.Layout.LayoutScreens
import XMonad.Config.Desktop (desktopLayoutModifiers)
import XMonad.Hooks.ManageHelpers (isFullscreen,doFullFloat)
import Graphics.X11.ExtraTypes.XF86

main = xmonad $ ewmh defaultConfig
        { modMask = mod4Mask
        , focusedBorderColor = "grey"
        , normalBorderColor  = "black"
        , borderWidth = 0
        , layoutHook = desktopLayoutModifiers ( TwoPane (3/100) (1/2)  ||| Full ||| Grid )
        , terminal = "gnome-terminal"
        , focusFollowsMouse = True
        , keys     = \c -> philKeys `M.union` keys defaultConfig c
        }
  where
    philKeys = M.fromList $
              [ ((mod4Mask , xK_g) , spawn "google-chrome") 
              , ((mod4Mask , xK_p) , spawn "gmrun")
              , ((mod4Mask , xK_u) , spawn "unity-control-center")
              , ((noModMask, xF86XK_MonBrightnessUp) , spawn "xbacklight -inc 10")
              , ((noModMask, xF86XK_MonBrightnessDown) , spawn "xbacklight -dec 10")
              , ((noModMask, xF86XK_AudioMute) , spawn "amixer -D pulse set Master 1+ toggle")
              , ((noModMask, xF86XK_AudioRaiseVolume) , spawn "amixer -D pulse sset Master 5%+")
              , ((noModMask, xF86XK_AudioLowerVolume) , spawn "amixer -D pulse sset Master 5%-")
              -- , ((noModMask, xK_Caps_Lock) , spawn "/usr/bin/setxkbmap -option caps:escape")
              , ((mod4Mask .|. shiftMask, xK_l) , spawn "gnome-screensaver-command -l; sleep 3; xset dpms force off")
              ]
              -- , ((mod4Mask , xK_i) , spawn "chromium-browser --app='https://skim.hipchat.com/chat'")
              -- , ((mod4Mask , xK_s) , spawn "chromium-browser --app='https://skimlinks.slack.com'") ]
