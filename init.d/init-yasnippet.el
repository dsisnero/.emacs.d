(require 'req-package)

(req-package yasnippet
  :ensure t
  :diminish yas-minor-mode
  :config
  (progn
    (setq des/yas-snippets-dir (let ((dir (concat user-emacs-directory
                                                  "snippets/")))
                                 (make-directory dir :parents)
                                 dir))
    (add-to-list 'yas-snippet-dirs des/yas-snippets-dir)
    (yas-global-mode)
    (yas-reload-all)
    )
  )




(use-package yasnippet-snippets
  :ensure t
  :after yasnippet)

(provide 'init-yasnippet)
