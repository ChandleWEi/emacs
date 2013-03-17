;; (require 'cl)
;; (require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

;; auto installed package
;; (when (not package-archive-contents)
;;   (package-refresh-contents))
 
;; ;; setting default package to be installed
;; (defvar my-default-packages '(ecb
;;                               yasnippet
;; 							  auto-complete
;;                               google-translate))
;; (dolist (p my-default-packages)
;;   (when (not (package-installed-p p))
;;     (package-install p)))
 
;; normal useful variable set
;; (setq dotfiles-dir "~/.emacs.d");;这个我是在.emacs.d/init.el里定义的
;; (setq autoload-file (concat dotfiles-dir "/loaddefs.el"))
;; (setq package-user-dir (concat dotfiles-dir "/elpa"))
;; (setq custom-file (concat dotfiles-dir "/custom.el"))
 
(provide 'elpa)
