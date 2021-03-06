;; Projectile mode
(use-package projectile
  :ensure t
  :bind-keymap ("C-c p" . projectile-command-map)
  :config
  (projectile-mode)
  (setq projectile-enable-caching t)
  (setq projectile-indexing-method 'hybrid)
  (setq projectile-generic-command my-settings-projectile-generic-command)
  (setq projectile-git-command my-settings-projectile-generic-command)
  (setq projectile-sort-order 'recently-active))
