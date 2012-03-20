;;; el-get.el --- setup for el-get

;; Copyright (C) 2011  Chandle WEi

;; Author: Chandle WEi <Chandle.WEi@gmail.com>
;; Keywords: el-get
;;el-get

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

;; So the idea is that you copy/paste this code into your *scratch* buffer, ;; hit C-j, and you have a working developper edition of el-get.
(unless (require 'el-get nil t)
  (url-retrieve "https://raw.github.com/ChandleWEi/el-get/master/el-get-install.el"
				(lambda (s)
				  (let (el-get-master-branch)  (eval-print-last-sexp)
					   )
				  )
				)
  )

;;(el-get 'sync)
;;local sources

(setq el-get-sources
      '(package
		auto-complete
		auto-complete-clang
		ac-company
		desktop-frame
		(:name rvm              :type elpa)		
		(:name company          :type elpa)
		(:name ruby-mode        :type elpa)
		(:name ruby-electric    :type elpa)		
				 
		))

(setq my-packages
      (append
       '(cssh
		 clang-completion-mode
		 magit
		 android-mode
		 htmlize
		 rhtml-mode
		 haml-mode				 
		 ;;sass-mode		
		 coffee-mode	
		 maxframe
		 js2-mode
		 markdown-mode
		 textile-mode
		 rcodetools
		 ;; ruby set

		 rinari
		 ri-emacs
		 mmm-mode
		 yasnippet
;;		 yasnippet-rails
		 yaml-mode
		 ;; common set
		 header2
		 color-theme
		 color-theme-twilight
		 template
		 apache-mode
		 lua-mode
		 tabbar-mode
		 psvn
		 ;;session
		 bm
		 wcy-el
		 auto-complete-css
		 auto-complete-emacs-lisp
		 auto-complete-ruby
		 auto-complete-yasnippet
		 
		 )
       (mapcar 'el-get-source-name el-get-sources)))

(el-get 'sync my-packages)
;;(el-get 'sync el-get-sources)


;; (add-to-list 'load-path "~/.emacs.d/el-get/el-get") (require 'el-get)
;; ;; local sources
;; (setq el-get-sources '(
;; 		       (:name magit :after (lambda () (global-set-key (kbd "C-x C-z") 'magit-status)))
;; 		       (:name asciidoc :type elpa :after (lambda () (autoload 'doc-mode "doc-mode" nil t)
;; 		       (add-to-list 'auto-mode-alist '("\\.adoc$" . doc-mode)) (add-hook 'doc-mode-hook '(lambda () (turn-on-auto-fill) (require 'asciidoc))))) (:name lisppaste :type elpa)
;; (:name emacs-goodies-el :type apt-get)
;; ))
;; (setq my-packages (append '(cssh el-get switch-window vkill google-maps nxhtml xcscope yasnippet) (mapcar 'el-get-source-name el-get-sources))) (el-get 'sync my-packages)
