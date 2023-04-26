(put 'downcase-region 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("79586dc4eb374231af28bbc36ba0880ed8e270249b07f814b0e6555bdcb71fab" default))
 '(org-agenda-files '("/home/g/org/tasks/tasks.org"))
 '(package-selected-packages
   '(latex-preview-pane elfeed-org org-bullets org-ql tron-legacy-theme swiper ivy ace-window avy ido-vertical-mode nov exwm which-key darcula-theme use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(eval-when-compile
    ;; Following line is not needed if use-package.el is in ~/.emacs.d
      (add-to-list 'load-path "/home/g/.emacs.d/elpa/use-package-2.4.5")
        (require 'use-package))





;;;;;;

(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))

;; (setq ring-bell-function 'ignore)





