(use-package package
  :config
  (add-to-list 'package-archives
               '("melpa" . "http://melpa.milkbox.net/packages/") t))

;; Auto uptate packages
(use-package auto-package-update
   :ensure t
   :config
   (setq auto-package-update-delete-old-versions t
         auto-package-update-interval 7)
   (auto-package-update-maybe))
