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
   '(json-mode json-navigator jsonnet-mode helm-company auto-package-update use-package helm-git-files helm-git-grep helm-ls-git ccls company-lsp helm-lsp ws-butler helm-jira magit minimap sml-modeline sml-mode helm helm-projectile helm-spotify-plus helm-swoop helm-tramp projectile elpy)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(minimap-active-region-background ((t (:background "black")))))
