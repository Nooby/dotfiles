(require 'global-functions)

(ensure-packages-installed '(solarized-theme
			     powerline
			     powerline-evil))

(require 'powerline)
(powerline-default-theme)

;; Powerline Color Fix for Solarized
;; from https://github.com/jonathanchu/emacs-powerline/issues/11
(setq powerline-color1 "#073642")
(setq powerline-color2 "#002b36")

(set-face-attribute 'mode-line nil
                    :foreground "#fdf6e3"
                    :background "#2aa198"
                    :box nil)
(set-face-attribute 'mode-line-inactive nil
                    :box nil)

(provide 'init-visual)
