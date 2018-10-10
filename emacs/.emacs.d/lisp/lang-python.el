;;; package --- python configs
;;; Commentary:
;;; Contains my python configs

;;; Code:

(use-package python
  :ensure t
  :mode ("\\.py" . python-mode)
  :config
  (use-package pyenv-mode-auto
    :ensure t)
  (use-package elpy
    :ensure t
    :init
    (add-to-list 'auto-mode-alist '("\\.py$" . python-mode))
    :config
    (setq elpy-default-minor-modes '(elpy-module-company
                                     elpy-module-eldoc
                                     elpy-module-flymake
                                     elpy-module-pyvenv
                                     elpy-module-yasnippet
                                     elpy-module-django
                                     elpy-module-sane-defaults)) ;; Removed highlight-indentation
    (setq elpy-rpc-backend "jedi")
    ;; (add-hook 'python-mode-hook 'py-autopep8-enable-on-save)
    ;;flycheck-python-flake8-executable "/usr/local/bin/flake8"
    :bind (:map elpy-mode-map
	      ("M-." . elpy-goto-definition)
	      ("M-," . pop-tag-mark)))
  (require 'pyenv-mode-auto)
  (elpy-enable)
  (add-hook 'find-file-hook 'auto-activate-pyenv-hook))

(defun auto-activate-pyenv-hook ()
  "Automatically activates pyenv version if .python-version file exists."
  (f-traverse-upwards
   (lambda (path)
     (let ((pyenv-version-path (f-expand ".python-version" path)))
       (if (f-exists? pyenv-version-path)
           (let ((pyenv-venv (s-trim (f-read-text pyenv-version-path 'utf-8))))
             (pyenv-mode-set pyenv-venv)
             (pyvenv-activate (f-expand pyenv-venv "~/.pyenv/versions"))))))))


(use-package pip-requirements
  :ensure t
  :config
  (add-hook 'pip-requirements-mode-hook #'pip-requirements-auto-complete-setup))

(provide 'lang-python)
;;; base-python.el ends here
