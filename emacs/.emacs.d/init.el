(put 'downcase-region 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("edf5e3ea8b3bbb4602feef2dfac8a6d5dae316fb78e84f360d55dfda0d37fa09" "e28d05d3fdc7839815df9f4e6cebceb4a0ca4ed2371bee6d4b513beabee3feb7" "0d09f49e81c811f4a661ff63b82d2b812ce034aed336903922b06362b8cb0bbe" "79586dc4eb374231af28bbc36ba0880ed8e270249b07f814b0e6555bdcb71fab" default))
 '(org-agenda-files
   '("~/org/tasks/birth.org" "~/org/roadmap/roadmap.org" "~/org/roadmap/math.org" "~/org/roadmap/comp.org" "~/org/roadmap/hardware.org" "~/org/roadmap/physics.org"))
 '(package-selected-packages
   '(rmsbolt ewal-spacemacs-themes ewal evm helm good-scroll org-journal org-download org-roam-ui org-roam latex-preview-pane elfeed-org org-bullets org-ql tron-legacy-theme swiper ivy ace-window avy ido-vertical-mode nov exwm which-key darcula-theme use-package))
 '(warning-suppress-log-types '((websocket))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(eval-when-compile
    ;; Following line is not needed if use-package.el is in ~/.emacs.d
      (add-to-list 'load-path "~/.emacs.d/elpa/use-package-2.4.5")
        (require 'use-package))





;;;;;;
(server-start)
(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))

;; (setq ring-bell-function 'ignore)





