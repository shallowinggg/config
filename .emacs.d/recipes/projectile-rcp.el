;;; projectile-rcp.el --- Project manager for emacs

;;; Code:
(eval-when-compile (require 'use-package))
(use-package projectile
  :ensure t
  :config
  (projectile-mode)
  :bind
  ("C-c p" . projectile-command-map)
  )

(provide 'projectile-rcp)

;;; Commentary:
;; Local Variables:
;; byte-compile-warnings: (not unresolved free-vars)
;; End:
;;; projectile-rcp.el ends here
