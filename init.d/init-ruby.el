(use-package ruby-mode
  :ensure t
  :mode "\\.rb\\'"
  :mode "Rakefile\\'"
  :mode "Gemfile\\'"
  :mode "Berksfile\\'"
  :mode "Vagrantfile\\'"
  :interpreter "ruby"

  :init
  (setq ruby-indent-level 2
        ruby-indent-tabs-mode nil)
  (add-hook 'ruby-mode 'superword-mode)

  :bind
  (([(meta down)] . ruby-forward-sexp)
   ([(meta up)]   . ruby-backward-sexp)
   (("C-c C-e"    . ruby-send-region))))  ;; Rebind since Rubocop uses C-c C-r



(use-package web-mode
  :ensure t
  :mode "\\.erb\\'")

(use-package yari
  :ensure t
  :init
  (add-hook 'ruby-mode-hook
            (lambda ()
              (local-set-key [f1] 'yari))))

(use-package inf-ruby
  :ensure t
  :init
  (add-hook 'ruby-mode-hook 'inf-ruby-minor-mode))

(use-package rspec-mode
  :ensure t)


(use-package yard-mode
  :ensure t
  :config
  (progn
      (defun yard-paragraph-boundarise()
      (interactive)
      (setq paragraph-separate "[ \t]*#[ \t]*$")
      (setq paragraph-start
      (concatenate
       'string
       "^[ \t]*"         ; some whitespace
       "#[ \t]*"         ; a # character followed by whitespace
       "\\("
         "@[[:alpha:]]+" ; a YARD tag
       "\\|"             ; or
         "-"             ; a list item
       "\\)"
       "\\([ \t]+.*\\)?" ; an optional text
       "[ \t]*$"         ; some more whitespace


       ))
      (add-hook 'enh-ruby-mode-hook
                '(lambda ()
                   (yard-paragraph-boundarise)))
      (add-hook 'ruby-mode-hook
                '(lambda ()
                   (yard-paragraph-boundaries))))))

(use-package smartparens
  :ensure t
  :diminish (smartparens-mode .  "()")
  :init
    (use-package smartparens-ruby)
    (add-hook 'ruby-mode-hook 'smartparens-strict-mode))

(use-package rubocop
  :ensure t
  :init
  (add-hook 'ruby-mode-hook 'rubocop-mode)
  :diminish rubocop-mode)

;; (use-package robe
;;   :ensure t
;;   ;;:bind ("C-M-." . robe-jump)
;;   :config
;;   (add-hook 'ruby-mode-hook
;;             '(lambda ()
;;                (robe-mode)
;;                (rope-ac-setup)))

;;   (setq inf-ruby-default-implementation "pry"
;;         inf-ruby-eval-binding "Pry.toplevel_binding")
;;   (use-package ac-robe
;;     :ensure t)
;;   (use-package inf-ruby :ensure t)
;;   (use-package ac-inf-ruby
;;     :ensure t
;;     :config
;;     (eval-after-load 'auto-complete
;;       '(add-to-list 'ac-modes 'inf-ruby-mode))
;;     (add-hook 'inf-ruby-mode-hook 'ac-inf-ruby-enable)
;;     )
;;   )

;; (use-package company
;;   :no-require t
;;   :config
;;   (push 'company-robe company-backends))

(provide 'init-ruby)
