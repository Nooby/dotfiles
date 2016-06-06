(ensure-packages-installed '(projectile
							 go-projectile
							 helm-projectile))

(projectile-global-mode)
(require 'go-projectile)

(provide 'init-projectile)
