(ensure-packages-installed '(python-mode
			     elpy))

(elpy-enable)

(add-hook 'elpy-mode-hook 
  (lambda ()
    (highlight-indentation-mode -1)))

(provide 'init-python)
