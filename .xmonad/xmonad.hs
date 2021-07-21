import XMonad
import System.IO (hPutStrLn)
import qualified XMonad.StackSet as W

import XMonad.Layout.Minimize
import XMonad.Layout.NoBorders
import XMonad.Actions.Minimize

import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.FadeInactive
import XMonad.Hooks.ServerMode
import XMonad.Hooks.WorkspaceHistory

import XMonad.Util.Run
import XMonad.Util.CustomKeys
import XMonad.Util.EZConfig
import XMonad.Util.SpawnOnce

import Graphics.X11.ExtraTypes.XF86


myStartupHook = do
  spawnOnce "nitrogen --restore"
  spawnOnce "compton --backend glx --vsync opengl &"

myLayoutHook = minimize ( avoidStruts ( tiled ||| Mirror tiled ||| noBorders Full ))
  where
    tiled = Tall nmaster delta ratio
    nmaster = 1
    ratio = 1/2
    delta = 3/100

myLogHook :: X ()
myLogHook = fadeInactiveLogHook fadeAmount
  where fadeAmount = 0.95

myWorkspaces :: [String]
myWorkspaces = ["1:laptop", "2:main", "3", "4", "5", "6", "7", "8", "9"]
      
windowCount :: X (Maybe String)
windowCount = gets $ Just . show . length . W.integrate' . W.stack . W.workspace . W.current . windowset


main = do
  xmproc <- spawnPipe "xmobar /home/crow/.xmobar/xmobarrc "
  xmonad $ docks def
    { terminal = "alacritty"
    , modMask = mod1Mask
    , workspaces = myWorkspaces
    , borderWidth = 2
    , focusedBorderColor = "#FFFFFF"
    , normalBorderColor = "#000000"
    , startupHook = myStartupHook
    , manageHook = composeAll [manageDocks, manageHook def]
    , handleEventHook = serverModeEventHookCmd
                        <+> serverModeEventHook
                        <+> serverModeEventHookF "XMONAD_PRINT" (io . putStrLn)
                        <+> docksEventHook 
    , layoutHook = myLayoutHook
    , logHook = workspaceHistoryHook <+> myLogHook <+> dynamicLogWithPP xmobarPP 
        { ppOutput = hPutStrLn xmproc
        , ppCurrent = xmobarColor "#c3e88d" "" . wrap "[" "]" -- Current workspace in xmobar
        , ppVisible = xmobarColor "#c3e88d" ""                -- Visible but not current workspace
        , ppHidden = xmobarColor "#82AAFF" "" . wrap "*" ""   -- Hidden workspaces in xmobar
        , ppHiddenNoWindows = xmobarColor "#F07178" ""        -- Hidden workspaces (no windows)
        , ppTitle = xmobarColor "#d0d0d0" "" . shorten 60     -- Title of active window in xmobar
        , ppSep =  "<fc=#666666> | </fc>"                     -- Separators in xmobar
        , ppExtras = [windowCount]
        , ppOrder  = \(ws:l:t:ex) -> [ws,l]++ex++[t]
        }
    }
    `additionalKeys`
    [ ((0, xF86XK_AudioMute), spawn "pactl set-sink-mute @DEFAULT_SINK@ toggle")
    , ((0, xF86XK_AudioLowerVolume), spawn "pactl set-sink-volume @DEFAULT_SINK@ -10%")
    , ((0, xF86XK_AudioRaiseVolume), spawn "pactl set-sink-volume @DEFAULT_SINK@ +10%")
    , ((mod1Mask .|. shiftMask, xK_p), spawn ("j4-dmenu-desktop"))
    , ((mod1Mask, xK_m), withFocused minimizeWindow)
    , ((mod1Mask .|. shiftMask, xK_m), withLastMinimized maximizeWindowAndFocus)
    , ((mod1Mask, xK_b ), sendMessage ToggleStruts)
    ]
