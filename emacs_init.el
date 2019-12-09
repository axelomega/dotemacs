(defun per-get-fullpath (@file-relative-path)
  "Return the full path of *file-relative-path, relative to caller's file location."

  (concat (file-name-directory (or load-file-name buffer-file-name)) @file-relative-path)
)

(load (per-get-fullpath "~/dotemacs/packages"))
(load (per-get-fullpath "~/dotemacs/settings"))
(load (per-get-fullpath "~/dotemacs/company"))
(load (per-get-fullpath "~/dotemacs/ido"))
(load (per-get-fullpath "~/dotemacs/frame_buffer_handling"))
(load (per-get-fullpath "~/dotemacs/programming"))
(load (per-get-fullpath "~/dotemacs/compilation"))
(load (per-get-fullpath "~/dotemacs/flycheck"))
(load (per-get-fullpath "~/dotemacs/projectile"))
(load (per-get-fullpath "~/dotemacs/magit"))
(load (per-get-fullpath "~/dotemacs/helm"))
(load (per-get-fullpath "~/dotemacs/ccls"))
(load (per-get-fullpath "~/dotemacs/slack"))
