;;; init --- Emacs Main Configuration file
;;; Commentary:

;;; Code:
(package-initialize)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'global-functions)
(require 'init-package-settings)
(require 'init-base-settings)
(require 'init-visual)
(require 'init-evil)
(require 'init-projectile)
(require 'init-yas)
(require 'init-flycheck)
(require 'init-lisp)
(require 'init-python)
(require 'init-clojure)
(require 'init-web)
(require 'init-golang)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(provide 'init)
;;; init.el ends here
