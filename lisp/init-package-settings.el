(require 'package)

(add-to-list 'package-archives '("org". "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa". "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable". "http://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(setq package-enable-at-startup nil)

(when (not package-archive-contents)
  (package-refresh-contents))

(provide 'init-package-settings)
