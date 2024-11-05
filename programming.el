;; C/C++ settings
(add-hook 'c-mode-common-hook 'flyspell-prog-mode)

;;Verilog mode stuff
(add-hook 'verilog-mode-hook
	  (lambda()
	    (setq verilog-indent-level              4
		  verilog-indent-level-module       4
		  verilog-indent-level-declaration  4
		  verilog-indent-level-behavioral   4
		  verilog-indent-level-directive    4
		  verilog-indent-begin-after-if     nil
		  verilog-indent-lists              nil
		  verilog-indent-declaration-macros nil
		  verilog-case-indent               4
		  verilog-cexp-indent               4
		  verilog-auto-newline              nil
		  verilog-minimum-comment-distance  12
		  verilog-align-ifelse              t
		  verilog-auto-endcomments          nil)))

(add-hook 'verilog-mode-hook 'flyspell-prog-mode)

;; LSP mode setting
(require 'eglot)
(add-hook 'python-mode-hook #'eglot-ensure)
(add-to-list 'eglot-server-programs
	     `(python-mode . ("pyright-langserver" "--stdio")))


(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook ((python-mode . lsp)
         (c-mode . lsp)
         (c++-mode . lsp)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

(use-package helm-lsp
  :ensure t
  :commands helm-lsp-workspace-symbol)

(use-package helm-xref
  :ensure t)

(use-package dap-mode
    :ensure t)

;; Neededed to make eglot happy
(use-package flycheck-clang-tidy
  :ensure t)

(use-package flycheck-clang-analyzer
  :ensure t)

(use-package flycheck-pos-tip
  :ensure t)

;;(require 'lsp-ui
;;         :commands lsp-ui-mode)

;; For performace
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024)) ;; 1mb

;;Python mode things
(use-package envrc
  :ensure t
  :when (executable-find "direnv")
  :hook (after-init . envrc-global-mode))

(use-package lsp-pyright
  :ensure t
  :custom (lsp-pyright-langserver-command "pyright") ;; or basedpyright
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp))))  ; or lsp-deferred

(use-package dap-python)

;;  '(cl-dolist (key '("M-<up>" "M-<down>" "M-<left>" "M-<right>"))
;;     (define-key elpy-mode-map (kbd key) nil))
;(use-package elpy
;  :ensure t
;  :bind (("C-M-<right>" . elpy-nav-indent-shift-right)
;         ("C-M-<left>" . elpy-nav-indent-shift-left))
;  :config
;  (elpy-enable)
;  (setq python-shell-interpreter "ipython"
;        python-shell-interpreter-args "-i --simple-prompt")
;
;  (eval-after-load "elpy"
;    '(cl-dolist (key '("M-<up>" "M-<down>" "M-<left>" "M-<right>"))
;       (define-key elpy-mode-map (kbd key) nil)))
;
;  (add-hook 'elpy-mode-hook
;            (lambda ()
;              (define-key elpy-mode-map (kbd "C-M-<right>") 'elpy-nav-indent-shift-right)
;              (define-key elpy-mode-map (kbd "C-M-<left>") 'elpy-nav-indent-shift-left))))
