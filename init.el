
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq debug-on-error t)
(setq debug-on-quit t)

(global-auto-revert-mode 1)
;; be quiet about reverting files
(setq auto-revert-verbose nil)


(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

(line-number-mode 1)
(column-number-mode 1)

(defalias 'yes-or-no-p 'y-or-n-p)


;; save backup files
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

;; bootstrap utils

(defconst my-custom-file "~/Dropbox/emacs/custom.el")

(setq custom-file my-custom-file)
(setq package-enable-at-startup nil)
(load my-custom-file t)
(setq auto-save-default nil)
(setq make-backup-files nil)
(put 'erase-buffer 'disabled nil)

;; turn off sctartup screen

(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

;; load extensions
(add-hook 'after-init-hook (lambda () (load "~/.emacs.d/init-real.el")))
