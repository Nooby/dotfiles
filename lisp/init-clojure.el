(ensure-packages-installed '(clojure-mode
			     cider))

(add-hook 'clojure-mode-hook 'subword-mode)

(require 'clojure-mode)

(add-hook 'clojure-mode-hook
	  (lambda ()
	    (setq inferior-lisp-program "lein repl")
	    (define-clojure-indent (fact 1))
	    (define-clojure-indent (facts 1))))

(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)

(add-hook 'cider-repl-mode-hook
	  (lambda ()
	    (auto-composition-mode t)))

(setq cider-repl-pop-to-buffer-on-connect t)

(add-to-list 'auto-mode-alist '("\\.edn$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.boot$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.cljs.*$" . clojure-mode))

(provide 'init-clojure)
