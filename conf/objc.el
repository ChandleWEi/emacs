;;; objc.el --- setup for objective-c

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

;; for object-c
(add-to-list 'auto-mode-alist '("\\.m?$" . objc-mode))
(add-to-list 'auto-mode-alist '("\\.mm?$" . objc-mode))
(add-to-list 'auto-mode-alist '("\\.h$" . objc-mode))

(add-to-list 'magic-mode-alist '("\\(.\\|\n\\)*\n@implementation" . objc-mode))
(add-to-list 'magic-mode-alist '("\\(.\\|\n\\)*\n@interface" . objc-mode))
(add-to-list 'magic-mode-alist '("\\(.\\|\n\\)*\n@protocol" . objc-mode))
;; m文件和c文件之间进行切换
(setq ff-other-file-alist
	  '(("\\.mm?$" (".h"))
		("\\.cc$"  (".hh" ".h"))
		("\\.hh$"  (".cc" ".C"))

		("\\.c$"   (".h"))
		("\\.h$"   (".c" ".cc" ".C" ".CC" ".cxx" ".cpp" ".m" ".mm"))

		("\\.C$"   (".H"  ".hh" ".h"))
		("\\.H$"   (".C"  ".CC"))

		("\\.CC$"  (".HH" ".H"  ".hh" ".h"))
		("\\.HH$"  (".CC"))

		("\\.cxx$" (".hh" ".h"))
		("\\.cpp$" (".hpp" ".hh" ".h"))

		("\\.hpp$" (".cpp" ".c"))))
(add-hook 'objc-mode-hook
		  (lambda ()
			(define-key c-mode-base-map (kbd "C-c o") 'ff-find-other-file)
			))



(provide 'objc)
;;; objc.el ends here
