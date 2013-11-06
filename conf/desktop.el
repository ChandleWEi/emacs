;;; desktop.el --- desktop-save

;; Copyright (C) 2011  Chandle Wei

;; Author: Chandle Wei <>
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
(desktop-save-mode 1)
(desktop-save-mode t)
(setq desktop-save-mode t)
;; (require 'maxframe)
;; (add-hook 'window-setup-hook 'maximize-frame t)


;; can't use for emacs 24
;; ;; ;; 窗口布局保存
;; (add-to-list 'load-path "~/.emacs.d/el-get/desktop-frame")
;; (load "desktop-frame")
;; ;;(require 'desktop-frame)
;; (add-hook 'desktop-save-hook
;;           (lambda ()
;;             (desktop-frame-save "~/.emacs.d")))
;; (desktop-save-mode)
;; (desktop-read)
;; ;; (load "~/.emacs.d/.framex")

;; ;;; desktop.el ends here


(defvar pre-ediff-window-configuration nil
  "window configuration to use")
(defvar new-ediff-frame-to-use nil
  "new frame for ediff to use")
(defun save-my-window-configuration ()
  (interactive)
  (setq pre-ediff-window-configuration (current-window-configuration))
  (select-frame-set-input-focus (setq new-ediff-frame-to-use (new-frame))))
(add-hook 'ediff-before-setup-hook 'save-my-window-configuration)
(defun restore-my-window-configuration ()
  (interactive)
  (when (framep new-ediff-frame-to-use)
(delete-frame new-ediff-frame-to-use)
(setq new-ediff-frame-to-use nil))
  (when (window-configuration-p pre-ediff-window-configuration
(set-window-configuration pre-ediff-window-configuration))))
(add-hook 'ediff-after-quit-hook-internal 'restore-my-window-configuration)
