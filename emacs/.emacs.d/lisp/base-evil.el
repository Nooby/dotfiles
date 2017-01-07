(use-package evil
  :config
  (evil-mode 1)
  (setq evil-search-mode 'evil-search
	evil-want-C-u-scroll t
	evil-want-C-w-in-emavs-state t)
  (evil-define-key 'normal global-map (kbd "<down>")  'evil-next-visual-line)
  (evil-define-key 'normal global-map (kbd "<up>")    'evil-previous-visual-line)

  (use-package evil-leader
    :config
    (global-evil-leader-mode)
    (setq evil-leader/leader "<SPC>")
	(evil-leader/set-key
	  "s" 'swiper
	  "=" 'er/expand-region
	  ":" 'eval-expression
	  "es" 'eval-last-sexp
	  "eb" 'eval-buffer
	  "er" 'eval-region
	  "ed" 'eval-defun
	  "gs" 'magit-status
	  "gc" 'magit-commit
	  "gu" 'magit-pull
	  "gp" 'magit-push
	  "pp" 'counsel-projectile
	  "pa" 'projectile-ag
	  "ps" 'projectile-run-eshell)

	(evil-leader/set-key-for-mode 'GO
	  "i" 'go-import-add
	  "dj" 'godef-jump
	  "do" 'godef-jump-other-window
	  "dd" 'godef-describe))

  (use-package evil-surround
	:config
	(global-evil-surround-mode 1))

  (use-package evil-matchit
	:config
	(global-evil-matchit-mode 1)))

(provide 'base-evil)
