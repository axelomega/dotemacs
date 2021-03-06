;; Compilation
(use-package compile
  :bind (("C-q" . 'compile))
  :config
  ;; Quartus
  (add-to-list 'compilation-error-regexp-alist 'quartus-error)
  (add-to-list 'compilation-error-regexp-alist-alist
               '(quartus-error
                 "^Error ([0-9]*):.*File:[[:space:]]*\\([[:alnum:]/_.]*\\)[[:space:]]*Line:[[:space:]]*\\([[:digit:]]*\\)"
                 1 2 nil 2))

  (add-to-list 'compilation-error-regexp-alist 'quartus-warning)
  (add-to-list 'compilation-error-regexp-alist-alist
               '(quartus-warning
                 "^Warning ([0-9]*):.*File:[[:space:]]*\\([[:alnum:]/_.]*\\)[[:space:]]*Line:[[:space:]]*\\([[:digit:]]*\\)"
                 1 2 nil 1))

  ;; Riviera-PRO
  (add-to-list 'compilation-error-regexp-alist 'riviera-error)
  (add-to-list 'compilation-error-regexp-alist-alist
               '(riviera-error
                 "^ERROR.*\"\\([[:alnum:]./_]+\\)\"[[:space:]]+\\([[:digit:]]+\\)[[:space:]]+\\([[:digit:]]+\\)$"
                 1 2 3 2))

  (add-to-list 'compilation-error-regexp-alist 'riviera-warning)
  (add-to-list 'compilation-error-regexp-alist-alist
               '(riviera-warning
                 "^WARNING.*\"\\([[:alnum:]./_]+\\)\"[[:space:]]+\\([[:digit:]]+\\)[[:space:]]+\\([[:digit:]]+\\)$"
                 1 2 3 1))

  ;; Verilator
  (add-to-list 'compilation-error-regexp-alist 'verilator-error)
  (add-to-list 'compilation-error-regexp-alist-alist
               '(verilator-error
                 "^%Error:[[:space:]]*\\([[:alnum:]/_.]+\\):\\([[:digit:]]+\\)"
                 1 2 nil 2))

  (add-to-list 'compilation-error-regexp-alist 'verilator-warning)
  (add-to-list 'compilation-error-regexp-alist-alist
               '(verilator-warning
                 "^%Warning[[:upper:]-]*:[[:space:]]*\\([[:alnum:]/_.]+\\):\\([[:digit:]]+\\)"
                 1 2 nil 1))

  ;; Vivado
  (add-to-list 'compilation-error-regexp-alist 'vivado-error)
  (add-to-list 'compilation-error-regexp-alist-alist
               '(vivado-error
                 "^ERROR:.*\\[\\([/_\\.[:alnum:]]*\\):\\([[:digit:]]*\\)"
                 1 2 nil 2))

  (add-to-list 'compilation-error-regexp-alist 'vivado-warning)
  (add-to-list 'compilation-error-regexp-alist-alist
               '(vivado-warning
                 "^WARNING:.*\\[\\([/_\\.[:alnum:]]*\\):\\([[:digit:]]*\\)"
                 1 2 nil 1))

  (add-to-list 'compilation-error-regexp-alist 'vivado-info)
  (add-to-list 'compilation-error-regexp-alist-alist
               '(vivado-info
                 "^INFO:.*\\[\\([/_\\.[:alnum:]]*\\):\\([[:digit:]]*\\)"
                 1 2 nil 0)))

(defun colorize-compilation-buffer ()
  (read-only-mode)
  (ansi-color-apply-on-region (point-min) (point-max))
  (toggle-read-only))

(use-package ansi-color
  :ensure t
  :config
  (add-hook 'compilation-filter-hook 'colorize-compilation-buffer))
