(setq visible-bell t)
(setq tab-width 4)

;;No menu and tool bar
(menu-bar-mode -1)
(tool-bar-mode -1)

(setq-default show-trailing-whitespace t)
(set-face-background 'trailing-whitespace "gray15")
(global-set-key (kbd "C-x C-<backspace>") 'delete-trailing-whitespace)

;;Font
(set-frame-font "-unknown-DejaVu Sans Mono-normal-normal-normal-*-12-*-*-*-*-*-*-*")

;; Color settings
(set-background-color "gray20")
(set-cursor-color "cyan")
(set-foreground-color "gray80")

