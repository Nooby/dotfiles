(use-package origami
  :ensure t
  :config
  (global-origami-mode 1)
  (add-to-list 'origami-parser-alist '(web-mode . origami-c-style-parser)))

(use-package evil
  :ensure t
  :config
  (evil-mode 1)
  (setq-default evil-search-mode 'evil-search
                evil-want-C-u-scroll t
                evil-want-C-w-in-emacs-state t)
  (evil-define-key 'normal global-map (kbd "<down>")  'evil-next-visual-line)
  (evil-define-key 'normal global-map (kbd "<up>")    'evil-previous-visual-line)
  (define-key evil-normal-state-map (kbd "<tab>") 'origami-forward-toggle-node)
  (define-key evil-normal-state-map "za" 'origami-forward-toggle-node)
  (define-key evil-normal-state-map "zR" 'origami-close-all-nodes)
  (define-key evil-normal-state-map "zM" 'origami-open-all-nodes)
  (define-key evil-normal-state-map "zr" 'origami-close-node-recursively)
  (define-key evil-normal-state-map "zm" 'origami-open-node-recursively)
  (define-key evil-normal-state-map "zo" 'origami-show-node)
  (define-key evil-normal-state-map "zc" 'origami-close-node)
  (define-key evil-normal-state-map "zj" 'origami-forward-fold)
  (define-key evil-normal-state-map "zk" 'origami-previous-fold)

  (use-package evil-leader
    :ensure t
    :config
    (global-evil-leader-mode)
    (setq-default evil-leader/leader "<SPC>")
    (evil-leader/set-key
      "s" 'swiper
      "=" 'er/expand-region
      ":" 'eval-expression
      "o" 'project-find-file
      "cc" 'projectile-compile-project
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
      "ps" 'projectile-run-eshell
      "pff" 'projectile-find-file
      "pfo" 'projectile-find-file-dwim-other-frame)

    (evil-leader/set-key-for-mode 'go-mode
      "i" 'go-import-add
      "r" 'go-rename
      "dj" 'godef-jump
      "do" 'godef-jump-other-window
      "dd" 'godef-describe
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
      "gx" 'go-guru-expand-region)

    (evil-leader/set-key-for-mode 'python-mode
      "r"  'elpy-multiedit-python-symbol-at-point
      "gr" 'elpy-refactor
      "gf" 'elpy-find-file
      "gh" 'elpy-doc
      "gd" 'elpy-goto-definition
      "gi" 'elpy-importmagic-add-import))

  (use-package evil-surround
    :ensure t
    :config
    (global-evil-surround-mode 1))

  (use-package evil-matchit
    :ensure t
    :config
    (global-evil-matchit-mode 1))

  (use-package evil-magit
    :ensure t))

(provide 'base-evil)
