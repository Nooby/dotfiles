
(use-package docker
  :bind ("C-c d" . docker)
  :diminish)

(use-package docker-compose-mode
  :mode "docker-compose.*\.yml\\'")

(use-package dockerfile-mode
  :mode "Dockerfile[a-zA-Z.-]*\\'")

(provide 'lang-docker)
;;; lang-docker ends here
