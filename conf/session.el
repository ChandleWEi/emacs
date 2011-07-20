(add-to-list `load-path "~/.emacs.d/el-get/session")
(autoload 'session-jump-to-last-change "session" nil t)
(autoload 'session-initialize "session" nil t)
(eval-after-load "cus-load"
  '(progn (custom-add-load 'data 'session)
          (custom-add-load 'session 'session)))