(require 'req-package)

(use-package rust-mode
    :mode "\\.rs\\'"
    :init
    (setq rust-format-on-save t))



(use-package lsp-rust
  :ensure t
  :requires (lsp-ui-flycheck lsp-ui-sideline)
  :hook
  (rust-mode . lsp-rust-enable)
  (rust-mode . (lambda()(lsp-ui-flycheck-enable t)))
  (rust-mode . lsp-ui-sideline-mode)
  )



















;; (use-package lsp-mode
;;   :ensure t)

;; ;;; setup-rust.el -*- lexical-binding: t; -*-
;; ;; Time-stamp: <2018-08-15 13:37:27 csraghunandan>

;; ;; Copyright (C) 2016-2018 Chakravarthy Raghunandan
;; ;; Author: Chakravarthy Raghunandan <rnraghunandan@gmail.com>

;; ;; rust-mode, RLS, cargo

;; ;; lsp-rust: Rust support for lsp-mode using the Rust Language Server.
;; ;; https://github.com/emacs-lsp/lsp-rust
;; (use-package lsp-rust
;;   :ensure t
;;   :after (lsp-mode))

;; ;; rust-mode: major-mode for editing rust files
;; ;; https://github.com/rust-lang/rust-mode
;; (use-package rust-mode
;;   :init(setq rust-format-on-save t)
;;   :hook ((rust-mode . (lambda ()
;;                         (lsp-rust-enable)
;;                         (lsp-ui-mode)
;;                         (lsp-ui-sideline-mode)
;;                         (lsp-ui-doc-mode)
;;                         (eldoc-mode -1)
;;                         (flycheck-mode)
;;                         (smart-dash-mode)
;;                         (company-mode))))

;;   :bind (:map rust-mode-map
;;          ("C-c v t" . wh/rust-toggle-visibility)
;;          ("C-c m t" . wh/rust-toggle-mutability)
;;          ("C-c v s" . wh/rust-vec-as-slice))
;;   :ensure-system-package
;;   ((rustfmt . "rustup component add rustfmt-preview")
;;    (racer . "cargo install racer")
;;    (rls . "rustup component add rls-preview rust-analysis rust-src"))
;;   :config
;;   (setq rust-indent-method-chain t)

;;   (defun my-rust-mode-hook ()
;;     (set (make-local-variable 'company-backends)
;;          '((company-lsp company-files :with company-yasnippet)
;;            (company-dabbrev-code company-dabbrev))))
;;   (add-hook 'rust-mode-hook #'my-rust-mode-hook)

;;   ;; format rust buffers using rustfmt(if it is installed)
;;   (add-hook 'rust-mode-hook
;;             (lambda ()
;;               (add-hook 'before-save-hook
;;                         (lambda ()
;;                           (time-stamp)
;;                           (lsp-format-buffer)) nil t)))

;;   (defun wh/rust-toggle-mutability ()
;;     "Toggle the mutability of the variable at point."
;;     (interactive)
;;     (save-excursion
;;       (racer-find-definition)
;;       (back-to-indentation)
;;       (forward-char 4)
;;       (if (looking-at "mut ")
;;           (delete-char 4)
;;         (insert "mut "))))

;;   (defun wh/rust-toggle-visibility ()
;;     "Toggle the public visibility of the function at point."
;;     (interactive)
;;     (save-excursion
;;       ;; If we're already at the beginning of the function definition,
;;       ;; `beginning-of-defun' moves to the previous function, so move elsewhere.
;;       (end-of-line)

;;       (beginning-of-defun)
;;       (if (looking-at "pub ")
;;           (delete-char 4)
;;         (insert "pub "))))

;;   (defun wh/rust-vec-as-slice ()
;;     "Convert the vector expression at point to a slice.
;; foo -> &foo[..]"
;;     (interactive)
;;     (insert "&")
;;     (forward-symbol 1)
;;     (insert "[..]")))

;; ;; cargo-mode: execute cargo commands easily
;; ;; https://github.com/kwrooijen/cargo.el
;; (use-package cargo
;;   :after rust-mode
;;   :hook ((rust-mode . cargo-minor-mode)))

;; (provide 'init-rust)

;; ;; to disable automatic formatting of buffers, put this in `.dir-locals.el'
;; ;; ((rust-mode
;; ;;   (before-save-hook . (lambda ()
;; ;;                         (time-stamp)
;; ;;                         (ws-butler-after-save)))))
