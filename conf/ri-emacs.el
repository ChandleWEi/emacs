(autoload 'ri "ri-ruby" nil t)
(add-hook 'ruby-mode-hook
          (lambda ()
            (local-set-key [(f1)] 'ri)
;;             (local-set-key "\M-\C-i" 'ri-ruby-complete-symbol)
            (local-set-key [(meta f1)] 'ri-ruby-show-args)
            ))
