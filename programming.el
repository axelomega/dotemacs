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
		  verilog-indent-lists              t
		  verilog-indent-declaration-macros nil
		  verilog-case-indent               4
		  verilog-cexp-indent               4
		  verilog-auto-newline              nil
		  verilog-minimum-comment-distance  12
		  verilog-align-ifelse              t
		  verilog-auto-endcomments          nil)))

(add-hook 'verilog-mode-hook 'flyspell-prog-mode)

;;Python mode things
;;  '(cl-dolist (key '("M-<up>" "M-<down>" "M-<left>" "M-<right>"))
;;     (define-key elpy-mode-map (kbd key) nil))
(use-package elpy
  :ensure t
  :bind (("C-M-<right>" . elpy-nav-indent-shift-right)
         ("C-M-<left>" . elpy-nav-indent-shift-left))
  :config
  (elpy-enable)
  (setq python-shell-interpreter "ipython"
        python-shell-interpreter-args "-i --simple-prompt")

  (eval-after-load "elpy"
    '(cl-dolist (key '("M-<up>" "M-<down>" "M-<left>" "M-<right>"))
       (define-key elpy-mode-map (kbd key) nil)))

  (add-hook 'elpy-mode-hook
            (lambda ()
              (define-key elpy-mode-map (kbd "C-M-<right>") 'elpy-nav-indent-shift-right)
              (define-key elpy-mode-map (kbd "C-M-<left>") 'elpy-nav-indent-shift-left))))
