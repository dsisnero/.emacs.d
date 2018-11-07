(require 'req-package)

(use-package helm
  :ensure t
  :diminish helm-mode
  :bind
  (("M-x" . helm-M-x)
   ("M-y" . helm-show-kill-ring)
   ("C-x C-b" . helm-projectile-buffers-list)
   ("C-x b" . helm-mini)
   ("C-x C-f" . helm-find-files)
   ("C-h a" . helm-apropos)
   :map helm-find-files-map
   ("<tab>" . helm-execute-persistent-action)
   ("C-z" . helm-select-action)
   ("C-i" . helm-execute-persistent-action)
   ("C-<backspace>" . helm-find-files-up-one-level)

   )


  :config
  (progn
    (setq helm-candidate-number-limit 100)
    (setq helm-idle-delay 0.0
          helm-command-prefix-key "C-c h"
          ;; fuzzy matching
          helm-buffers-fuzzy-matching t
          helm-recentf-fuzzy-match t
          helm-semantic-fuzzy-match t
          helm-imenu-fuzzy-match t
          helm-completion-in-region-fuzzy-match t
          helm-M-x-fuzzy-match t
          helm-apropos-fuzzy-match t
          helm-ff-file-name-history-use-recentf t
          helm-echo-input-in-header-line t
          helm-autoresize-max-height 0
          helm-autoresize-min-height 20
          helm-autoresize-mode 1
          )
    (defun spacemacs//helm-hide-minibuffer-maybe ()
      "Hide minibuffer in Helm session if we use the header line as input field."
      (when (with-helm-buffer helm-echo-input-in-header-line)
        (let ((ov (make-overlay (point-min) (point-max) nil nil t)))
          (overlay-put ov 'window (selected-window))
          (overlay-put ov 'face
                       (let ((bg-color (face-background 'default nil)))
                         `(:background ,bg-color :foreground ,bg-color)))
          (setq-local cursor-type nil))))


    (add-hook 'helm-minibuffer-set-up-hook
              'spacemacs//helm-hide-minibuffer-maybe)

    (use-package helm-config)
    (use-package helm-files)
    (use-package helm-grep)
    (helm-mode 1)

    )

  )



(use-package projectile
  :commands (projectile-find-file
             projectile-switch-open-project
             projectile-switch-project
             projectile-find-dir)
  :ensure t
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :config
  (progn
    (projectile-global-mode)
    (setq projectile-completion-system 'helm
          projectile-indexing-method 'turbo-alien
          projectile-generic-command "fd -type f --print0 ."
          projectile-git-command "fd -type f --print0 .")))

(use-package helm-projectile
  :ensure t
  :commands (projectile-switch-project-action helm-projectile helm-projectile-switch-project
                                              helm-projectile-find-file)
  :after (helm projectile)
  :bind
  (("C-x f" . helm-projectile)
   :map projectile-mode-map
   ("C-c p f" . helm-projectile-find-file)
   ("C-c p s" . helm-projectile-switch-project)
   ("C-c p d" . helm-projectile-find-dir)
   )
  :config
  (progn
    (setq projectile-completion-system 'helm
          projectile-switch-project-action 'helm-projectile)
    (helm-projectile-on))

  )

(use-package helm-descbinds
  :after (helm)
  :ensure t
  :commands helm-descbinds
  :config
  (global-kbd-or 'helm-descbinds "C-h-b")
  )

(use-package helm-flyspell
  :after (helm)
  :commands helm-flyspell-correct
  :config (global-kbd-or 'helm-flyspell-correct "C-;"))

(use-package helm-ag
  :after (helm ag)
  :ensure t
  :bind ("C-M-s" . helm-ag-this-file))

(use-package ag
  :ensure t)

(use-package ripgrep
  :ensure t)

(use-package projectile-ripgrep
  :ensure t)

(use-package helm-themes
  :ensure t)

(provide 'init-helm)
