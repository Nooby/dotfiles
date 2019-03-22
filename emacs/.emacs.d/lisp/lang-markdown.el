(use-package markdown-mode
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :config
  (custom-set-variables '(markdown-command "/usr/bin/pandoc")))

(use-package apib-mode
  :mode (("\\.apib\\'" . apib-mode))
  :config
  (custom-set-variables '(markdown-command "/usr/bin/pandoc")))

(provide 'lang-markdown)
