;; Projectile mode
(use-package projectile
  :ensure t
  :bind-keymap ("C-c p" . projectile-command-map)
  :config
  (projectile-mode)
  (setq projectile-enable-caching t)
  (setq projectile-indexing-method 'alien)
  (setq projectile-generic-command my-settings-projectile-generic-command)
  (setq projectile-sort-order 'recently-active))

(use-package treemacs-projectile
  :ensure t)
