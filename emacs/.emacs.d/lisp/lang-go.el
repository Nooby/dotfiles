(use-package go-mode
  :config
  (add-hook 'go-mode-hook 'company-mode)
  ;; Call Gofmt before saving
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save)
  (add-hook 'go-mode-hook 'setup-go-mode-compile)
  (add-hook 'go-mode-hook #'smartparens-mode)
  (add-hook 'go-mode-hook '(lambda ()
			     (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))
  (add-hook 'go-mode-hook '(lambda ()
			     (local-set-key (kbd "C-c C-g") 'go-goto-imports)))
  (add-hook 'go-mode-hook (lambda ()
			    (set (make-local-variable 'company-backends) '(company-go))
			    (company-mode))))

(use-package go-rename)

(use-package flycheck-gometalinter
  :config
  (progn
    (flycheck-gometalinter-setup)
    (setq flycheck-gometalinter-disable-linters '("gotype"))
    ;;(setq flycheck-gometalinter-fast t)
    ))

(use-package go-guru
  :after go-mode
  :config
  (add-hook 'go-mode-hook #'go-guru-hl-identifier-mode))

(use-package company-go
  :after go-mode
  :config
  (setq tab-width 4)

  :bind (:map go-mode-map
  ; Godef jump key binding
  '("M-." . godef-jump)))

(use-package go-eldoc
  :config
  (add-hook 'go-mode-hook 'go-eldoc-setup))

(defun setup-go-mode-compile ()
  ; Customize compile command to run go build
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go build -v && go test -v ./... && go vet")))

(provide 'lang-go)
