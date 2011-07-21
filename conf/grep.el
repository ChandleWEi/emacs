;;; Grep is wicked

;; Grep/Find.  This needs some cleanup
;; 不搜索二进制文件 支持正则 like m\\wgit =~ magit
(setq grep-command "grep -Irine ")
;; 只在一个备份文件中寻找
(setq grep-find-command
      (format "%s . -type f \\( -name '*~' -o -name '*#' -o -name '*.log' -o -path '*CVS/*' -o -path '*.svn/*' -o -path '*.git/*' -o -path '*vendor/*' -o -path '*build/*' -prune -o -print0 \\) | xargs -0 %s"
              find-program grep-command))