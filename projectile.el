;; Projectile mode
(require 'projectile)
(projectile-mode)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(setq projectile-enable-caching t)
(setq projectile-indexing-method 'hybrid)
(setq projectile-generic-command "find . -type f -not -wholename '*rewritten/*' -not -wholename '*rewritten_xcelium/*' -not -wholename '*dse*/*' -not -wholename '*btrade/conf/*' -not -wholename '*/obj_dir/*' -print0")
(setq projectile-git-command "find . -type f -not -wholename '*rewritten/*' -not -wholename '*rewritten_xcelium/*' -not -wholename '*dse*/*' -not -wholename '*btrade/conf/*' -not -wholename '*/obj_dir/*' -print0")
(setq projectile-sort-order 'recently-active)

