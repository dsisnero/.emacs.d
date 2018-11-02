(require 'req-package)

(req-package company
  :ensure t
  :init (global-company-mode)
  :require yasnippet
  :config
  (setq company-minimum-prefix-length 1
        company-show-numbers t
        company-tooltip-limit 20
        company-selection-wrap-around t
        company-tooltip-align-annotations t
        company-tooltip-flip-when-above t)
  ;; default backends
  (setq company-backends '((company-files)))

  )

(use-package helm-company
  :defer t
  :init
  (with-eval-after-load 'company
    (define-key company-active-map (kbd "C-/") 'helm-company)))

(req-package company-quickhelp
  :ensure t
  :after company
  :config (company-quickhelp-mode 1))

(provide 'init-company)
