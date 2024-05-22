(use-package ewal
  :init (setq ewal-use-built-in-always-p nil
	      ewal-use-built-in-on-failure-p t))
(use-package ewal-spacemacs-themes
  :config (progn
	    (load-theme 'ewal-spacemacs-modern t)
	    (enable-theme 'ewal-spacemacs-modern)))
;; config-reload command via sway config
