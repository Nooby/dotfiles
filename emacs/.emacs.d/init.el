;;; package --- Main init file
;;; Commentary:
;;; This is my init file

;;; Code:

(add-to-list 'load-path (concat user-emacs-directory "lisp"))

(require 'base)
(require 'base-theme)
(require 'base-extensions)
(require 'base-functions)
(require 'base-global-keys)
(require 'base-evil)

(require 'lang-python)

(require 'lang-go)

(require 'lang-web)

(require 'lang-c)

(provide 'init)
;;; init.el ends here
