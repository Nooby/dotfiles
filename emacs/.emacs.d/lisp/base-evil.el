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
	  "ms" 'magit-status
	  "mc" 'magit-commit
	  "mu" 'magit-pull
	  "mp" 'magit-push
	  "pp" 'counsel-projectile
	  "pa" 'projectile-ag
	  "ps" 'projectile-run-eshell)

	(evil-leader/set-key-for-mode 'go-mode
	  "i" 'go-import-add
	  "dj" 'godef-jump
	  "do" 'godef-jump-other-window
	  "dd" 'godef-describe
	  "gr" 'go-rename
	  "gd" 'go-guru-describe
	  "gf" 'go-guru-freevars
	  "gi" 'go-guru-implements
	  "gc" 'go-guru-peers  ; c for channel
	  "gr" 'go-guru-referrers
	  "gj" 'go-guru-definition ; j for jump
	  "gp" 'go-guru-pointsto
	  "gs" 'go-guru-callstack ; s for stack
	  "ge" 'go-guru-whicherrs ; e for error
	  "g<" 'go-guru-callers
	  "g>" 'go-guru-callees
	  "gx" 'go-guru-expand-region))

  (use-package evil-surround
	:config
	(global-evil-surround-mode 1))

  (use-package evil-matchit
	:config
	(global-evil-matchit-mode 1)))

(provide 'base-evil)
