;; 设置snippet的位置
(setq yas/root-directory "~/.emacs.d/el-get/yasnippet/snippets")
;; 不要菜单
(setq yas/use-menu nil)
;; 初始化
(yas/initialize)
(yas/load-directory yas/root-directory)


;; 设置复数的 snippets 路径
(setq yas/root-directory '("~/.emacs.d/el-get/yasnippet/snippets"
                           "~/.emacs.d/el-get/xcode-snippets"))
(mapc 'yas/load-directory yas/root-directory)

