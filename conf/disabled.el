;; disable vc-git
(eval-after-load "vc" '(remove-hook 'find-file-hooks 'vc-find-file-hook))