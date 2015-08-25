(ensure-packages-installed '(go-mode
                             go-autocomplete
                             go-eldoc
                             flymake-go))
(require 'go-mode)
(require 'flymake-go)
(require 'go-autocomplete)
(require 'go-eldoc)

(defun go-run-buffer()
  (interactive)
  (shell-command (concat "go run " (buffer-name))))

(add-hook 'go-mode-hook
          (lambda ()
            (flymake-mode 1)
            (auto-complete-mode 1)
            (add-to-list 'ac-sources 'ac-source-go)
            (go-eldoc-setup)
            (call-process "gocode" nil nil nil "-s")))

(define-key go-mode-map (kbd "C-c C-c") 'go-run-buffer)
(define-key go-mode-map (kbd "C-c C-f") 'gofmt)
(define-key go-mode-map (kbd "C-c C-d") 'godoc)
(define-key go-mode-map (kbd "C-c C-a") 'go-import-add)
(define-key go-mode-map (kbd "C-8") 'godef-jump)
(define-key go-mode-map (kbd "C-u C-8") 'godef-jump-other-window)
(define-key go-mode-map (kbd "C-k") 'go-kill)
(define-key go-mode-map (kbd "M-o") 'go-backward-delete)

(provide 'init-golang)
