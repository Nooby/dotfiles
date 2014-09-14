(require 'package)
(add-to-list 'package-archives
       '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(defvar my-packages '(better-defaults
		      clojure-mode
		      clojure-test-mode
		      cider))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))
(load-theme 'solarized-dark t)
