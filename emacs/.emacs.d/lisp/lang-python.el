;;; package --- python configs
;;; Commentary:
;;; Contains my python configs

;;; Code:

(use-package python
  :mode ("\\.py" . python-mode)
  :config
  (use-package elpy
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
  (elpy-enable))

(use-package pip-requirements
  :config
  (add-hook 'pip-requirements-mode-hook #'pip-requirements-auto-complete-setup))

(use-package py-autopep8)

(provide 'lang-python)
;;; base-python.el ends here
