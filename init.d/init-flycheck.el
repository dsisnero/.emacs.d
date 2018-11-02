(require 'req-package)

(use-package flycheck
  :defer t
  :config
  (progn
    (defconst des/flycheck-mode-hooks '(python-mode-hook
                                         sh-mode-hook
                                         nim-mode-hook
                                         ruby-mode-hook)
      "List of hooks of major modes in which flycheck mode should be enabled.")

    (defun des/turn-on-flycheck-mode ()
      "Turn on flycheck-mode for the modes in `des/flycheck-mode-hooks'."
      (interactive)
      (dolist (hook des/flycheck-mode-hooks)
        (add-hook hook #'flycheck-mode)))

    (defun des/turn-off-flycheck-mode ()
      "Turn off flycheck-mode for the modes in `des/flycheck-mode-hooks'."
      (interactive)
      (dolist (hook des/flycheck-mode-hooks)
        (remove-hook hook #'flycheck-mode)))

    (des/turn-on-flycheck-mode)))

(provide 'init-flycheck)
