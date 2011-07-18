;;; abandoned.el --- abandoned file

;; Copyright (C) 2011  Chandle WEi

;; Author: Chandle WEi <Chandle.WEi@gmail.com>
;; Keywords: abbrev

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; 

;;; Code:

;; 自动加载 emacs-w3m
;; (autoload 'w3m "w3m" "Interface for w3m on Emacs." t)
;; (require 'xcode-document-viewer)
;; (setq xcdoc:document-path "/Developer/Platforms/iPhoneOS.platform/Developer/Documentation/DocSets/com.apple.adc.documentation.AppleiOS4_3.iOSLibrary.docset")
;; (setq xcdoc:open-w3m-other-buffer t)
;; (add-hook 'objc-mode-hook
;;          (lambda ()
;;             ;; 用 C-c w 来检索文档
;;             (define-key objc-mode-map (kbd "C-c w") 'xcdoc:ask-search)))


;; (ffap-bindings)
;; ;; 设定搜索的路径 ffap-c-path
;; ;; (setq ffap-c-path
;; ;;     '("/usr/include" "/usr/local/include"))
;; ;; 如果是新文件要确认
;; (setq ffap-newfile-prompt t)
;; ;; ffap-kpathsea-expand-path 展开路径的深度
;; (setq ffap-kpathsea-depth 5)


;; (require 'flymake)
;; (defvar xcode:gccver "4.2")
;; (defvar xcode:sdkver "4.3")
;; (defvar xcode:sdkpath "/Developer/Platforms/iPhoneSimulator.platform/Developer")
;; (defvar xcode:sdk (concat xcode:sdkpath "/SDKs/iPhoneSimulator" xcode:sdkver ".sdk"))
;; (defvar flymake-objc-compiler (concat xcode:sdkpath "/usr/bin/llvm-gcc-" xcode:gccver))
;; (defvar flymake-objc-compile-default-options (list "-Wall" "-Wextra" "-fsyntax-only" "-ObjC" "-std=c99" "-isysroot" xcode:sdk))
;; (defvar flymake-last-position nil)
;; (defvar flymake-objc-compile-options '("-I."))
;; (defun flymake-objc-init ()
;;   (let* ((temp-file (flymake-init-create-temp-buffer-copy
;;                     'flymake-create-temp-inplace))
;;          (local-file (file-relative-name
;;                      temp-file
;;                      (file-name-directory buffer-file-name))))
;;     (list flymake-objc-compiler (append flymake-objc-compile-default-options flymake-objc-compile-options (list local-file)))))

;; (add-hook 'objc-mode-hook
;;          (lambda ()
;;            (push '("\\.m$" flymake-objc-init) flymake-allowed-file-name-masks)
;;            (push '("\\.h$" flymake-objc-init) flymake-allowed-file-name-masks)
;;            (if (and (not (null buffer-file-name)) (file-writable-p buffer-file-name))
;;                (flymake-mode t))
;;          ))


;; (defun flymake-display-err-minibuffer ()
;;   "改行有 error 或 warinig 显示在 minibuffer"
;;   (interactive)
;;   (let* ((line-no (flymake-current-line-no))
;;          (line-err-info-list (nth 0 (flymake-find-err-info flymake-err-info line-no)))
;;          (count (length line-err-info-list)))
;;     (while (> count 0)
;;       (when line-err-info-list
;;         (let* ((file (flymake-ler-file (nth (1- count) line-err-info-list)))
;;                (full-file (flymake-ler-full-file (nth (1- count) line-err-info-list)))
;;                (text (flymake-ler-text (nth (1- count) line-err-info-list)))
;;                (line (flymake-ler-line (nth (1- count) line-err-info-list))))
;;           (message "[%s] %s" line text)))
;;       (setq count (1- count)))))

;; (defadvice flymake-goto-next-error (after display-message activate compile)
;;   "下一个错误"
;;   (flymake-display-err-minibuffer))

;; (defadvice flymake-goto-prev-error (after display-message activate compile)
;;   "前一个错误"
;;   (flymake-display-err-minibuffer))

;; (defadvice flymake-mode (before post-command-stuff activate compile)
;;   "为了将问题行自动显示到 minibuffer 中，添加 post command hook "
;;   (set (make-local-variable 'post-command-hook)
;;        (add-hook 'post-command-hook 'flymake-display-err-minibuffer)))

;; ;; post-command-hook 与 anything.el 有冲突时使用
;; (define-key global-map (kbd "C-c d") 'flymake-display-err-minibuffer)

;; ;; 你可以把 flymake-goto-next-error 与 flymake-goto-prev-error 分配到自己喜欢的快捷键上。另外像下面给错误附上颜色，便于区分。

;; (set-face-background 'flymake-errline "red")
;; (set-face-background 'flymake-warnline "yellow")

;; (load-file "/opt/emacs/setup/org-mode.elc")

;; rinari for rhtml
;;(add-to-list 'load-path "/opt/emacs/extension/rinari")
;;(add-to-list 'load-path "/opt/emacs/extension/rinari/rhtml")
;;(require 'rinari)
;; (custom-set-faces
;;   ;; custom-set-faces was added by Custom.
;;   ;; If you edit it by hand, you could mess it up, so be careful.
;;   ;; Your init file should contain only one such instance.
;;   ;; If there is more than one, they won't work right.

;; '(flymake-errline ((((class color)) (:background "DarkRed"))))
;; '(flymake-warnline ((((class color)) (:background "DarkBlue")))))

;; (custom-set-variables
;;   ;; custom-set-variables was added by Custom.
;;   ;; If you edit it by hand, you could mess it up, so be careful.
;;   ;; Your init file should contain only one such instance.
;;   ;; If there is more than one, they won't work right.
;;  '(org-agenda-custom-commands (quote (("d" todo "DELEGATED" nil) ("c" todo "DONE|DEFERRED|CANCELLED" nil) ("w" todo "WAITING" nil) ("W" agenda "" ((org-agenda-ndays 21))) ("A" agenda "" ((org-agenda-skip-function (lambda nil (org-agenda-skip-entry-if (quote notregexp) "\\=.*\\[#A\\]"))) (org-agenda-ndays 1) (org-agenda-overriding-header "Today's Priority #A tasks: "))) ("u" alltodo "" ((org-agenda-skip-function (lambda nil (org-agenda-skip-entry-if (quote scheduled) (quote deadline) (quote regexp) "<[^>
;; ]+>"))) (org-agenda-overriding-header "Unscheduled TODO entries: "))))))
;;  '(org-agenda-files nil)
;;  '(org-agenda-ndays 7)
;;  '(org-agenda-show-all-dates t)
;;  '(org-agenda-skip-deadline-if-done t)
;;  '(org-agenda-skip-scheduled-if-done t)
;;  '(org-agenda-start-on-weekday nil)
;;  '(org-deadline-warning-days 14)
;;  '(org-default-notes-file "/Users/chandle/.org/notes.org")
;;  '(org-fast-tag-selection-single-key (quote expert))
;;  '(org-remember-store-without-prompt t)
;;  '(org-remember-templates (quote ((116 "* TODO %?
;;   %u" "/Users/chandle/.org/todo.org" "Tasks") (110 "* %u %?" "/Users/chandle/.org/notes.org" "Notes"))))
;;  '(org-reverse-note-order t)
;;  '(remember-annotation-functions (quote (org-remember-annotation)))
;;  '(remember-handler-functions (quote (org-remember-handler)))
;;  '(safe-local-variable-values (quote ((eval whitespace-mode) (eval set-face-attribute (quote whitespace-line) nil :background "red1" :foreground "yellow" :weight (quote bold)) (eval set-face-attribute (quote whitespace-tab) nil :background "red1" :foreground "yellow" :weight (quote bold)) (whitespace-style face trailing lines-tail) (whitespace-line-column . 80) (eval require (quote whitespace))))))
;;color
;; (add-to-list 'load-path "/opt/emacs/extension/color-theme")
;; (load-file "/opt/emacs/extension/color-theme/color-theme.elc")
;; (load-file "/opt/emacs/extension/color-theme/themes/color-theme-library.elc")
;; ;(load-file "/opt/emacs/extension/color-theme/themes/color-theme-chandlewei.elc")
;; (load-file "/opt/emacs/extension/color-theme/themes/color-theme-twilight.elc")
;; (require 'color-theme)
;; (color-theme-twilight)
;;(color-theme-chandlewei)
;;开启图片浏览
;; (require 'thumbs)
;; (auto-image-file-mode t)

;; cscope mode for c
;;;(require 'xcscope)
;;;(setq cscope-do-not-update-database t)
;; w3m mode
;; (setq load-path (cons "/opt/emacs/extension/w3m/" load-path))
;; (require 'w3m)
;; save desktop environment
;; 窗口布局保存
;; (load "desktop-frame")
;; (add-hook 'desktop-save-hook
;;           (lambda ()
;;             (desktop-frame-save "/Users/chandle")))
;; (desktop-read)
;; (load "/Users/chandle/.framex")

;; session的使用
;; session扩展包可以使Emacs保存每次编辑的一些历史记录, 这样, 在下次打开Emacs时就可以使用上下键在以前输入的信息中选取, 十分方便实用.
;; tramp ramp的原理是使用标准的协议ftp, rsync, smb等直接获取和保存文件, 使用ssh, telnet, rsh等加上uuencode, uudecode等一些编码解码程序对文件进行 获取和保存
;; for Emacs
;; (require 'tramp)
;; (setq tramp-default-method "ssh")
;; (setq tramp-default-user "root")
;; very cool for new snippety
;; (add-to-list 'load-path "/opt/emacs/extension/yasnippet")
;; (require 'yasnippet);;not yasnippet-bundle
;; (yas/initialize)
;; (yas/load-directory "/opt/emacs/extension/yasnippet/snippets")

;; (auto-composition-model)












;; ;;(require 'magit)
;; (require 'anything)
;; (require 'anything-config)
;; (require 'anything-rcodetools)









;; (put 'set-goal-column 'disabled nil)
;; (load-file "/opt/emacs/setup/tmp/cc.el")

;; test
(global-set-key [(shift f4)] 'kmacro-start-macro-or-insert-counter)

(provide 'abandoned)
;;; abandoned.el ends here


