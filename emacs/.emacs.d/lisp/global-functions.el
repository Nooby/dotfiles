;;; global-functions.el --- Provides functions used in the Emacs Configuration
;;; Commentary:

;;; Code:
(defun ensure-package-installed (pkg)
  "Ensures that Emacs Package PKG is installed or installes the Package."
  (when (not (package-installed-p pkg))
    (package-install pkg)))

(defun ensure-packages-installed (pkgs)
  "Ensures that the Emacs Packages in the list PKGS are installed."
  (dolist (p pkgs)
    (ensure-package-installed p)))

(provide 'global-functions)
;;; global-functions.el ends here
