(use-package package
  :config
  (add-to-list 'package-archives
               '("melpa" . "https://melpa.org/packages/") t))
;;  (add-to-list 'package-archives
;;               '("elpa" . "http://elpa.gnu.org/packages/") t))

;; Auto uptate packages
(use-package auto-package-update
   :ensure t
   :config
   (setq auto-package-update-delete-old-versions t
         auto-package-update-interval 7)
   (auto-package-update-maybe))
