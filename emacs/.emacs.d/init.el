(put 'downcase-region 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("eab123a5ed21463c780e17fc44f9ffc3e501655b966729a2d5a2072832abd3ac" "821c37a78c8ddf7d0e70f0a7ca44d96255da54e613aa82ff861fe5942d3f1efc" "7fd8b914e340283c189980cd1883dbdef67080ad1a3a9cc3df864ca53bdc89cf" "bbb13492a15c3258f29c21d251da1e62f1abb8bbd492386a673dcfab474186af" "edf5e3ea8b3bbb4602feef2dfac8a6d5dae316fb78e84f360d55dfda0d37fa09" "e28d05d3fdc7839815df9f4e6cebceb4a0ca4ed2371bee6d4b513beabee3feb7" "0d09f49e81c811f4a661ff63b82d2b812ce034aed336903922b06362b8cb0bbe" "79586dc4eb374231af28bbc36ba0880ed8e270249b07f814b0e6555bdcb71fab" default))
 '(org-agenda-files
   '("/home/g/org/roadmap/todo.org" "/home/g/org/tasks/birth.org" "/home/g/org/roadmap/roadmap.org" "/home/g/org/roadmap/math.org" "/home/g/org/roadmap/comp.org" "/home/g/org/roadmap/hardware.org" "/home/g/org/roadmap/physics.org"))
 '(package-selected-packages
   '(org-roam-ui org-roam ement calfw-org calfw-cal calfw rmsbolt ewal-spacemacs-themes ewal evm helm good-scroll org-journal org-download latex-preview-pane elfeed-org org-bullets org-ql tron-legacy-theme swiper ivy ace-window avy ido-vertical-mode nov exwm which-key darcula-theme use-package))
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





