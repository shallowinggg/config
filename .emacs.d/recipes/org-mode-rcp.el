;;; org-mode-rcp.el --- A GNU Emacs major mode for convenient plain text markup — and much more.

;;; Code:
(eval-when-compile (require 'use-package))
(use-package org
  :ensure t
  :init
  (add-hook 'org-mode-hook (lambda () (display-line-numbers-mode 0)))
)

(use-package org-duration
  :config
  (setq org-duration-units   `(("min" . 1)
   ("h" . 60)
   ("d" . ,(* 60 8))
   ("w" . ,(* 60 8 5))
   ("m" . ,(* 60 8 5 4))
   ("y" . ,(* 60 8 5 4 12))))
  (org-duration-set-regexps))

(use-package org-bullets
  :ensure t
  :after org
  :hook (org-mode . org-bullets-mode)
  )

(use-package org-modern
  :ensure t
  :hook (org-mode . org-modern-mode)
)

(provide 'org-mode-rcp)
;;; Commentary:
;; Local Variables:
;; byte-compile-warnings: (not unresolved free-vars)
;; End:
;;; org-mode-rcp.el ends here
