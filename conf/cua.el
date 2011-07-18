;;; cua.el --- cua

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

;; cua-mode下可以用以下命令进行列操作：
;; 直接输入字符: 在每行前(或后)都插入这个字符
;; [M-a]: 将rect中的文字左对齐
;; [M-b]: 用空格(tabs或者spaces)替换所有rect中的字符
;; [M-c]: 去掉所有行左侧的空格
;; [M-f]: 用单个字符替换所有rect中的字符(提示输入一个字符)
;; [M-i]: 对每行中第一个找到的数字进行加1操作(自动把0x开头的当作十六进制数字)
;; [M-k]: 剪切rect
;; [M-l]: 把rect中的内容全部转换为小写
;; [M-m]: 拷贝rect
;; [M-n]: 用一串自增的数字替换rect中的每一行(这个功能可以用来给每行编号)
;; [M-o]: rect的内容右移，选中的rect用空格填充
;; [M-r]: 用字符串替换符满足正则表达式的字符串
;; [M-R]: 上下反转
;; [M-s]: 把rect中的每一行替换为一个字符串(提示输入)
;; [M-t]: 把rect整个替换为一个字符串(提示输入)
;; [M-u]: 把rect中的内容全部转换为大写
;; [M-|]: 对rect执行一个shell命令
;; [C-enter]
(setq cua-enable-cua-keys nil)
(cua-mode t)

;; 

;;; Code:



(provide 'cua)
;;; cua.el ends here
