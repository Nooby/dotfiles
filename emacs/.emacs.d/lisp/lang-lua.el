;;; lang-lua --- Lua Packages

;;; Commentary:
;;; Provide Lua Specific Packages

;;; Code:

(use-package lua-mode
  :config

  (use-package company-lua)

  (use-package flymake-lua))

(provide 'lang-lua)
;;; lang-lua.el ends here
