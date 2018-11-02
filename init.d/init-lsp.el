(require 'req-package)

(use-package lsp-mode
  :ensure t)

(use-package lsp-ui
  :ensure t
  :config
  (setq lsp-ui-sideline-enable t
        lsp-ui-sideline-show-symbol t
        lsp-ui-sideline-show-hover t
        lsp-ui-sideline-show-code-actions t
        lsp-ui-sideline-update-mode 'point)
  (add-hook 'lsp-mode-hook 'lsp-ui-mode))


(use-package company-lsp
  :after company
  :ensure t
  :config
  (push 'company-lsp company-backends)
  (setq company-lsp-enable-snippet t
        compyany-lsp-cache-candidates t)
  )
