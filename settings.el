(setq visible-bell t)
(setq tab-width 4)

;;No menu and tool bar
(menu-bar-mode -1)
(tool-bar-mode -1)

(setq-default show-trailing-whitespace t)
(set-face-background 'trailing-whitespace "gray15")
(global-set-key (kbd "C-x C-<backspace>") 'delete-trailing-whitespace)

;;Font
(set-frame-font "-unknown-DejaVu Sans Mono-normal-normal-normal-*-11-*-*-*-*-*-*-*")
(add-to-list 'default-frame-alist '(font . "-unknown-DejaVu Sans Mono-normal-normal-normal-*-11-*-*-*-*-*-*-*"))

;; Color settings
(defun set-my-colors ()
  (set-background-color "gray20")
  (set-cursor-color "cyan")
  (set-foreground-color "gray80"))

(defun set-my-frame-colors (frame)
  (select-frame frame)
  (set-background-color "gray20")
  (set-cursor-color "cyan")
  (set-foreground-color "gray80"))

(if (daemonp)
	(add-hook 'after-make-frame-functions #'set-my-frame-colors)
  (set-my-colors))

;;Use space not tabs
(setq-default indent-tabs-mode nil)
(setq c-basic-offset 4)

;;Fast line number showing
(autoload 'linum-mode "linum" "toggle line numbers on/off" t)
(global-set-key (kbd "C-<f5>") 'linum-mode)

;;Show the time
(setq display-time-day-and-date t)
(setq display-time-24hr-format t)
(display-time)

;; highlight the current line; set a custom face, so we can
;; recognize from the normal marking (selection)
(defface hl-line '((t (:background "Gray10")))
  "Face to use for `hl-line-face'." :group 'hl-line)
(setq hl-line-face 'hl-line)
(global-hl-line-mode t) ; turn it on for all modes by default

;; Zoom text
(defun per-text-zoom (n)
  "with positive N, increase the font size, otherwise decrease it"
  (set-face-attribute 'default (selected-frame) :height
    (+ (face-attribute 'default :height) (* (if (> n 0) 1 -1) 10))))

(global-set-key (kbd "C-+")      #'(lambda nil (interactive) (per-text-zoom 1)))
(global-set-key [C-kp-add]       #'(lambda nil (interactive) (per-text-zoom 1)))
(global-set-key (kbd "C--")      #'(lambda nil (interactive) (per-text-zoom -1)))
(global-set-key [C-kp-subtract]  #'(lambda nil (interactive) (per-text-zoom -1)))

;;Smerge
(add-hook 'smerge-mode-hook
   #'(lambda ()
       (set-face-background 'smerge-refined-change "dark magenta")))

;;Fast line number showing
(autoload 'linum-mode "linum" "toggle line numbers on/off" t)
(global-set-key (kbd "C-<f5>") 'linum-mode)

;; Keep backups in a dedicated folder
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))
(setq backup-by-copying t)

;; Brows things in emacs
(setq browse-url-browser-function 'eww-browse-url)
