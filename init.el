(setq package-check-signature nil)

;;Adresses de depots de paquets
(setq package-archives '(("ELPA"  . "http://tromey.com/elpa/")
                         ("gnu"   . "http://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("org"   . "https://orgmode.org/elpa/")))
(package-initialize)


(unless (package-installed-p 'use-package)
        (package-refresh-contents)
        (package-install 'use-package))



(org-babel-load-file (expand-file-name "~/.emacs.d/my_init.org"))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(wombat))
 '(custom-safe-themes
   '("ab98c7f7a58add58293ac67bec05ae163b5d3f35cddf18753b2b073c3fcd8841" default))
 '(package-selected-packages
   '(elpy ox-twbs auto-complete treemacs-evil treemacs-projectile treemacs-icons-dired treemacs-magit treemacs-persp paredit ggtags irony flycheck ox-reveal ace-window yasnippet-snippets yasnippet which-key rainbow-delimiters busybee-theme dashboard use-package spaceline-all-the-icons beacon async))
 '(spaceline-all-the-icons-icon-set-modified 'chain)
 '(spaceline-all-the-icons-icon-set-vc-icon-git 'github-logo)
 '(spaceline-all-the-icons-icon-set-window-numbering 'solid))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 7.0)))))
(put 'upcase-region 'disabled nil)
