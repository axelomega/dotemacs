(use-package helm
  :ensure t
  :bind (("M-x" . 'helm-M-x)))

(use-package helm-spotify-plus
  :ensure t
  :bind (("C-c s s" . helm-spotify-plus)  ;; s for SEARCH
         ("C-c s f" . helm-spotify-plus-next)
         ("C-c s b" . helm-spotify-plus-previous)
         ("C-c s p" . helm-spotify-plus-play)
         ("C-c s g" . helm-spotify-plus-pause))) ;; g cause you know.. C-g stop things :)

(use-package helm-swoop
  :ensure t
  :bind (("M-i" . helm-swoop)
         ("M-I" . helm-swoop-back-to-last-point)
         ("C-c M-i" . helm-multi-swoop)
         ("C-x M-i" . helm-multi-swoop-all))
  :config
  ;; When doing isearch, hand the word over to helm-swoop
  (define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)
  ;; From helm-swoop to helm-multi-swoop-all
  (define-key helm-swoop-map (kbd "M-i") 'helm-multi-swoop-all-from-helm-swoop))

(setq tramp-default-method "ssh")
;;(define-key global-map (kbd "C-c s") 'helm-tramp)

(use-package helm-jira
  :ensure t
  :if my-settings-jira-url
  :config
  (setq
   ;; URL of your JIRA instance (should not end in a slash)
   helm-jira-url my-settings-jira-url

   ;; The username to use to log in to JIRA
   helm-jira-username my-settings-jira-username

   ;; The JIRA-project you want to interact with
   helm-jira-project my-settings-jira-project))

(use-package helm-projectile
  :ensure t
  :config
  (helm-projectile-on))
