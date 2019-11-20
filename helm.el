(require 'helm)

(global-set-key (kbd "M-x") 'helm-M-x)

(require 'helm-spotify-plus)
(global-set-key (kbd "C-c s s") 'helm-spotify-plus)  ;; s for SEARCH
(global-set-key (kbd "C-c s f") 'helm-spotify-plus-next)
(global-set-key (kbd "C-c s b") 'helm-spotify-plus-previous)
(global-set-key (kbd "C-c s p") 'helm-spotify-plus-play)
(global-set-key (kbd "C-c s g") 'helm-spotify-plus-pause) ;; g cause you know.. C-g stop things :)

(require 'helm-swoop)
(global-set-key (kbd "M-i") 'helm-swoop)
(global-set-key (kbd "M-I") 'helm-swoop-back-to-last-point)
(global-set-key (kbd "C-c M-i") 'helm-multi-swoop)
(global-set-key (kbd "C-x M-i") 'helm-multi-swoop-all)

;; When doing isearch, hand the word over to helm-swoop
(define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)
;; From helm-swoop to helm-multi-swoop-all
(define-key helm-swoop-map (kbd "M-i") 'helm-multi-swoop-all-from-helm-swoop)

(setq tramp-default-method "ssh")
;;(define-key global-map (kbd "C-c s") 'helm-tramp)

(use-package helm-jira
  :config

  (setq
   ;; URL of your JIRA instance (should not end in a slash)
   helm-jira-url my-settings-jira-url

   ;; The username to use to log in to JIRA
   helm-jira-username "per"

   ;; The JIRA-project you want to interact with
   helm-jira-project "FPGA"))

(require 'helm-projectile)
(helm-projectile-on)
