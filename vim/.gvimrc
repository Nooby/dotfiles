
if has("gui_running")
  " Gvim
  if has("gui_gtk2") || has("gui_gtk3")
    " Linux GUI
    set guifont=Noto\ Mono\ for\ Powerline\ 15
  elseif has("gui_win32")
    " Win32/64 GVim
  elseif has("gui_macvim")
    " MacVim
    set guifont=NotoMonoForPowerline:h15
  else
    " Unknown GUI system!!!!
  endif
else
  " Terminal vim
endif
