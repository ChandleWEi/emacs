;;; cc.el --- just for self use c&&c++

;; Copyright (C) 2011  Chandle WEi

;; Author: Chandle WEi <Chandle.WEi@gmail.com>
;; Keywords: c

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

;;;; CC-mode配置

;http://cc-mode.sourceforge.net/
(require 'cc-mode)
;; (c-set-offset 'inline-open 0)
;; (c-set-offset 'friend '-)
;; (c-set-offset 'substatement-open 0)
'(compile-command "make")
;;;;我的C/C++语言编辑策略
 
(defun my-c-mode-common-hook()
  ;; (setq tab-width 4 indent-tabs-mode nil)
  ;; ;;; hungry-delete and auto-newline
  ;; (c-toggle-auto-hungry-state 1)
  ;; ;;按键定义
  ;; (define-key c-mode-base-map [(control \`)] 'hs-toggle-hiding)
  ;; (define-key c-mode-base-map [(return)] 'newline-and-indent)
  (define-key c-mode-base-map [(f7)] 'compile)
  ;; (define-key c-mode-base-map [(meta \`)] 'c-indent-command)
  ;;  (define-key c-mode-base-map [(tab)] 'hippie-expand)
  ;; (define-key c-mode-base-map [(tab)] 'my-indent-or-complete)
  ;; (define-key c-mode-base-map [(meta ?/)] 'semantic-ia-complete-symbol-menu)


;;预处理设置
;; (setq c-macro-shrink-window-flag t)
;; (setq c-macro-preprocessor "cpp")
;; (setq c-macro-cppflags " ")
;; (setq c-macro-prompt-flag t)
;; (setq hs-minor-mode t)
;; (setq abbrev-mode t)
)
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
 
;;;;我的C++语言编辑策略
(defun my-c++-mode-hook()
(setq tab-width 4 indent-tabs-mode nil)
(c-set-style "stroustrup")
;;  (define-key c++-mode-map [f3] 'replace-regexp)
)


(setq semanticdb-project-roots 
(list
(expand-file-name "/")))

;; (defun my-indent-or-complete ()
;;   (interactive)
;;   (if (looking-at "\\>")
;;       (hippie-expand nil)
;;     (indent-for-tab-command))
;;   )
 
;; (global-set-key [(control tab)] 'my-indent-or-complete)


(autoload 'senator-try-expand-semantic "senator")
 
(setq hippie-expand-try-functions-list
      '(
        senator-try-expand-semantic
        try-expand-dabbrev
        try-expand-dabbrev-visible
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-expand-list
        try-expand-list-all-buffers
        try-expand-line
        try-expand-line-all-buffers
        try-complete-file-name-partially
        try-complete-file-name
        try-expand-whole-kill
        )
      )

;; (define-key c-mode-base-map [(tab)] 'my-indent-or-complete)
(define-key c-mode-base-map [(meta ?/)] 'semantic-ia-complete-symbol-menu)


