;; Melpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; Line numbers & relative numbers
(add-hook 'prog-mode-hook #'display-line-numbers-mode)
(setq display-line-numbers 'relative)

;; Sound
(setq ring-bell-function 'ignore)

;; Backup management
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))

(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)

;; Font
(add-to-list 'default-frame-alist '(font . "Iosevka Comfy-14"))
(set-face-attribute 'default t :font "Iosevka Comfy-14")

;; Theme

;; Modus
(use-package modus-themes
  :ensure t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("0af489efe6c0d33b6e9b02c6690eb66ab12998e2649ea85ab7cfedfb39dd4ac9" default))
 '(package-selected-packages
   '(prettier-js magit treemacs-icons-dired treemacs-icons-dired-mode dired-icon nerd-icons councel-mode projectile docker-compose-mode dockerfile-mode groovy-mode ivy-mode ido-vertical-mode lsp-ivy dap-mode lsp-treemacs lsp-ui ivy lsp-mode treemacs all-the-icons doom-themes php typescript yasnippet-snippets yasnippet company flycheck helm modus-themes)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Ido
(ido-mode 1)

(use-package smex
  :ensure t
  :bind
  ("M-x" . smex))

;; Errors
(use-package flycheck
  :ensure t
  :init
  (add-hook 'prog-mode-hook #'flycheck-mode))

;; Git
(use-package magit
  :ensure t)

;; Autocompletion
(use-package company
  :ensure t
  :hook prog-mode)

;; Snippet
(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode t))
(use-package yasnippet-snippets
  :ensure t)

(use-package popup
  :ensure t
  :config
  (define-key popup-menu-keymap (kbd "M-n") 'popup-next)
  (define-key popup-menu-keymap (kbd "TAB") 'popup-next)
  (define-key popup-menu-keymap (kbd "<tab>") 'popup-next)
  (define-key popup-menu-keymap (kbd "<backtab>") 'popup-previous)
  (define-key popup-menu-keymap (kbd "M-p") 'popup-previous)
  (defun yas-popup-isearch-prompt (prompt choices &optional display-fn)
    (when (featurep 'popup)
      (popup-menu*
       (mapcar
	(lambda (choice)
	  (popup-make-item
	   (or (and display-fn (funcall display-fn choice))
	       choice)
	   :value choice))
	:prompt prompt
	:isearch t
	)))
    (setq yas-prompt-functions '(yas-popup-isearch-prompt yas-maybe-ido-prompt yas-completing-prompt yas-no-prompt))))


(use-package typescript-mode
  :ensure t
  :config
  (add-hook 'after-save-hook 'prettier-js))

(use-package php-mode
  :ensure t)

(use-package web-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))
  (setq web-mode-enable-auto-pairing t)
  (setq web-mode-enable-css-colorization t)
  (add-hook 'after-save-hook 'prettier-js))

(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-tokyo-night t))

;;treesit
(setq treesit-language-source-alist
      '((php "https://github.com/tree-sitter/tree-sitter-php" "master" "php/src")
	(typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
	(python "https://github.com/tree-sitter/tree-sitter-python")
	(json "https://github.com/tree-sitter/tree-sitter-json")
	(javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
	(elisp "https://github.com/Wilfred/tree-sitter-elisp")
	(html "https://github.com/tree-sitter/tree-sitter-html")
	(css "https://github.com/tree-sitter/tree-sitter-css")
	(bash "https://github.com/tree-sitter/tree-sitter-bash")
	(cmake "https://github.com/uyha/tree-sitter-cmake")
	(toml "https://github.com/tree-sitter/tree-sitter-toml")
	(tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
	(yaml "https://github.com/ikatyang/tree-sitter-yaml")
	(make "https://github.com/alemuller/tree-sitter-make")
	(markdown "https://github.com/ikatyang/tree-sitter-markdown")
	(vue "https://github.com/ikatyang/tree-sitter-vue" "master" "src")))

;;(mapc #'treesit-install-language-grammar (mapcar #'car treesit-language-source-alist))


(use-package all-the-icons
  :ensure t
  :if (display-graphic-p))

;; Tab
(use-package centaur-tabs
  :ensure t
  :if window-system
  :demand
  :init
  ;; Set centaur render with icons
  (setq centaur-tabs-style "wave")
  (setq centaur-tabs-set-icons t)
  :config
  (centaur-tabs-mode t))



(use-package treemacs
  :ensure t
  :defer t
  :bind
  (("C-c t" . treemacs))
  :config
  (setq treemacs-width 30)
  (treemacs-project-follow-mode t))

(defun hide-mode-line-in-treemacs ()
  "Hide the mode line in treemacs buffer"
  (setq-local mode-line-format nil))

(add-hook 'treemacs-mode-hook 'hide-mode-line-in-treemacs)
(use-package treemacs-icons-dired
  :ensure t
  :config
  (add-hook 'dired-mode-hook 'treemacs-icons-dired-mode))



;; LSP
(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook ((php-mode . lsp-deferred)
	 (python-mode . lsp-deferred)
	 (css-mode . lsp-deferred)
	 (web-mode . lsp-deferred)
  (typescript-mode . lsp-deferred)
  (javascript-mode . lsp-deferred))
  :commands (lsp lsp-deferred))

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

(use-package lsp-ivy
  :ensure t
  :commands lsp-ivy-workspace-symbol)

(use-package lsp-treemacs
  :ensure t
  :commands lsp-treemacs-errors-list)

(use-package dap-mode
  :ensure t)

(use-package projectile
  :ensure t
  :init (projectile-mode 1)
  :bind
  (("s-p" . projectile-command-map)
   ("C-c p" . projectile-command-map))
  :config
  (setq projectile-require-project-root nil))

(use-package groovy-mode
  :ensure t)

(use-package dockerfile-mode
  :ensure t)

(use-package docker-compose-mode
  :ensure t)

(use-package nerd-icons
  :ensure t)

;; Prettier
(use-package prettier-js
  :ensure t)
