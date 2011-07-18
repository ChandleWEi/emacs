(defun insert-current_time ()
  (interactive)
  (insert (format-time-string "%Y-%m-%d %H:%M:%S" (current-time))))

(global-set-key (kbd "C-c i t") 'insert-current_time)
(global-set-key (kbd "C-c i r") "#!/usr/bin/env ruby")
;; 设置两边mark加上符号
(defun dwim-paren-region (arg leftp rightp)
  (if mark-active
    (save-excursion
      (let ((beg (min (point) (mark)))
            (end (max (point) (mark))))
        (goto-char beg)
        (insert leftp)
        (goto-char (1+ end))
        (insert rightp))
      )
    (insert arg)))


(global-set-key (kbd "\"") (lambda()(interactive)(dwim-paren-region "\"" "\"" "\"")))
(global-set-key (kbd "%") (lambda()(interactive)(dwim-paren-region "%" "<%" "%>")))
(global-set-key (kbd "(") (lambda()(interactive)(dwim-paren-region "(" "(" ")")))
(global-set-key (kbd ")") (lambda()(interactive)(dwim-paren-region ")" "(" ")")))
(global-set-key (kbd "{") (lambda()(interactive)(dwim-paren-region "{" "{" "}")))
(global-set-key (kbd "}") (lambda()(interactive)(dwim-paren-region "}" "{" "}")))
(global-set-key (kbd "[") (lambda()(interactive)(dwim-paren-region "[" "[" "]")))
(global-set-key (kbd "]") (lambda()(interactive)(dwim-paren-region "]" "[" "]")))
