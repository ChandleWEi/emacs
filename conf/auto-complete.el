;;; auto-complete.el --- auto-complete

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

;;auto-complete

;; (require 'auto-complete-config)

;; (ac-config-default)
;; ;;(require 'gccsense)
;; ;;(global-set-key "\257" (quote ac-complete-gccsense))
;; ;;(global-set-key (kbd "M-/") 'ac-complete-gccsense)

;; ;;auto-complete-clang

;; (require 'auto-complete-clang)
;; (setq clang-completion-suppress-error 't)

;; (defun my-c-mode-common-hook()
;;   (setq ac-auto-start nil)
;;   (setq ac-expand-on-auto-complete nil)
;;   (setq ac-quick-help-delay 0.3)
;;   (define-key c-mode-base-map (kbd "M-/") 'ac-complete-clang)
;; )

;; (add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
(load "/opt/emacs/conf/go-autocomplete.el")
(require 'go-autocomplete)
(require 'auto-complete-config)

(require 'auto-complete)
;; (require 'ac-company)
;;(add-to-list 'load-path (concat myoptdir "AC"))
;; (add-to-list 'load-path "~/.emacs.d/el-get/auto-complete")
;; (require 'auto-complete-config)
;;(add-to-list 'ac-dictionary-directories (concat myoptdir "AC/ac-dict"))
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d/el-get/auto-complete/ac-dict")


;; (require 'auto-complete-clang)
;; (require 'auto-complete-ruby)
(setq clang-completion-suppress-error 't)


(setq ac-auto-start nil)
(setq ac-quick-help-delay 0.3)
(setq ac-expand-on-auto-complete nil)
;; (define-key c-mode-base-map (kbd "M-/") 'ac-complete-clang)
;; (define-key ruby-mode-map (kbd "M-/") 'ac-start)
;; (ac-set-trigger-key "TAB")
;; (define-key ac-mode-map  [(control tab)] 'auto-complete)
;;(define-key ac-mode-map  [(control tab)] 'auto-complete)
(defun my-ac-config ()
  (setq-default ac-sources '(ac-source-abbrev ac-source-dictionary ac-source-words-in-same-mode-buffers ac-source-yasnippet))
  (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)
  ;; (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
  (add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)
  (add-hook 'css-mode-hook 'ac-css-mode-setup)
  (add-hook 'auto-complete-mode-hook 'ac-common-setup)
  (global-auto-complete-mode t))

(defun my-ac-cc-mode-setup ()
  (setq ac-sources (append '(ac-source-clang ac-source-yasnippet) ac-sources)))

(add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)
;; ac-source-gtags
(my-ac-config)




(global-auto-complete-mode t)
;; ac-company 中设置 company-xcode 有效
;; (ac-company-define-source ac-source-company-xcode company-xcode)
;; 设定 objc-mode 中补全 ac-mode
(setq ac-modes (append ac-modes '(objc-mode)))
;; hook
(add-hook 'objc-mode-hook
         (lambda ()
           (define-key objc-mode-map (kbd "A-/") 'ac-complete)
           ;; 使用 XCode 的补全功能有效
           (push 'ac-source-company-xcode ac-sources)
           ;; C++ 关键词补全
           ;;(push 'ac-source-c++-keywords ac-sources)
         ))
;; 补全窗口中的热键
(define-key ac-completing-map (kbd "C-n") 'ac-next)
(define-key ac-completing-map (kbd "C-p") 'ac-previous)
(define-key ac-completing-map (kbd "M-/") 'ac-stop)
;; 是否自动启动补全功能
(setq ac-auto-start nil)
;; 启动热键
(ac-set-trigger-key "TAB")
;; 候補的最大件数（缺省 10件）
(setq ac-candidate-max 20)



;;; auto-complete.el ends here
