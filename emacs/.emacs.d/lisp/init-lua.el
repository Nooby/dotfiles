;;; Init-Lua -- Initialises the Lua Related Plugins
;;; Commentary:
;;; Installes Lua Mode and activates it for all *.lua files.
;;; Code:
(ensure-package-installed 'lua-mode)

(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

(provide 'init-lua)
;;; init-lua.el ends here
