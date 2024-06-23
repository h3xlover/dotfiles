(add-hook 'text-mode-hook 'visual-line-mode)
(defalias 'yes-or-no-p 'y-or-n-p)
(setq inhibit-startup-screen t)
(setq scroll-conservatively 100)
(setq make-backup-files nil)
(setq create-lockfiles nil)
(setq auto-save-default nil)
(setq ring-bell-function 'ignore)
(set-frame-font "Iosevka 10" nil t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(global-set-key (kbd "C-x C-<up>") 'shrink-window)
(global-set-key (kbd "C-x C-<down>") 'enlarge-window)
(global-set-key (kbd "C-x C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "C-x C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "<prior>") 'good-scroll-down)
(global-set-key (kbd "<next>") 'good-scroll-up)
(global-set-key (kbd "C-S-n") 'good-scroll-up)
(global-set-key (kbd "C-S-p") 'good-scroll-down)
;; kill all buffers except for current 
(defun kill-all-other-buffer ()
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

;; reload config
(defun config-reload ()
  (interactive)
  (org-babel-load-file (expand-file-name "~/.emacs.d/config.org")))

;; smooth scrolling
(setq pixel-scroll-precision-large-scroll-height 40.0)
(pixel-scroll-mode 1)
(good-scroll-mode 1)
(setq mouse-wheel-progressive-speed nil)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(use-package rmsbolt)

(use-package ewal
  :init (setq ewal-use-built-in-always-p nil
	      ewal-use-built-in-on-failure-p t))
(use-package ewal-spacemacs-themes
  :config (progn
	    (load-theme 'ewal-spacemacs-modern t)
	    (enable-theme 'ewal-spacemacs-modern)))
;; config-reload command via sway config

;;  (use-package tron-legacy-theme
;;  :config
;;  (load-theme 'tron-legacy t))

(use-package which-key
  :ensure t
  :init (which-key-mode))

(setq ido-enable-flex-matching nil)
(setq ido-create-new-buffer 'always)
(setq ido-everywhere t)
(ido-mode 1)
(use-package ido-vertical-mode
  :ensure t
  :init
  (ido-vertical-mode 1))
(setq ido-vertical-define-keys 'C-n-and-C-p-only)
(global-set-key (kbd "C-x b") 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ido-switch-buffer)
(setq ibuffer-expert t)

(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))

(use-package avy
:ensure t
:bind
("M-s" . avy-goto-char-2))

(use-package ace-window
  :ensure t
  :config
  (setq aw-background nil)
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)))
(global-set-key (kbd "M-o") 'ace-window)

(use-package swiper)
(global-set-key "\C-s" 'swiper)

(use-package ivy)
(ivy-mode)

(use-package org
  :config
  (setq org-log-done-with-time nil)
  (setq org-log-done nil)
  (setq org-log-repeat nil)
  (setq org-ellipsis " ▾")
  (setq org-directory "~/org")
  (setq org-agenda-files '("roadmap/todo.org" "roadmap/math.org" "roadmap/comp.org" "roadmap/hardware.org" "roadmap/physics.org"))
  (setq org-refile-targets
	'(("archive.org" :maxlevel . 1)))
  (advice-add 'org-refile :after 'org-save-all-org-buffers)
  (setq org-todo-keywords
	'((sequence "TODO(t)" "BOOK(b)" "NEXT(n)" "|" "DONE(d)")))
(add-to-list 'org-structure-template-alist '("em" . "src emacs-lisp"))
:bind
(("C-c a" . org-agenda)
 ("C-c c" . calendar)))

(use-package org-journal
  :config
  (setq org-journal-dir "~/org/journal")
  :bind
  (("C-c j o" . org-journal-new-entry)))

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

(use-package elfeed-org)
(use-package elfeed
:config
(setq rmh-elfeed-org-files (list "~/org/elfeed.org")))
(elfeed-org)

(use-package latex-preview-pane
:load-path "~/dotfiles/emacs/latex-preview-pane"
)

(use-package org-roam
:ensure t
:custom
(org-roam-directory "~/org/roam")
:bind (("C-c n l" . org-roam-buffer-toggle)
       ("C-c n f" . org-roam-node-find)
       ("C-c n i" . org-roam-node-insert)
       ("C-c n o" . org-roam-ui-mode))
:config
(org-roam-setup)
(setq org-roam-ui-open-on-start nil))

(use-package org-download)

(org-roam-ui-mode)
(org-agenda-list)
(org-agenda-day-view)
(delete-other-windows)
