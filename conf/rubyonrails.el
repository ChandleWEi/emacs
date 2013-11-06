;; ruby on rails ;;
;;(load-library "rdebug")

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))


(require 'grizzl)
 (projectile-global-mode)
 (setq projectile-enable-caching t)
 (setq projectile-completion-system 'grizzl)
 ;; Press Command-p for fuzzy find in project
 (global-set-key (kbd "C-x p") 'projectile-find-file)
 ;; Press Command-b for fuzzy switch buffer
 ;; (global-set-key (kbd "s-b") 'projectile-switch-to-buffer)


(require 'smartparens-config)
(require 'smartparens-ruby)
(smartparens-global-mode)
(show-smartparens-global-mode t)
(sp-with-modes '(rhtml-mode)
			   (sp-local-pair "<" ">")
			   (sp-local-pair "<%" "%>"))


(require 'flyspell)
(setq flyspell-issue-message-flg nil)
(add-hook 'enh-ruby-mode-hook
          (lambda () (flyspell-prog-mode)))

(add-hook 'web-mode-hook
          (lambda () (flyspell-prog-mode)))
;; flyspell mode breaks auto-complete mode without this.
(ac-flyspell-workaround)


(require 'highlight-indentation)
 (add-hook 'enh-ruby-mode-hook
           (lambda () (highlight-indentation-current-column-mode)))

 (add-hook 'coffee-mode-hook
           (lambda () (highlight-indentation-current-column-mode)))

;; yaml mode
;; (setq load-path (cons "/opt/emacs/extension/yaml-mode" load-path))
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-hook 'yaml-mode-hook
		  '(lambda ()
			 (define-key yaml-mode-map "\C-j" 'newline-and-indent)))


;; (require 'rhtml-mode)
;; (autoload 'rhtml-mode "rhtml-mode" "RHTML" t)

(add-hook 'ehn-ruby-mode-hook 'robe-mode)


;; (global-set-key (kbd "C-m") 'ruby-reindent-then-newline-and-indent )
(autoload 'enh-ruby-mode "enh-ruby-mode" "Ruby editing mode." t)
(setq auto-mode-alist  (cons '("\\.rake$" . enh-ruby-mode) auto-mode-alist))
(setq auto-mode-alist  (cons '("\\.rjs$" . enh-ruby-mode) auto-mode-alist))
(setq auto-mode-alist  (cons '("\\.rb$" . enh-ruby-mode) auto-mode-alist))
;; (setq auto-mode-alist  (cons '("\\.rhtml$" . html-mode) auto-mode-alist))

(add-to-list 'auto-mode-alist '("Capfile" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\(?:^\\|/\\)Rakefile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . enh-ruby-mode))




(setq enh-ruby-bounce-deep-indent t)
(setq enh-ruby-hanging-brace-indent-level 2)


;; (add-to-list 'auto-mode-alist '("\\.rhtml$" . rhtml-mode))
;; (add-to-list 'auto-mode-alist '("\\.rjs$" . rhtml-mode))
;; (add-to-list 'auto-mode-alist '("\\.html\.erb$" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))


(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))
;; 如果文件后缀名为.rb，但是脚本第一行有#!ruby,也用ruby模式
(setq interpreter-mode-alist (append '(("ruby" . enh-ruby-mode)) interpreter-mode-alist))
;; 调用inf-ruby
(autoload 'run-ruby "inf-ruby" "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby" "Set local key defs for inf-ruby in enh-ruby-mode")
(autoload 'rubydb "rubydb3x" "Ruby debugger" t)
(modify-coding-system-alist 'file "\\.rb$" 'utf-8)
;; (modify-coding-system-alist 'file "\\.rhtml$" 'utf-8)
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
  "Advise enh-ruby-mode to further indent continuation lines."
  (save-excursion
    (goto-char (point-at-bol))
    (skip-chars-backward " \t\n")
    (when (eq ?\\ (char-before))
      (setq ad-return-value (+ ruby-indent-level ad-return-value)))))

















(require 'cl) ; If you don't have it already

(defun* get-closest-gemfile-root (&optional (file "Gemfile"))
  "Determine the pathname of the first instance of FILE starting from the current directory towards root.
This may not do the correct thing in presence of links. If it does not find FILE, then it shall return the name
of FILE in the current directory, suitable for creation"
  (let ((root (expand-file-name "/"))) ; the win32 builds should translate this correctly
    (loop 
     for d = default-directory then (expand-file-name ".." d)
     if (file-exists-p (expand-file-name file d))
     return d
     if (equal d root)
     return nil)))

(require 'compile)

(defun rspec-compile-file ()
  (interactive)
  (compile (format "cd %s;bundle exec rspec %s"
                   (get-closest-gemfile-root)
                   (file-relative-name (buffer-file-name) (get-closest-gemfile-root))
                   ) t))

(defun rspec-compile-on-line ()
  (interactive)
  (compile (format "cd %s;bundle exec rspec %s -l %s"
                   (get-closest-gemfile-root)
                   (file-relative-name (buffer-file-name) (get-closest-gemfile-root))
                   (line-number-at-pos)
                   ) t))

(add-hook 'enh-ruby-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c l") 'rspec-compile-on-line)
            (local-set-key (kbd "C-c k") 'rspec-compile-file)
            ))

;; Add the Unit::Test output to the list of regexps understood by the
;; compile buffer
										;(add-to-list 'compilation-error-regexp-alist
										;'("\\(\\./[^:]*\\):\\([0-9]*\\)" 1 2))
;; (REGEXP FILE-IDX LINE-IDX
										;(setq compilation-error-regexp-alist (cdr compilation-error-regexp-alist))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(require 'snippet)
;;(require 'rails)


;; (add-hook 'enh-ruby-mode-hook
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
;;(require 'mmm-mode)
;;(require 'mmm-auto)
(setq mmm-global-mode 'maybe)
(setq mmm-submode-decoration-level 2)

;;(set-face-background 'mmm-output-submode-face  "#4D0000")
;;(set-face-background 'mmm-code-submode-face    "#9F5000")
;;(set-face-background 'mmm-code-submode-face    "#272727")
;;(set-face-background 'mmm-comment-submode-face "lightblue")
;;(set-face-background 'mmm-comment-submode-face "#6C3365")
;;(mmm-add-classes
;; '((erb-code
;;    :submode enh-ruby-mode
;;    :match-face (("<%#" . mmm-comment-submode-face)
;;                 ("<%=" . mmm-output-submode-face)
;;                 ("<%"  . mmm-code-submode-face))
;;    :front "<%[#=]?"
;;    :back "-?%>"
;;    :insert ((?% erb-code       nil @ "<%"  @ " " _ " " @ "%>" @)
;;             (?# erb-comment    nil @ "<%#" @ " " _ " " @ "%>" @)
;;             (?= erb-expression nil @ "<%=" @ " " _ " " @ "%>" @))
;;    )))
;; (add-hook 'rhtml-mode-hook
;;           (lambda ()
;;             (set (make-local-variable 'comment-auto-fill-only-comments) t)
;;             (setq mmm-classes '(erb-code))
;;             (mmm-mode-on)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Hide-show
;; (add-to-list 'hs-special-modes-alist
;; 			 (list 'enh-ruby-mode
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
;;                (modes  . '(enh-ruby-mode))))
;; (add-to-list 'align-rules-list
;;              '(ruby-hash-literal
;;                (regexp . "\\(\\s-*\\)=>\\s-*[^# \t\n]")
;;                (repeat . t)
;;                (modes  . '(enh-ruby-mode))))
