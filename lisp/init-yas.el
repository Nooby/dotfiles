(ensure-packages-installed '(yasnippet))

(require 'yasnippet)

(add-to-list 'yas/root-directory (expand-file-name "snippet" user-emacs-directory))
(yas/initialize)
(yas-global-mode 1)

(provide 'init-yas)
