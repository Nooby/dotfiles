;;; lang-lua --- Lua Packages

;;; Commentary:
;;; Provide Lua Specific Packages

;;; Code:

(use-package lua-mode
  :ensure t
  :config

  (use-package company-lua
	:ensure t)

  (use-package flymake-lua
	:ensure t))

(provide 'lang-lua)
;;; lang-lua.el ends here
