(ensure-packages-installed '(go-mode
			     go-autocomplete
			     go-eldoc))

(require 'go-mode)
(require 'go-autocomplete)
(require 'go-eldoc)

;;(setenv "GOPATH" "/home/nooby/go/.vendor:/home/nooby/go")
;;(setenv "GOPATH" (getenv "GOPATH"))
(setenv "GOPATH" "/home/nooby/go/.vendor:/home/nooby/go:/home/nooby/Projects")

(add-hook 'go-mode-hook
	  (lambda ()
	    (add-to-list 'ac-sources 'ac-source-go)
	    (go-eldoc-setup)))

(defun go-run-buffer()
  (interactive)
  (shell-command (concat "go run " (buffer-name))))

(define-key go-mode-map (kbd "C-c C-c") 'go-run-buffer)
(define-key go-mode-map (kbd "C-c C-f") 'gofmt)
(define-key go-mode-map (kbd "C-c C-d") 'godoc)
(define-key go-mode-map (kbd "C-c C-a") 'go-import-add)
(define-key go-mode-map (kbd "C-8") 'godef-jump)
(define-key go-mode-map (kbd "C-u C-8") 'godef-jump-other-window)
(define-key go-mode-map (kbd "C-k") 'go-kill)
(define-key go-mode-map (kbd "M-o") 'go-backward-delete)

(provide 'init-golang)
