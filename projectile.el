;; Projectile mode
(require 'projectile)
(projectile-mode)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(setq projectile-enable-caching t)
(setq projectile-indexing-method 'hybrid)
(setq projectile-generic-command my-settings-projectile-generic-command)
(setq projectile-git-command my-settings-projectile-generic-comman)
(setq projectile-sort-order 'recently-active)

