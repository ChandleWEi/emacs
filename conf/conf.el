(require 'ibuffer)
;; 窗口布局保存
;;(require 'desktop-frame)
(add-to-list 'load-path "~/.emacs.d/el-get/desktop-frame")
(load "desktop-frame")
(add-hook 'desktop-save-hook
          (lambda ()
            (desktop-frame-save "~/.emacs.d")))
(desktop-read)
(load "~/.emacs.d/.framex")


;; 书签文件的路径及文件名
(setq bookmark-save-flag t)
;; 自动保存/读取书签(setq default-fill-column 1000)
;; 为了使emacs和x11下的应用程序可以互相粘贴，从网上找了如下代码
(setq x-select-enable-clipboard t)
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)

(global-set-key (kbd "M-i") 'imenu)
;; 用当前缓冲中所定义的函数之类移动光标。imenu 自动的扫描所打开的文件，根据
;; 内容以及相应的模式判断那些可以作为索引项。打开一个已经写的差不多的 C 文件，
;; M-x imenu RET 试试。

(global-set-key (kbd "C-c C-o") 'occur)
;; occur 功能，列出当前 buffer 中匹配的行。如果你在 Emacs 阅读这篇说明，试试
;; M-x occur RET chunyu RET 和 C-u 2 M-x occur RET chunyu RET。

;; 设置有用的个人信息。这在很多地方有用。
(setq user-full-name "Chandle WEi")
(setq user-mail-address "Chandle.WEi@gmail.com")
;;让 dired 可以递归的拷贝和删除目
(setq dired-recursive-copies 'top)
(setq dired-recursive-deletes 'top)

;; 选择space而不是tab
(setq  indent-tabs-mode nil)
(set-default 'tab-width 4)
(setq tab-width 4)
;;;winner
;;;;; winner 可以恢复前一个窗口的布局。比较有用。
;; ctrl-c left `winner-undo; ctrl-c right `winner-redo
(winner-mode 1)
;;; 让emacs启动后变适合大小
;;; (setq default-frame-alist '((top . 0) (left . 640) (width . 68) (height . 28)))
;;; (setq initial-frame-alist '((top . 0) (left . 0) (width . 68) (height . 28)))

;; 高亮所在的行
;; (require 'hl-line)
;; or(hl-line-mode 1)
(global-hl-line-mode 1)
;; 标记 改变mark
;; (global-set-key (kbd "C-x <SPC>") 'set-mark-command)
;; (global-set-key "\C-cm" 'set-mark-command)
(global-set-key (kbd "C-<SPC>") 'nil)
(global-set-key (kbd "C-c <SPC>") 'set-mark-command)

;; 高亮中文到底么
(transient-mark-mode t)
;;禁用启动信息
(setq inhibit-startup-message t)
;;设置tab为4个空格的宽度，而不是原来的2
;; (setq default-tab-width 4)
(setq tab-width 4)
;;防止页面滚动时跳动
 (setq scroll-step 1
       scroll-margin 3
       scroll-conservatively 10000)
;; (add-hook 'text-mode-hook 'turn-on-auto-fill) 
;; 去除工具栏
;; (tool-bar-mode nil)
;; just for mac hide tool bar
;; Hide the tool bar
;; (tool-bar-mode -1)
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1)) 
;; 去掉滚动条
;; (scroll-bar-mode nil)
;; ;; just for mac hide scrool bar
;; (scroll-bar-mode -1)
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1)) 
;; 光标靠近鼠标指针时，让鼠标指针自动让开，别挡住视线。很好玩阿，这个功能
(mouse-avoidance-mode 'animate)
;; 在标题栏提示你目前在什么位置。
(setq frame-title-format
      '("Chandle[ " (buffer-file-name "%f \]"
				      (dired-directory dired-directory "%b \]"))))

;;设置kill-ring-max(我不知道怎么翻译这个词：)为200，以防不测：）
(setq kill-ring-max 200)
;;设置缺省模式是text，而不是基本模式
;; (setq default-major-mode 'text-mode)
(setq major-mode 'text-mode)

;;下面的这个设置可以让光标指到某个括号的时候显示与它匹配的括号
(show-paren-mode t)
(setq show-paren-style 'parentheses)
;; 语法高亮
(global-font-lock-mode t)
;; ibuffer is an advanced replacement for the `buffer-menu'

;; (setq ibuffer-formats '((mark modified read-only " " (name 16 16) " "
;;			      (size 6 -1 :right) " " (mode 16 16 :center)
;;			      " " (process 8 -1) " " filename)
;;			(mark " " (name 16 -1) " " filename))
;;       ibuffer-elide-long-columns t
;;       ibuffer-eliding-string "&")
;; shell,gdb退出后，自动关闭该buffer
(defun kill-buffer-on-exit (process state)
  (message "%s" state)
  (if (or
       (string-match "exited abnormally with code.*" state)
       (string-match "finished" state))
      (kill-buffer (current-buffer))))
;; 显示buffer列表
(global-set-key (kbd "C-x C-b") 'ibuffer)
;; 代码折叠
(load-library "hideshow")
(add-hook 'java-mode-hook 'hs-minor-mode)
(add-hook 'perl-mode-hook 'hs-minor-mode)
(add-hook 'php-mode-hook 'hs-minor-mode)
(add-hook 'ruby-mode-hook 'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
;; 隐藏块显示块
(global-set-key (kbd "C-c ll") 'hs-toggle-hiding)
(global-set-key (kbd "C-c ib") 'hs-hide-block)
(global-set-key (kbd "C-c ia") 'hs-hide-all)
(global-set-key (kbd "C-c sb") 'hs-show-block)
(global-set-key (kbd "C-c sa") 'hs-show-all)
;;show time
(setq display-time-day-and-date t)
(display-time)
;; 改变 Emacs 固执的要你回答 yes 的行为。按 y 或空格键表示 yes，n 表示 no。
(fset 'yes-or-no-p 'y-or-n-p)
;;备份最新的版本1次，理解同上
(setq kept-new-versions 1)
;;删掉不属于以上3中版本的版本
(setq delete-old-versions t)
;;设置备份文件的路径
;; (setq backup-directory-alist '(("." . "~/emacs_backups")))
(setq backup-directory-alist '((".*" . "~/.emacs.d/emacs_backups")))
;; change auto save file directory

;;备份设置方法，直接拷贝
(setq version-control t)
(setq kept-old-versions 2)
(setq kept-new-versions 5)
(setq delete-old-versions t)
(setq backup-by-copying t)
(setq backup-by-copying-when-linked t)
(setq backup-by-copying-when-mismatch t)

;; use backup directory
;;
(defconst use-backup-dir t)



;;这样就可以让M-x shell不再乱码了
(setq ansi-color-for-comint-mode t)
(customize-group 'ansi-colors)
;; 设置时间戳，标识出最后一次保存文件的时间。
(setq time-stamp-active t)
(setq time-stamp-warn-inactive t)
(setq time-stamp-format "%:y-%02m-%02d %3a %02H:%02M:%02S K.T")



(add-to-list 'load-path
	     "/opt/emacs/extension")
(desktop-save-mode 1)

;;; 自动关闭shell退出的buffer
(add-hook 'shell-mode-hook 'wcy-shell-mode-hook-func)
(defun wcy-shell-mode-hook-func  ()
  (set-process-sentinel (get-buffer-process (current-buffer))
			#'wcy-shell-mode-kill-buffer-on-exit)
  )
(defun wcy-shell-mode-kill-buffer-on-exit (process state)
  (message "%s" state)
  (if (or
       (string-match "exited abnormally with code.*" state)
       (string-match "finished" state))
      (kill-buffer (current-buffer))))

;; 允许设置大小写
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
;; 设置copy-line, copy-word, copy-paragraph 三个函数
(defun copy-line (&optional arg)
 "Save current line into Kill-Ring without mark the line"
 (interactive "P")
 (let ((beg (line-beginning-position))
	   (end (line-end-position arg)))
 (copy-region-as-kill beg end))
)


(defun copy-word (&optional arg)
 "Copy words at point"
 (interactive "P")
 (let ((beg (progn (if (looking-back "[a-zA-Z0-9]" 1) (backward-word 1)) (point)))
	   (end (progn (forward-word arg) (point))))
 (copy-region-as-kill beg end))
)


(defun copy-paragraph (&optional arg)
 "Copy paragraphes at point"
 (interactive "P")
 (let ((beg (progn (backward-paragraph 1) (point)))
	   (end (progn (forward-paragraph arg) (point))))
 (copy-region-as-kill beg end))
)
(global-set-key (kbd "C-c c w") 'copy-word)
(global-set-key (kbd "C-c c l") 'copy-line)
(global-set-key (kbd "C-c c p") 'copy-paragraph)


;; This should not be enabled by default; either you are activating it in
;; your .emacs or some mode you are using is activating it. Since it's
;; buffer-local, it is probably being set in a hook so it activates for
;; each new buffer.

;; But one thing I like to do is set comment-auto-fill-only-comments to t
;; so that auto-fill doesn't happen unless you're in comments. Of course,
;; if you set this globally it won't work in text-mode or other non-coding
;; modes that don't have any notion of comments, so I have this in my
;; coding hook:

(set (make-local-variable 'comment-auto-fill-only-comments) t)

