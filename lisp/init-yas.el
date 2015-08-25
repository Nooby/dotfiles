(ensure-packages-installed '(yasnippet))

(require 'yasnippet)

(add-to-list 'yas/root-directory (expand-file-name "snippet" user-emacs-directory))
(require 'yasnippet)
(yas/initialize)
(yas-global-mode 1)

;;(global-set-key (kbd "<tab>") 'yas-next-field-or-maybe-expand)
(define-key yas-minor-mode-map (kbd "<M-tab>") 'yas-expand)

(provide 'init-yas)
