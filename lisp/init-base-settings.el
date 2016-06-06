;;; Base_Settings --- Miscalenious settings
;;; Commentary:
;;; This File provides some Miscalenious Settings that don't need their own File.
;;; Code:
(defvar base-packages '(auto-complete
						guide-key
						smartparens
						helm
						yafolding))

(ensure-packages-installed base-packages)

;; Essential Settings
(setq inhibit-splash-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message t)

(unless (eq system-type 'darwin) ;; Kill the Menu bar on Non OSX Systems
    (menu-bar-mode -1)
)

(tool-bar-mode -1)
(when (boundp 'scroll-bar-mode)
  (scroll-bar-mode -1))
(show-paren-mode 1)
(fset 'yes-or-no-p 'y-or-n-p)
(setq create-lockfiles nil)

(setq indent-line-function 'insert-tab)
(setq indent-tabs-mode nil)
(setq tab-width 4)
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

;; Helm Init
(require 'helm)
(require 'helm-config)
;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t)
(helm-mode 1)

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

(add-hook 'prog-mode-hook
          (lambda () (yafolding-mode)))

(provide 'init-base-settings)
;;; init-base-settings.el ends here
