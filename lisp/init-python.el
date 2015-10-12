(require 'dired-x)
(ensure-packages-installed '(python-mode
			     elpy))

(elpy-enable)

(add-hook 'elpy-mode-hook 
  (lambda ()
    (highlight-indentation-mode -1)))

(setq-default dired-omit-files-p t)
(setq dired-omit-files
      (concat dired-omit-files "\\.pyc$"))

(provide 'init-python)
