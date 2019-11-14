(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

;;Show paranthesis
(setq show-paren-delay 0)           ; how long to wait?
(show-paren-mode t)                 ; turn paren-mode on
(setq show-paren-style 'expression) ; alternatives are 'parenthesis' and 'mixed'
;;;(set-face-background 'show-paren-match-face "#000033")
;;;(set-face-attribute 'show-paren-match-face nil
;;;        :weight 'bold :underline nil :overline nil :slant 'normal)


