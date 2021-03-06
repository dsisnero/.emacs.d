(require 'req-package)

(req-package git-timemachine
  :ensure t
  :bind (("C-x v t" . git-timemachine)))

(use-package ssh-agency
  :ensure t)

(setenv "GIT_ASKPASS" "git-gui--askpass")
(setenv "SSH-ASKPASS" "git-gui--askpass")

(req-package magit
  :ensure t
  :bind ("C-x g" . magit-status)
  :commands (magit-status)
  )

(use-package epa-file
  :config
  (epa-file-enable))

;; (setq epg-gpg-home-directory "~/.gnupg")
;; (setq epg-gpgconf-program "e:/msys64/usr/bin/gpgconf.exe")
;; (setq epg-gpg-program "e:/msys64/usr/bin/gpg.")

(use-package magithub
  :after magit
  :ensure t
  :config (magithub-feature-autoinject t))

(req-package magit-gitflow
  :ensure t
  :require magit
  :commands turn-on-magit-gitflow
  :init (add-hook-exec 'magit-mode 'turn-on-magit-gitflow))

;; (req-package gitconfig-mode
;;   :ensure t)

;; (req-package gitignore-mode
;;   :ensure t)

(req-package git-messenger
  :ensure t
  :bind ("C-x v p" . git-messenger:popup-message))

;; (req-package gitattributes-mode
;;   :ensure t)

(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-split-window-function 'split-window-horizontally)
(setq-default ediff-ignore-similar-regions t)
(setq-default ediff-highlight-all-diffs nil)

(provide 'init-vc)
