;; my elisp directories
;; (defvar elisp-path '("~/elisp/"))
;; (mapcar #'(lambda(p) (add-to-list 'load-path p)) elisp-path)

;;; Code:

(setq visible-bell t)
(setq tab-width 4)

;;Menu and tool bar
(menu-bar-mode -1)
(tool-bar-mode -1)
;;(set-scroll-bar-mode nil)
(setq-default show-trailing-whitespace t)
(set-face-background 'trailing-whitespace "gray15")
(global-set-key (kbd "C-x C-<backspace>") 'delete-trailing-whitespace)

;;Font
(set-frame-font "-unknown-DejaVu Sans Mono-normal-normal-normal-*-11-*-*-*-*-*-*-*")

;; Color settings
(set-background-color "gray20")
(set-cursor-color "cyan")
(set-foreground-color "gray80")

;(add-to-list 'default-frame-alist '(foreground-color . "gray80"))
;(add-to-list 'default-frame-alist '(background-color . "gray20"))
;(add-to-list 'default-frame-alist '(cursor-color . "cyan"))

;;(setq default-frame-alist
;;      (append default-frame-alist
;;       '((foreground-color . "gray80")
;; (background-color . "gray20")
;; (cursor-color . "cyan")
;; )))

;; Spell checking
(setq ispell-program-name "aspell"
  ispell-extra-args '("--sug-mode=ultra"))

;; General programming
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; Compilation
(require 'compile)
(global-set-key (kbd "C-q") 'compile)

(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (read-only-mode)
  (ansi-color-apply-on-region (point-min) (point-max))
  (toggle-read-only))

(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

(add-hook 'compilation-mode-hook
          (lambda ()
            (add-to-list 'compilation-error-regexp-alist 'quartus-error)
            (add-to-list 'compilation-error-regexp-alist-alist
                         '(quartus-error
                           "Error ([0-9]*):.*File:[[:space:]]*\\([[:alnum:]/_.]*\\)[[:space:]]*Line:[[:space:]]*\\([[:digit:]]*\\)"
                           1 2 nil 2))))

(add-hook 'compilation-mode-hook
          (lambda ()
            (add-to-list 'compilation-error-regexp-alist 'quartus-warning)
            (add-to-list 'compilation-error-regexp-alist-alist
                         '(quartus-warning
                           "Warning ([0-9]*):.*File:[[:space:]]*\\([[:alnum:]/_.]*\\)[[:space:]]*Line:[[:space:]]*\\([[:digit:]]*\\)"
                           1 2 nil 1))))

;;Compilation mode regexp for Riviera-PRO
(add-hook 'compilation-mode-hook
          (lambda ()
            (add-to-list 'compilation-error-regexp-alist 'riviera-error)
            (add-to-list 'compilation-error-regexp-alist-alist
                         '(riviera-error
                           "^ERROR.*\"\\([[:alnum:]./_]+\\)\"[[:space:]]+\\([[:digit:]]+\\)[[:space:]]+\\([[:digit:]]+\\)$"
                           1 2 3 2))))

(add-hook 'compilation-mode-hook
          (lambda ()
            (add-to-list 'compilation-error-regexp-alist 'riviera-warning)
            (add-to-list 'compilation-error-regexp-alist-alist
                         '(riviera-warning
                           "^WARNING.*\"\\([[:alnum:]./_]+\\)\"[[:space:]]+\\([[:digit:]]+\\)[[:space:]]+\\([[:digit:]]+\\)$"
                           1 2 3 1))))

;;Compilation mode regexp for Verilator
(add-hook 'compilation-mode-hook
          (lambda ()
            (add-to-list 'compilation-error-regexp-alist 'verilator-error)
            (add-to-list 'compilation-error-regexp-alist-alist
                         '(verilator-error
                           "^%Error:[[:space:]]*\\([[:alnum:]/_.]+\\):\\([[:digit:]]+\\)"
                           1 2 nil 2))))

(add-hook 'compilation-mode-hook
          (lambda ()
            (add-to-list 'compilation-error-regexp-alist 'verilator-warning)
            (add-to-list 'compilation-error-regexp-alist-alist
                         '(verilator-warning
                           "^%Warning[[:upper:]-]*:[[:space:]]*\\([[:alnum:]/_.]+\\):\\([[:digit:]]+\\)"
                           1 2 nil 1))))

;;Compilation mode regexp for Vivado
(add-hook 'compilation-mode-hook
          (lambda ()
            (add-to-list 'compilation-error-regexp-alist 'vivado-error)
            (add-to-list 'compilation-error-regexp-alist-alist
                         '(vivado-error
                           "^ERROR:.*\\[\\([/_\\.[:alnum:]]*\\):\\([[:digit:]]*\\)"
                           1 2 nil 2))))

(add-hook 'compilation-mode-hook
          (lambda ()
            (add-to-list 'compilation-error-regexp-alist 'vivado-warning)
            (add-to-list 'compilation-error-regexp-alist-alist
                         '(vivado-warning
                           "^WARNING:.*\\[\\([/_\\.[:alnum:]]*\\):\\([[:digit:]]*\\)"
                           1 2 nil 1))))

(add-hook 'compilation-mode-hook
          (lambda ()
            (add-to-list 'compilation-error-regexp-alist 'vivado-info)
            (add-to-list 'compilation-error-regexp-alist-alist
                         '(vivado-info
                           "^INFO:.*\\[\\([/_\\.[:alnum:]]*\\):\\([[:digit:]]*\\)"
                           1 2 nil 0))))

;; C/C++ settings
(add-hook 'c-mode-common-hook 'flyspell-prog-mode)

(winner-mode 1)

;;Show paranthesis
(setq show-paren-delay 0)           ; how long to wait?
(show-paren-mode t)                 ; turn paren-mode on
(setq show-paren-style 'expression) ; alternatives are 'parenthesis' and 'mixed'
(set-face-background 'show-paren-match-face "#000033")
(set-face-attribute 'show-paren-match-face nil
        :weight 'bold :underline nil :overline nil :slant 'normal)

;; Zoom text
(defun djcb-zoom (n)
  "with positive N, increase the font size, otherwise decrease it"
  (set-face-attribute 'default (selected-frame) :height
    (+ (face-attribute 'default :height) (* (if (> n 0) 1 -1) 10))))

(global-set-key (kbd "C-+")      #'(lambda nil (interactive) (djcb-zoom 1)))
(global-set-key [C-kp-add]       #'(lambda nil (interactive) (djcb-zoom 1)))
(global-set-key (kbd "C--")      #'(lambda nil (interactive) (djcb-zoom -1)))
(global-set-key [C-kp-subtract]  #'(lambda nil (interactive) (djcb-zoom -1)))

;;Unique buffer names
(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
(setq uniquify-separator "#")
(setq uniquify-after-kill-buffer-p t) ; rename after killing uniquified
(setq uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers

;;Easy buffer switching
(require 'windmove)
(windmove-default-keybindings 'meta)

;; ido makes competing buffers and finding files easier
;; http://www.emacswiki.org/cgi-bin/wiki/InteractivelyDoThings
(require 'ido)
(ido-mode 'both) ;; for buffers and files
(setq
  ido-save-directory-list-file "~/.emacs.d/cache/ido.last"

  ido-ignore-buffers ;; ignore these guys
  '("\\` " "^\*Mess" "^\*Back" ".*Completion" "^\*Ido" "^\*trace" "^\*GTAGS" "^session\.*" "^\*" ".*\.mak")
;  ido-work-directory-list '("~/" "~/Desktop" "~/Documents" "~src")
  ido-case-fold  t                 ; be case-insensitive
  ido-everywhere t                 ; use for many file dialogs
  ido-enable-last-directory-history t ; remember last used dirs
  ido-max-work-directory-list 30   ; should be enough
  ido-max-work-file-list      50   ; remember many
  ido-use-filename-at-point nil    ; don't use filename at point (annoying)
  ido-use-url-at-point nil         ; don't use url at point (annoying)

  ido-enable-flex-matching t     ; be smart
  ido-max-prospects 16              ; don't spam my minibuffer
  ido-confirm-unique-completion nil) ; wait for RET, even with unique completion

;; when using ido, the confirmation is rather annoying...
(setq confirm-nonexistent-file-or-buffer nil)

;;Smerge
(add-hook 'smerge-mode-hook
   #'(lambda ()
       (set-face-background 'smerge-refined-change "dark magenta")))

;;Use space not tabs
(setq-default indent-tabs-mode nil)
(setq c-basic-offset 4)

;;Verilog mode stuff
(add-hook 'verilog-mode-hook
		  (lambda()
			(setq verilog-indent-level              4
				  verilog-indent-level-module       4
				  verilog-indent-level-declaration  4
				  verilog-indent-level-behavioral   4
				  verilog-indent-level-directive    4
				  verilog-indent-begin-after-if     nil
				  verilog-indent-lists              t
				  verilog-indent-declaration-macros nil
				  verilog-case-indent               4
				  verilog-cexp-indent               4
				  verilog-auto-newline              nil
				  verilog-minimum-comment-distance  12
				  verilog-align-ifelse              t
				  verilog-auto-endcomments          nil
				  )
			))

(add-hook 'verilog-mode-hook 'flyspell-prog-mode)

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

;; CEDET stuff
(semantic-mode 1)

;; Keep backups in a dedicated folder
(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)

;;A better terminal
(autoload 'multi-term "multi-term" nil t)
(autoload 'multi-term-next "multi-term" nil t)
(setq multi-term-program "/bin/bash")   ;; use bash
(global-set-key (kbd "C-c t") 'multi-term-next)
(global-set-key (kbd "C-c T") 'multi-term) ;; create a new one

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(elpy-modules
   (quote
    (elpy-module-company elpy-module-eldoc elpy-module-pyvenv elpy-module-highlight-indentation elpy-module-yasnippet elpy-module-django elpy-module-sane-defaults)))
 '(inhibit-startup-screen t)
 '(verilog-auto-lineup (quote ignore)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flymake-errline ((t nil))))

;; ============ Non bundled packages ==========
;; Do initalize packes and load them last, after as many user settings as possible
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

;; Projectile mode
(require 'projectile)
(projectile-mode)
(setq projectile-enable-caching t)

;;Easy frame switching
(global-set-key (kbd "C-c o") 'other-frame)
(require 'framemove)
(windmove-default-keybindings)
(setq framemove-hook-into-windmove t)

;; regular auto-complete initialization
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "/home/perk/elisp/ac-dict")
(ac-config-default)
(setq ac-use-menu-map t)
(define-key ac-menu-map (kbd "C-M-j") 'ac-next)
(define-key ac-menu-map (kbd "C-M-i") 'ac-previous)

;;Lorem ipsum
(require 'lorem-ipsum)

;;No scroll bar, info to mode line
(if (require 'sml-modeline nil 'noerror)    ;; use sml-modeline if available
  (progn
    (sml-modeline-mode 1)                   ;; show buffer pos in the mode line
    (scroll-bar-mode -1))                   ;; turn off the scrollbar
  (scroll-bar-mode 1)                       ;; otherwise, show a scrollbar...
  (set-scroll-bar-mode 'right))             ;; ... on the right

;;Pabbrev this is usefull
(require 'pabbrev)
(global-pabbrev-mode t)
(setq pabbrev-idle-timer-verbose nil)

;;Better undos
;(require 'undo-tree)
;(global-undo-tree-mode)

;;Python mode things
(elpy-enable)
(eval-after-load "elpy"
  '(cl-dolist (key '("M-<up>" "M-<down>" "M-<left>" "M-<right>"))
     (define-key elpy-mode-map (kbd key) nil)))

(add-hook 'elpy-mode-hook
          (lambda ()
            (define-key elpy-mode-map (kbd "C-M-<right>") 'elpy-nav-indent-shift-right)
            (define-key elpy-mode-map (kbd "C-M-<left>") 'elpy-nav-indent-shift-left)))

(add-hook 'after-init-hook #'global-flycheck-mode)

(with-eval-after-load 'flycheck
  (flycheck-pos-tip-mode))

(with-eval-after-load 'flycheck
  (require 'flycheck-clang-analyzer)
  (flycheck-clang-analyzer-setup))

(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-clang-tidy-setup))

;; Mark certain columns
(require 'column-marker)


;;; .emacs ends here
