;; start emacs server

(require 'server)
(unless (server-running-p)
  (server-start))

;; elpa

(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")))

(defconst my-init-dir "~/.emacs.d/init.d")

(eval-when-compile (package-initialize))

(defun require-package (package)
  "refresh package archives, check package presence and install if it's not installed"
  (if (null (require package nil t))
      (progn (let* ((ARCHIVES (if (null package-archive-contents)
                                  (progn (package-refresh-contents)
                                         package-archive-contents)
                                package-archive-contents))
                    (AVAIL (assoc package ARCHIVES)))
               (if AVAIL
                   (package-install package)))
             (require package))))

;; use package

(require-package 'use-package)
(require 'use-package)

;; el-get

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(require-package 'el-get)
(require 'el-get)
(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get/el-get/recipes")
(el-get 'sync)

;; :el-get keyword for use-package

(use-package use-package-el-get
  :ensure t
  :config (use-package-el-get-setup))

;;auto-compile
(use-package auto-compile
  :ensure t
  :demand t
  :config
  (auto-compile-on-load-mode)
  (auto-compile-on-save-mode)
  (setq auto-compile-display-buffer               nil)
  (setq auto-compile-mode-line-counter            t)
  (setq auto-compile-source-recreate-deletes-dest t)
  (setq auto-compile-toggle-deletes-nonlib-dest   t)
  (setq auto-compile-update-autoloads             t)
  (add-hook 'auto-compile-inhibit-compile-hook
            'auto-compile-inhibit-compile-detached-git-head))

;; chords
(use-package use-package-chords
  :ensure t)

;; req-package

(use-package use-package-chords
  :ensure t
  :config (key-chord-mode 1))

(use-package use-package-ensure-system-package
  :ensure t)

(use-package req-package
  :ensure t
  :config (req-package--log-set-level 'debug))

;; init.d

(random t)

(req-package load-dir
  :ensure t
  :force true
  :init
  (setq force-load-messages nil)
  (setq load-dir-debug nil)
  (setq load-dir-recursive t)
  :config
  (load-dir-one my-init-dir)
  (req-package-finish)
  (funcall 'select-theme))

(load "~/.emacs.d/init-bindings.el")
