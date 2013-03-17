

(load "conf/env")
(load "conf/mac")
(load "conf/disabled")
(load "conf/conf")
(load "conf/elpa")
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
(add-hook 'before-save-hook 'gofmt-before-save)


;  (require 'google-translate)
  (global-set-key "\C-ct" 'google-translate-at-point)
  (global-set-key "\C-cT" 'google-translate-query-translate)




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
;(load "conf/auto-complete")
;(load "conf/cua")


;(load "conf/el-get")
