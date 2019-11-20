;; ccls
(use-package ccls
  :config
  (setq ccls-executable my-settings-hrt-ccls-executable))

(use-package lsp
  :defer t
  :config
  (setq
  ;; set clangd path to shut up a complaint from lsp-mode
   lsp-clients-clangd-executable "/usr/local/opt/llvm/bin/clangd"
   lsp-ui-sideline-show-flycheck nil
   lsp-enable-file-watchers nil)
  :hook
  ((c-mode c++-mode)
   .
   lsp))
