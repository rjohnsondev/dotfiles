import XMonad

import qualified Data.Map as M
import Data.Bits ((.|.))

import XMonad.Layout.Grid
import XMonad.Config.Gnome
import XMonad.Layout.TwoPane
import XMonad.Layout.LayoutScreens
import XMonad.Config.Desktop (desktopLayoutModifiers)
import XMonad.Hooks.ManageHelpers (isFullscreen,doFullFloat)

main = xmonad $ defaultConfig
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
              , ((mod4Mask .|. shiftMask, xK_l) , spawn "gnome-screensaver-command -l && sleep 1; xset dpms force off")
              , ((mod4Mask , xK_i) , spawn "google-chrome --app='https://skim.hipchat.com/chat'")
              , ((mod4Mask , xK_s) , spawn "google-chrome --app='https://skimlinks.slack.com'") ]
