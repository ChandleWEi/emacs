;;; bookmark.el --- bookmark

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

;; add bookmark el
;; Make sure the repository is loaded as early as possible
(require 'bm)
(setq bm-restore-repository-on-load t)
(global-set-key (kbd "<M-f3>") 'bm-toggle)
(global-set-key (kbd "<f3>")   'bm-previous)
(global-set-key (kbd "<f4>")   'bm-next)
;; <f3> is used by kmacro-start-macro-or-insert-count
(global-set-key (kbd "<C-f3>") 'bm-show)
;; Loading the repository from file when on start up.
(add-hook' after-init-hook 'bm-repository-load)
;; Restoring bookmarks when on file find.
(add-hook 'find-file-hooks 'bm-buffer-restore)
;; Saving bookmark data on killing a buffer
(add-hook 'kill-buffer-hook 'bm-buffer-save)
;; Saving the repository to file when on exit.
;; kill-buffer-hook is not called when emacs is killed, so we
;; must save all bookmarks first.
(add-hook 'kill-emacs-hook '(lambda nil
							  (bm-buffer-save-all)
							  (bm-repository-save)))
;; Update bookmark repository when saving the file.
(add-hook 'after-save-hook 'bm-buffer-save)
;; Restore bookmarks when buffer is reverted.
(add-hook 'after-revert-hook 'bm-buffer-restore)


(provide 'bookmark)
;;; bookmark.el ends here
