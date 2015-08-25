(ensure-package-installed 'web-mode)

;;(add-to-list 'auto-mode-alist '("\\.js$" . js-mode))
;;(add-hook 'js-mode-hook 'subword-mode)
;;(add-hook 'html-mode-hook 'subword-mode)
;;(setq js-indent-level 2)

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.tpl$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css$" . web-mode))

(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (progn
    (setq web-mode-markup-indent-offset 2)
    (setq web-mode-css-indent-offset 2)
    (setq web-mode-enable-current-element-highlight t))
)
(add-hook 'web-mode-hook  'my-web-mode-hook)

(provide 'init-web)
