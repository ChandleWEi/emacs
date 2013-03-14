;;;  http://emacs-template.sourceforge.net/
;;; Template Package for Emacs
;;(template-initialize)
(define-auto-insert 'cperl-mode "TEMPLATE.pl.tpl")
(define-auto-insert 'sh-mode "TEMPLATE.sh.tpl")
(define-auto-insert 'ruby-mode "TEMPLATE.rb.tpl")
(add-hook 'find-file-hooks 'auto-insert)
