;;; Environment variables
(add-to-list 'exec-path "~/Gentoo/usr/bin")

(setq exec-path (cons "~/Gentoo/usr/bin" exec-path))
(setenv "PATH" (concat "~/Gentoo/usr/bin:" (getenv "PATH")))

(setq exec-path (cons "/usr/local/bin" exec-path))
(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))

(setq exec-path (cons "/usr/local/go/bin" exec-path))
(setenv "PATH" (concat "/usr/local/go/bin:" (getenv "PATH")))


(setq exec-path (cons "/usr/bin" exec-path))
(setenv "PATH" (concat "/usr/bin:" (getenv "PATH")))

(setq exec-path (cons "/Library/Ruby/Gems/1.8/bin" exec-path))
(setenv "PATH" (concat "/Library/Ruby/Gems/1.8/bin:" (getenv "PATH")))

(setq exec-path (cons "/Applications/Emacs.app/Contents/MacOS/bin" exec-path))
(setenv "PATH" (concat "/Applications/Emacs.app/Contents/MacOS/bin:" (getenv "PATH")))


