import XMonad

import qualified Data.Map as M
import Data.Bits ((.|.))

import XMonad.Layout.Grid
import XMonad.Config.Gnome
import XMonad.Layout.TwoPane
import XMonad.Layout.LayoutScreens
import XMonad.Config.Desktop (desktopLayoutModifiers)
import XMonad.Hooks.ManageHelpers (isFullscreen,doFullFloat)

main = xmonad gnomeConfig
        { modMask = mod4Mask
        , focusedBorderColor = "grey"
        , normalBorderColor  = "black"
        , borderWidth = 0
        , layoutHook = desktopLayoutModifiers ( TwoPane (3/100) (1/2)  ||| Full ||| Grid )
        , manageHook = composeAll
             [ manageHook gnomeConfig
             , className =? "Unity-2d-panel"    --> doIgnore
             , className =? "Unity-2d-launcher" --> doIgnore
             , className =? "Cssh" --> doFloat
             , isFullscreen --> doFullFloat ]
        , terminal = "gnome-terminal"
	, focusFollowsMouse = True
        , keys     = \c -> philKeys `M.union` keys gnomeConfig c
        }
  where
    philKeys = M.fromList $
              [ ((mod4Mask , xK_g) , spawn "google-chrome") 
              , ((mod4Mask , xK_p) , spawn "gmrun")
              , ((mod4Mask , xK_i) , spawn "google-chrome --app='https://skim.hipchat.com/chat'")
              , ((mod4Mask , xK_s) , spawn "google-chrome --app='https://skimlinks.slack.com'")
              , ((0, xK_F6) , spawn "spotify.bash playpause")
              , ((0, xK_F5) , spawn "spotify.bash previous")
              , ((0, xK_F7) , spawn "spotify.bash stop")
              , ((0, xK_F8) , spawn "spotify.bash next") ]
