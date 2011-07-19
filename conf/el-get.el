;;; el-get.el --- setup for el-get

;; Copyright (C) 2011  Chandle WEi

;; Author: Chandle WEi <Chandle.WEi@gmail.com>
;; Keywords: el-get
;;el-get

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil t)
  (url-retrieve
   "https://github.com/ChandleWEi/el-get/raw/master/el-get-install.el"
   (lambda (s)
	 (end-of-buffer)
	 (eval-print-last-sexp))))
;;(el-get 'sync)
;;local sources

(setq el-get-sources
	  '(package
	    auto-complete
	    auto-complete-clang		
		ac-company
	    (:name rvm              :type elpa)		
	    (:name company          :type elpa)
	    (:name emacs-goodies-el :type elpa)
		))

(setq my-packages
 	  (append
 	   '(cssh
		 diff-git
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
		 ruby-mode
		 ruby-electric
		 rinari
		 ri-emacs
		 mmm-mode
		 yasnippet
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
		 )
 	   (mapcar 'el-get-source-name el-get-sources)))

(el-get 'sync my-packages)
;;(el-get 'sync el-get-sources)
