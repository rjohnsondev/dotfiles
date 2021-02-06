--------------------------------------------------------------------------------
-- | Example.hs
--
-- Example configuration file for xmonad using the latest recommended
-- features (e.g., 'desktopConfig').
module Main (main) where

--------------------------------------------------------------------------------
import System.Exit
import XMonad
import XMonad.Config.Desktop
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.BinarySpacePartition (emptyBSP)
import XMonad.Layout.NoBorders (noBorders)
import XMonad.Layout.ResizableTile (ResizableTall(..))
import XMonad.Layout.ToggleLayouts (ToggleLayout(..), toggleLayouts)
import XMonad.Prompt
import XMonad.Prompt.ConfirmPrompt
import XMonad.Prompt.Shell
import XMonad.Util.EZConfig
import XMonad.Layout.TwoPane
import XMonad.Layout.Grid
import XMonad.StackSet
import XMonad.Hooks.Place
import XMonad.Actions.CopyWindow
import XMonad.Layout.ThreeColumns


--------------------------------------------------------------------------------
main = do
  spawn "/usr/bin/xmobar /home/richard/.xmonad/xmobar.config" -- Start a task bar such as xmobar.
  spawn "stalonetray" -- Start a task bar such as xmobar.

  -- Start xmonad using the main desktop configuration with a few
  -- simple overrides:
  xmonad $ ewmh $ desktopConfig
    { modMask    = mod4Mask -- Use the "Win" key for the mod key
    , manageHook = myManageHook <+> manageHook desktopConfig
    , layoutHook = desktopLayoutModifiers $ myLayouts
    , borderWidth = 0
    , logHook    = dynamicLogString def >>= xmonadPropLog
    , terminal    = "WINIT_HIDPI_FACTOR=1.0 alacritty"
    }

    `additionalKeysP` -- Add some extra key bindings:
      [ ("M-S-q",   confirmPrompt myXPConfig "exit" (io exitSuccess))
      -- , ("M-g",     spawn "/home/richard/.local/firefox/firefox")
      , ("M-g",     spawn "/usr/bin/google-chrome")
      , ("M-p",     spawn "dmenu_run -fn 'Hack-12'")
      , ("M-<Esc>", sendMessage (Toggle "Full"))
      , ("M-n", windows copyToAll)
      , ("M-S-n", killAllOtherCopies)
      , ("M-S-l", spawn "gnome-screensaver-command -l; sleep 3; xset dpms force off")
      , ("M-<Up>", spawn "amixer -D pulse sset Master 2%+")
      , ("M-<Down>", spawn "amixer -D pulse sset Master 2%-")
      , ("M-<F9>", spawn "pacmd set-default-sink 'alsa_output.usb-GuangZhou_FiiO_Electronics_Co._Ltd_FiiO_K5_Pro-00.analog-stereo'" >>
                   spawn "pacmd set-default-source 'alsa_input.usb-046d_C922_Pro_Stream_Webcam_F447941F-02.analog-stereo'")
      , ("M-<F10>", spawn "pacmd set-default-sink 'alsa_output.usb-0b0e_Jabra_Evolve_75_745C4B60570B022000-00.analog-stereo'" >>
                    spawn "pacmd set-default-source 'alsa_input.usb-0b0e_Jabra_Evolve_75_745C4B60570B022000-00.mono-fallback'")
      , ("M-<F11>", spawn "pacmd set-default-sink 'alsa_output.usb-0b0e_Jabra_Link_370_745C4BE664A2015200-00.analog-stereo'" >>
                    spawn "pacmd set-default-source 'alsa_output.usb-0b0e_Jabra_Link_370_745C4BE664A2015200-00.analog-stereo.monitor'")
      , ("M-<F12>", spawn "pacmd set-default-sink 'alsa_output.pci-0000_28_00.1.hdmi-stereo-extra4'" >>
                    spawn "pacmd set-default-source 'alsa_input.usb-046d_C922_Pro_Stream_Webcam_F447941F-02.analog-stereo'")
      ]

--------------------------------------------------------------------------------
-- | Customize layouts.
--
-- This layout configuration uses two primary layouts, 'ResizableTall'
-- and 'BinarySpacePartition'.  You can also use the 'M-<Esc>' key
-- binding defined above to toggle between the current layout and a
-- full screen layout.
myLayouts = toggleLayouts (noBorders Full) others
  where
    -- others = TwoPane (3/100) (1/2)  ||| Full ||| ThreeColMid 1 (3/100) (1/2) ||| Grid
    others = Full |||  ThreeColMid 1 (3/100) (4/10)

--------------------------------------------------------------------------------
-- | Customize the way 'XMonad.Prompt' looks and behaves.  It's a
-- great replacement for dzen.
myXPConfig = def
  { position          = Top
  , alwaysHighlight   = True
  , promptBorderWidth = 0
  , font              = "xft:monospace:size=9"
  }

--------------------------------------------------------------------------------
-- | Manipulate windows as they are created.  The list given to
-- @composeOne@ is processed from top to bottom.  The first matching
-- rule wins.
--
-- Use the `xprop' tool to get the info you need for these matches.
-- For className, use the second value that xprop gives you.
myManageHook = composeOne
  [ isDialog              -?> doCenterFloat
  , title =? "Microsoft Teams Notification" -?> doFloat <+> doF focusDown
  -- , title =? "Microsoft Teams Notification" -?> doIgnore
    -- Move transient windows to their parent:
  , transience
  ]
