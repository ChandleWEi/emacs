(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories
			 "~/.emacs.d/.cask/24.3.50.1/elpa/auto-complete-20130724.1750/dict")
(ac-config-default)
(setq ac-ignore-case nil)
(add-to-list 'ac-modes 'enh-ruby-mode)
(add-to-list 'ac-modes 'web-mode)

(global-set-key "\C-cd" 'dash-at-point)

(require 'expand-region)
(global-set-key (kbd "C-;") 'er/expand-region)

(require 'project-explorer)


(require 'yasnippet)
(yas-global-mode 1)

(load "conf/env")
(load "conf/mac")
(load "conf/disabled")
(load "conf/conf")

(load "conf/scratch")
(load "conf/ido")
(load "conf/fonts")
(load "conf/defuns")
(load "conf/template")
(load "conf/grep")
(load "conf/server-mode")
;;(load "conf/bookmark")
(load "conf/session")
;; for go language
(load "conf/auto-complete")
(add-hook 'before-save-hook 'gofmt-before-save)



(require 'google-translate)
(global-set-key "\C-ct" 'google-translate-at-point)
(global-set-key "\C-cT" 'google-translate-query-translate)

(smart-tabs-insinuate 'c 'javascript)
(smart-tabs-advice js2-indent-line js2-basic-offset)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(add-to-list 'auto-mode-alist '("\\.emacs\\'" . lisp-mode))
(add-to-list 'auto-mode-alist '("\\Cask\\'" . lisp-mode))

(load "conf/rubyonrails")

(load "conf/snippets")

;;always have bug so move to last
(load "conf/desktop")


;; never used
;;; have bug can't fix it
										;(load "conf/ri-emacs")
										;(load "conf/server-mode")
;;;(load "conf/tabs")
										;(load "conf/cucumber")
										;(load "conf/cc")
										;(load "conf/objc")

										;(load "conf/cua")


										;(load "conf/el-get")

;; (add-to-list 'load-path "/opt/slime/")  ; your SLIME directory
;; (setq inferior-lisp-program "/usr/local/bin/sbcl") ; your Lisp system
;; (require 'slime)
;; (slime-setup)

;; (global-set-key [f5] 'slime-js-reload)
;; (add-hook 'js2-mode-hook
;;           (lambda ()
;;             (slime-js-minor-mode 1)))
