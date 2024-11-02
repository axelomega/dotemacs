;;; symlink this file to ~/.emacs.d/init.el
(load-file "~/.emacs.d/local_settings.el")
(load-file "~/dotemacs/emacs_init.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-minimum-prefix-length 2)
 '(inhibit-startup-echo-area-message "per")
 '(inhibit-startup-screen t)
 '(initial-buffer-choice nil)
 '(minimap-highlight-line nil)
 '(minimap-width-fraction 0.1)
 '(minimap-window-location 'right)
 '(package-selected-packages
   '(auctex-label-numbers auto-package-update bison-mode cmake-font-lock
                          column-enforce-mode dap-mode elpy envrc
                          flycheck-clang-analyzer flycheck-clang-tidy
                          flycheck-pos-tip flycheck-yamllint
                          groovy-mode helm-git-grep helm-jira
                          helm-ls-git helm-lsp helm-projectile
                          helm-spotify-plus helm-swoop helm-tramp
                          lsp-pyright lsp-ui magit minimap
                          sml-modeline use-package ws-butler yaml-mode
                          yaml-pro)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(minimap-active-region-background ((t (:background "black")))))
