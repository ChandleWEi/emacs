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
(require 'auto-complete)
(require 'auto-complete-config)
(require 'ac-company)
(global-auto-complete-mode t)
;; ac-company 中设置 company-xcode 有效
(ac-company-define-source ac-source-company-xcode company-xcode)
;; 设定 objc-mode 中补全 ac-mode
(setq ac-modes (append ac-modes '(objc-mode)))
;; hook
(add-hook 'objc-mode-hook
         (lambda ()
           (define-key objc-mode-map (kbd "\t") 'ac-complete)
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


(provide 'auto-complete)
;;; auto-complete.el ends here
