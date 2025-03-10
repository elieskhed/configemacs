;; Framework pour le html ox-twbs
(setq org-publish-project-alist
      '(("org-notes"
         :base-directory "~/org/"
         :publishing-directory "~/public_html/"
         :publishing-function org-twbs-publish-to-html
         :with-sub-superscript nil
         )))

  ;; processus deviennent asynchrones
  (use-package async
    :ensure t
    :init (dired-async-mode 1)
    :diminish)

  ;; Correction de la sauvegarde lente
  (setq vc-handled-backends nil)


  ;; Rechargement automatiques des fichiers modifies
  (use-package autorevert
    :ensure t
    :diminish
    :config
    (setq auto-revert-verbose t)
    :hook (after-init-hook . global-auto-revert-mode))

    (setq global-auto-revert-mode t)



  ;; Remplacement de yes/no par y/n
  (fset 'yes-or-no-p 'y-or-n-p)

  ;; Mon identites
  (setq user-full-name "Elies Khedhaouria"
	user-mail-address "elieshanachi@gmail.com")

  ;; Chargement des macros
  (load-file "~/.emacs.d/my_macros.el")


  ;; Acceder aux fichiers de config rapidement
  (defun config-visit ()
    (interactive)
    (find-file "~/.emacs.d/my_init.org"))
  (global-set-key (kbd "C-c e") 'config-visit)


  ;; Recharge rapidement le fichier de config
  (defun config-reload ()
    "Reloads ~/.emacs.d/config.org at runtime"
    (interactive)
    (org-babel-load-file (expand-file-name "~/.emacs.d/my_init.org")))
  (global-set-key (kbd "C-c r") 'config-reload)


  ;; Suppression du message de Demarage
  (setq inhibit-startup-message t)

  ;; Suppression de la barre de defilement
  (scroll-bar-mode -1)

  ;; Suppression de la barre d'outil
  (tool-bar-mode -1)

  ;; Demarrage en plein ecran
  (add-to-list 'default-frame-alist '(fullscreen . maximized))

  ;; Rend visible le curseur
   (use-package beacon
   :ensure
   :diminish
   :config
   (setq beacon-blink-delay 0.1)
   (setq beacon-blink-duration 0.25)
   (setq beacon-size 20))
  (beacon-mode 1) ;; uncomment to activate




  ;; Package pour avoir des icones
  (use-package all-the-icons
  :ensure t)

  ;; Rendre emacs plus moderne (esthetique)
  (use-package spaceline-all-the-icons 
    :after spaceline
    :config (spaceline-all-the-icons-theme))


  (setq spaceline-all-the-icons-icon-set-modified 'toggle)
  (spaceline-all-the-icons-theme 'your-segment-symbol "Wafonga said: Hello World!" 'etc)

  ;; Surligne la ligne du curseur
  (global-hl-line-mode t)
  (set-face-background hl-line-face "gray3") ;; with tangotango theme, the red color is too clingy

  ;; Page d'accueil
  (use-package dashboard
    :ensure t
    :config
    (dashboard-setup-startup-hook)
    (setq dashboard-startup-banner "~/.emacs.d/img/iron3.png") ;; vous
    ;; pouvez changer l'image...
    (setq dashboard-items '((recents  . 7)
			    (bookmarks . 5)
			    (agenda . 5)
			    (registers . 5)
			    (projects . 5)))
    (setq dashboard-banner-logo-title " WeWeee le saaaang!")
    (setq dashboard-set-heading-icons t)
    (setq dashboard-set-file-icons t)
    (setq dashboard-set-navigator t)

  (dashboard-modify-heading-icons '((recents . "file-text")
				    (bookmarks . "book")))

  (setq dashboard-footer-messages '("Dashboard is pretty cool!"))
  (setq dashboard-footer-icon (all-the-icons-octicon "dashboard"
						     :height 1.1
						     :v-adjust -0.05
						     :face 'font-lock-keyword-face))
  )

  ;; Numero de lignes a gauche
  (global-linum-mode 1)


  ;; delimiteurs () {} []
  (use-package rainbow-delimiters
    :ensure t
    :init
      (add-hook 'org-mode-hook #'rainbow-delimiters-mode)
      (add-hook 'latex-mode-hook #'rainbow-delimiters-mode)
      (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
     :diminish)
  (show-paren-mode 1)


  ;; fermeture automatiques
  (setq electric-pair-pairs '(
			     (?\{ . ?\})
			     (?\( . ?\))
			     (?\[ . ?\])
			     (?\" . ?\")
			     (?\~ . ?\~)
			     ))
  (electric-pair-mode t) 

  ;; reecriture sur selection
  (delete-selection-mode t)

  ;; Aide au controle clavier
  (use-package which-key
    :ensure t
    :config (which-key-mode)
    :diminish)  




  ;; Numeros de fenetres s'affiche pour un nombre de fenetres superieurs ou egale a 3
  (use-package ace-window
    :ensure t
    :init (progn (global-set-key [remap other-window] 'ace-window)
		 (custom-set-faces
		  '(aw-leading-char-face
		    ((t (:inherit ace-jump-face-foreground :height 7.0))))))
    :diminish)

  ;; Permettre d'executer du code dans un fichier org
  (org-babel-do-load-languages
     'org-babel-load-languages
     '((ditaa      . t)
       (C          . t)
       (dot        . t)
       (emacs-lisp . t)
       (scheme     . t)
       (gnuplot    . t)
       (haskell    . t)
       (latex      . t)
       (js         . t)
       (ledger     . t)
       (matlab     . t)
       (ocaml      . t)
       (octave     . t)
       (plantuml   . t)
       (python     . t)
       (R          . t)
       (ruby       . t)
       (screen     . nil)
       (scheme     . t)
       (shell      . t)
       (sql        . t)
       (sqlite     . t)))
  (setq org-babel-python-command "python3")

  ;; Ameliorations des puces... (orgs)
  (use-package org-bullets
      :ensure t
      :config  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
      :diminish)
  (setq org-bullets-bullet-list '("■" "◆" "▲" "▶")) ;; If you want to change
  ;;    the symbols, but I like the defaults


  ;; Remplacement des ... en un truc plus jolie
  (setq org-ellipsis " ⬎")

  ;; Indentation en place pour les blocs de code dans org
  (setq org-src-tab-acts-natively t)

  ;; Permet d'exporter du org

  (use-package ox-reveal
     :ensure t)

  (setq org-reveal-root "http://cdn.jsdelivr.net/npm/reveal.js")
  (setq org-reveal-mathjax t)

   ;; Autocompletion c/c++

  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'objc-mode-hook 'irony-mode)

  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

  

  ;; Predit pour la gestion des parentheses
  ;; Paredit pour la gestion des parenthéses en lisp
  ;; setup paredit
  (use-package paredit
    :ensure t
    :init
    (dolist (hook '(emacs-lisp-mode-hook lisp-mode-hook clojure-mode-hook scheme-mode-hook))
      (add-hook hook 'paredit-mode))
    :diminish paredit-mode)

  ;; Couleurs
  (use-package xterm-color
    :ensure t
    :config
    (setq comint-output-filter-functions
	  (remove 'ansi-color-process-output comint-output-filter-functions))

    (add-hook 'shell-mode-hook
	      (lambda () (add-hook 'comint-preoutput-filter-functions
				   'xterm-color-filter nil t))))

  ;; html
  (use-package htmlize
    :ensure t)

  ;; Outils de base pour le html
  (use-package web-mode
    :ensure t
    :config
    (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.vue?\\'" . web-mode))
    (setq web-mode-engines-alist
	  '(("django"    . "\\.html\\'")))
    (setq web-mode-ac-sources-alist
	  '(("css" . (ac-source-css-property))
	    ("vue" . (ac-source-words-in-buffer ac-source-abbrev))
	    ("html" . (ac-source-words-in-buffer ac-source-abbrev))))
    (setq web-mode-enable-auto-closing t))
  (setq web-mode-enable-auto-quoting t)

  ;; ditaaa
  (setq org-ditaa-jar-path "/usr/bin/ditaa")
