;; ruby on rails ;;
;;(load-library "rdebug")



;; yaml mode
;; (setq load-path (cons "/opt/emacs/extension/yaml-mode" load-path))
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-hook 'yaml-mode-hook
      '(lambda ()
        (define-key yaml-mode-map "\C-j" 'newline-and-indent)))


(require 'rhtml-mode)
(autoload 'rhtml-mode "rhtml-mode" "RHTML" t)

(global-set-key (kbd "C-m") 'ruby-reindent-then-newline-and-indent )
(autoload 'ruby-mode "ruby-mode" "Ruby editing mode." t)
(setq auto-mode-alist  (cons '("\\.rake$" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist  (cons '("\\.rjs$" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist  (cons '("\\.rb$" . ruby-mode) auto-mode-alist))
;; (setq auto-mode-alist  (cons '("\\.rhtml$" . html-mode) auto-mode-alist))
(add-to-list 'auto-mode-alist '("\\.rhtml$" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.html\.erb$" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\(?:^\\|/\\)Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))

;; 如果文件后缀名为.rb，但是脚本第一行有#!ruby,也用ruby模式
(setq interpreter-mode-alist (append '(("ruby" . ruby-mode)) interpreter-mode-alist))
;; 调用inf-ruby
(autoload 'run-ruby "inf-ruby" "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby" "Set local key defs for inf-ruby in ruby-mode")
(autoload 'rubydb "rubydb3x" "Ruby debugger" t)
(modify-coding-system-alist 'file "\\.rb$" 'utf-8)
(modify-coding-system-alist 'file "\\.rhtml$" 'utf-8)
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Like c-in-literal, only for Ruby
(defun ruby-in-literal ()
  (let* ((here (point))
         (state (save-excursion
                  (ruby-beginning-of-defun)
                  (parse-partial-sexp (point) here))))
    (or (nth 3 state)
        (nth 4 state)
        nil)))

;; Like c-electric-backspace, only for Ruby
(defun ruby-electric-backspace (arg)
  (interactive "*P")
  (if (or arg (ruby-in-literal))
      (backward-delete-char-untabify (prefix-numeric-value arg))
    (let ((here (point)))
      (skip-chars-backward " \t\n")
      (if (/= (point) here)
          (delete-region (point) here)
        (backward-delete-char-untabify 1)))))

(defun ruby-electric-delete (arg)
  (interactive "*P")
  (if (or arg (ruby-in-literal))
      (backward-delete-char-untabify (- (prefix-numeric-value arg)))
    (let ((here (point)))
      (skip-chars-forward " \t\n")
      (if (/= (point) here)
          (delete-region (point) here)
        (backward-delete-char-untabify -1)))))

;; Pipe the current buffer through mfp's xmpfilter
(defun ruby-annotate-buffer ()
  "Send the current current buffer to the annotation filter."
  (interactive "*")
  (let ((initial-line (count-lines (point-min) (point)))
        (initial-char (- (point) (point-at-bol))))
    (shell-command-on-region (point-min) (point-max) "xmpfilter.rb -a" nil t)
    (goto-line initial-line)
    (forward-char initial-char)))

;; Redefine this ruby-electric function so that we can use
;; ruby-electric-space w/o the minor mode (which doesn't play nice w/
;; multiple major modes).
(defun ruby-electric-code-at-point-p()
  (let* ((properties (text-properties-at (point))))
    (and (null (memq 'font-lock-string-face properties))
         (null (memq 'font-lock-comment-face properties)))))

;; Continuation lines should be indented.  Make it so, commander.
(defadvice ruby-calculate-indent
  (after ruby-indent-continuation-lines activate)
  "Advise ruby-mode to further indent continuation lines."
  (save-excursion
    (goto-char (point-at-bol))
    (skip-chars-backward " \t\n")
    (when (eq ?\\ (char-before))
      (setq ad-return-value (+ ruby-indent-level ad-return-value)))))

;; Add the Unit::Test output to the list of regexps understood by the
;; compile buffer
(add-to-list 'compilation-error-regexp-alist
             '("\\(\\./[^:]*\\):\\([0-9]*\\)" 1 2))
;; (REGEXP FILE-IDX LINE-IDX
										;(setq compilation-error-regexp-alist (cdr compilation-error-regexp-alist))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(require 'snippet)
;;(require 'rails)


;; (add-hook 'ruby-mode-hook
;;           (lambda()
;;             (add-hook 'local-write-file-hooks
;;                       '(lambda()
;;                          (save-excursion
;;                            (untabify (point-min) (point-max))
;;                            (delete-trailing-whitespace)
;;                            )))
;;             (set (make-local-variable 'comment-auto-fill-only-comments) t)
;;             (set (make-local-variable 'indent-tabs-mode) 'nil)
;; 			(set (make-local-variable 'tab-width) 4)
;;             (imenu-add-to-menubar "IMENU")
;;             (require 'ruby-electric)
;;             (ruby-electric-mode t)
										;(local-set-key 'f9 'ri)
										;(local-set-key "\M-\C-i" 'ri-ruby-complete-symbol)
										;(local-set-key 'f8 'ri-ruby-show-args)
;; )) 


;; mmm-mode setup
;; (setq load-path (cons "/opt/emacs/extension/mmm-mode" load-path))
(require 'mmm-mode)
(require 'mmm-auto)
(setq mmm-global-mode 'maybe)
(setq mmm-submode-decoration-level 2)

(set-face-background 'mmm-output-submode-face  "#4D0000")
(set-face-background 'mmm-code-submode-face    "#9F5000")
;;(set-face-background 'mmm-code-submode-face    "#272727")
;;(set-face-background 'mmm-comment-submode-face "lightblue")
(set-face-background 'mmm-comment-submode-face "#6C3365")
(mmm-add-classes
 '((erb-code
    :submode ruby-mode
    :match-face (("<%#" . mmm-comment-submode-face)
                 ("<%=" . mmm-output-submode-face)
                 ("<%"  . mmm-code-submode-face))
    :front "<%[#=]?"
    :back "-?%>"
    :insert ((?% erb-code       nil @ "<%"  @ " " _ " " @ "%>" @)
             (?# erb-comment    nil @ "<%#" @ " " _ " " @ "%>" @)
             (?= erb-expression nil @ "<%=" @ " " _ " " @ "%>" @))
    )))
(add-hook 'rhtml-mode-hook
          (lambda ()
            (set (make-local-variable 'comment-auto-fill-only-comments) t)
            (setq mmm-classes '(erb-code))
            (mmm-mode-on)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Hide-show
;; (add-to-list 'hs-special-modes-alist
;; 			 (list 'ruby-mode
;; 				   (concat "\\(^\\s-*"
;; 						   ruby-electric-simple-keywords-re
;; 						   "\\|{\\|\\[\\)")
;; 				   "end\\|\\]\\|}" "#"
;; 				   'ruby-forward-sexp nil))

;; Alignment
;; (add-to-list 'align-rules-list
;;              '(ruby-comma-delimiter
;;                (regexp . ",\\(\\s-*\\)[^# \t\n]")
;;                (repeat . t)
;;                (modes  . '(ruby-mode))))
;; (add-to-list 'align-rules-list
;;              '(ruby-hash-literal
;;                (regexp . "\\(\\s-*\\)=>\\s-*[^# \t\n]")
;;                (repeat . t)
;;                (modes  . '(ruby-mode))))
