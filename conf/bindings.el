;; Keyboard macros
(global-set-key [(shift f4)] 'kmacro-start-macro-or-insert-counter)
;; (global-set-key [(f4)]    'kmacro-end-or-call-macro)  ;; already defined
(global-set-key [(control f9)] (lambda () (interactive) (magit-status default-directory)))

;; magit
;; (global-set-key (kbd "C-x C-z") 'magit-status)
;;
;;
;;
;;
;;
;;
;;
;;