(ensure-package-installed 'flycheck)

(add-hook 'after-init-hook #'global-flycheck-mode)

(provide 'init-flycheck)
