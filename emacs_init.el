(defun per-get-fullpath (@file-relative-path)
  "Return the full path of *file-relative-path, relative to caller's file location."

  (concat (file-name-directory (or load-file-name buffer-file-name)) @file-relative-path)
)

(require 'ido)

(load (per-get-fullpath "~/dotemacs/settings.el"))
(load (per-get-fullpath "~/dotemacs/packages.el"))
(load (per-get-fullpath "~/dotemacs/ido.el"))
(load (per-get-fullpath "~/dotemacs/frame_buffer_handling.el"))
(load (per-get-fullpath "~/dotemacs/programming.el"))
(load (per-get-fullpath "~/dotemacs/compilation.el"))
(load (per-get-fullpath "~/dotemacs/flycheck.el"))
(load (per-get-fullpath "~/dotemacs/projectile.el"))
(load (per-get-fullpath "~/dotemacs/helm.el"))