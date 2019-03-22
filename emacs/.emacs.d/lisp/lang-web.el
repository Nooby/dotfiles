;;; Commentary:
;;; Code:
(use-package web-mode
  :init
  (add-to-list 'auto-mode-alist '(".*\.js\'" . web-mode))
  (add-to-list 'auto-mode-alist '(".*\.html\'" . web-mode))
  (add-to-list 'auto-mode-alist '(".*\.jsx\'" . web-mode))
  :config
  (setq indent-tabs-mode nil
        js-indent-level 2
        js2-strict-missing-semi-warning nil
        web-mode-markup-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-code-indent-offset 2)

  ;; highlight enclosing tags of the element under cursor
  (setq web-mode-enable-current-element-highlight t)

  (defadvice web-mode-highlight-part (around tweak-jsx activate)
    (if (equal web-mode-content-type "jsx")
        (let ((web-mode-enable-part-face nil))
          ad-do-it)
      ad-do-it))

  (defun jsx-flycheck ()
    (when (equal web-mode-content-type "jsx")
      ;; enable flycheck
      (flycheck-select-checker 'jsxhint-checker)
      (flycheck-mode)))

  (defun my-web-mode-hook ()
    "Hook for `web-mode' config for company-backends."
    (set (make-local-variable 'company-backends)
         '((company-tern company-css company-web-html company-files))))

  ;; Enable JavaScript completion between <script>...</script> etc.
  (defadvice company-tern (before web-mode-set-up-ac-sources activate)
    "Set `tern-mode' based on current language before running company-tern."
    (message "advice")
    (if (equal major-mode 'web-mode)
        (let ((web-mode-cur-language
               (web-mode-language-at-pos)))
          (if (or (string= web-mode-cur-language "javascript")
                  (string= web-mode-cur-language "jsx"))
              (unless tern-mode (tern-mode))
            (if tern-mode (tern-mode -1))))))

  (add-hook 'web-mode-hook 'jsx-flycheck)
  (add-hook 'web-mode-hook 'my-web-mode-hook)
  (add-hook 'web-mode-hook 'emmet-mode)
  (add-hook 'web-mode-hook 'company-mode))

;; editing enhancements for web-mode
;; https://github.com/jtkDvlp/web-mode-edit-element
(use-package web-mode-edit-element
  :config (add-hook 'web-mode-hook 'web-mode-edit-element-minor-mode))

;; snippets for HTML
;; https://github.com/smihica/emmet-mode
(use-package emmet-mode
  :init (setq emmet-move-cursor-between-quotes t) ;; default nil
  :diminish (emmet-mode . " e"))

;; to get completion for HTML stuff
;; https://github.com/osv/company-web
(use-package company-web)

;; configure CSS mode company backends
(use-package css-mode
  :config
  (defun my-css-mode-hook ()
    (set (make-local-variable 'company-backends)
         '((company-css company-dabbrev-code company-files))))
  (add-hook 'css-mode-hook 'my-css-mode-hook)
  (add-hook 'css-mode-hook 'company-mode))

;; impatient mode - Live refresh of web pages
;; https://github.com/skeeto/impatient-mode
(use-package impatient-mode
  :diminish (impatient-mode . " i")
  :commands (impatient-mode))

(provide 'lang-web)
;;; lang-web ends here
