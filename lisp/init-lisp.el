(ensure-package-installed 'slime)

(setq inferior-lisp-program "/usr/bin/sbcl")

(defun slime-tab ()
    "slime-mode tab dwim, either indent, complete symbol or yas/expand"
    (interactive)
    (let ((r (slime-indent-and-complete-symbol)))
    (unless r
	(yas/expand))))

(defun my-slime-mode-hook ()
    (interactive)
    (slime-setup '(slime-fancy))
    (define-key slime-mode-map (kbd "<C-return>") 'slime-eval-defun))

(add-hook 'slime-mode-hook 'my-slime-mode-hook)

(defun my-emacs-lisp-mode-hook ()
  (interactive)
  (turn-on-eldoc-mode)
  (ac-emacs-lisp-mode-setup))

(add-hook 'emacs-lisp-mode-hook 'my-emacs-lisp-mode-hook)

(provide 'init-lisp)
