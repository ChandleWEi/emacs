;; (require 'cl)
;; (require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(package-initialize)

;; auto installed package
(when (not package-archive-contents)
  (package-refresh-contents))


(defun package-update-load-path ()
  "Update the load path for newly installed packages."
  (interactive)
  (let ((package-dir (expand-file-name package-user-dir)))
    (mapc (lambda (pkg)
            (let ((stem (symbol-name (car pkg)))
		  (version "")
		  (first t)
		  path)
	      (mapc (lambda (num)
		      (if first
			  (setq first nil)
			  (setq version (format "%s." version)))
		      (setq version (format "%s%s" version num)))
		    (aref (cdr pkg) 0))
              (setq path (format "%s/%s-%s" package-dir stem version))
              (add-to-list 'load-path path)))
          package-alist)))

 
;; ;; setting default package to be installed
;; (defvar my-default-packages '(ecb
;;                               yasnippet
;; 							  auto-complete
;;                               google-translate))
;; (dolist (p my-default-packages)
;;   (when (not (package-installed-p p))
;;     (package-install p)))
 
;; normal useful variable set
(setq dotfiles-dir "~/.emacs.d");;这个我是在.emacs.d/init.el里定义的
(setq autoload-file (concat dotfiles-dir "/loaddefs.el"))
(setq package-user-dir (concat dotfiles-dir "/elpa"))
(setq custom-file (concat dotfiles-dir "/custom.el"))
 
(provide 'elpa)
