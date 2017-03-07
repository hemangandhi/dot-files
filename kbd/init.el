;; Packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;; Evil
(require 'evil)
(evil-mode 1)

;; Theme things
(require 'airline-themes)
(load-theme 'airline-molokai)
(load-theme 'monokai t)
(set-face-foreground 'minibuffer-prompt "white")
(set-face-background 'minibuffer-prompt "black")

;; Line numbers
(global-linum-mode nil)
;; ssh-ing
(setq tramp-default-method "ssh")

;; I can ride my bike with no menubar
(menu-bar-mode -1)

;;Spaces only, indent by 4
(setq indent-tabs-mode nil)
(setq tab-width 4)
(setq indent-line-function 'inset-tab)
(setq c-default-style "linux")
(setq-default c-basic-offset 4)

;; x copy paste
(setq x-select-enable-primary t)
;;xelatex
(setq pdf-latex-command "xelatex")

;;auto completion
(ac-config-default)
(global-auto-complete-mode t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("73a13a70fd111a6cd47f3d4be2260b1e4b717dbf635a9caee6442c949fad41cd" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;term quickly
(global-set-key (kbd "<f1>") 'term)
(global-set-key (kbd "C-x r") 'rename-buffer)
