(require 'cl)

(defvar base-packages '(auto-complete
			guide-key
			smartparens))

(ensure-packages-installed base-packages)

;; Essential Settings
(setq inhibit-splash-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(when (boundp 'scroll-bar-mode)
  (scroll-bar-mode -1))
(show-paren-mode 1)
(fset 'yes-or-no-p 'y-or-n-p)
(setq create-lockfiles nil)

(setq indent-line-function 'insert-tab)
(setq indent-tabs-mode nil)
(setq tab-width 4)
(setq default-tab-width 4)
(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)
(setq tab-stop-list (number-sequence 4 120 4))
(setq tab-always-indent nil)

;; IDO Mode
(require 'ido)
(ido-mode t)

;; Backup Settings
(defvar backup-dir "~/.emacs.d/backups/")
(setq backup-directory-alist (list (cons "." backup-dir)))
(setq make-backup-files nil)
(setq-default highlight-symbol-idle-delay 1.5)

;; Smartparens Init
(require 'smartparens-config)
(smartparens-global-mode 1)

(defvar show-paren-delay 0
  "Delay (in seconds) before matching paren is highlighted.")

;; Guide Key Mode
(guide-key-mode 1)
(setq-default guide-key/guide-key-sequence t
              guide-key/idle-delay 0.5)

;; Autocomplete Init
;;(global-auto-complete-mode t)
(require 'auto-complete-config)
(ac-config-default)
(ac-set-trigger-key "TAB")
(ac-set-trigger-key "<tab>")
(setq-default ac-dwim nil)
(setq-default ac-use-menu-map t)
(define-key ac-menu-map (kbd "<backtab>") 'ac-previous)

(defadvice save-buffers-kill-emacs (around no-query-kill-emacs activate)
           (flet ((process-list ())) ad-do-it))

(defun no-dos-please-were-unixish ()
  (let ((coding-str (symbol-name buffer-file-coding-system)))
    (when (string-match "-dos$" coding-str)
      (setq coding-str
	    (concat (substring coding-str 0 (match-beginning 0)) "-unix"))
      (message "CODING: %s" coding-str)
	       (set-buffer-file-coding-system (intern coding-str)))))

(add-hook 'find-file-hooks 'no-dos-please-were-unixish)

(provide 'init-base-settings)
