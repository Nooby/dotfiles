
(defun ensure-package-installed (pkg)
  (when (not (package-installed-p pkg))
    (package-install pkg)))

(defun ensure-packages-installed (pkgs)
  (dolist (p pkgs)
    (ensure-package-installed p)))

(provide 'global-functions)
