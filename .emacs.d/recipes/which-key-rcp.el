;;; which-key-rcp.el --- Add help for keymapping

;;; Code:
(eval-when-compile (require 'use-package))
(use-package which-key
  :ensure t
  :config
  (which-key-mode)
  :hook prog-mode
  )

(provide 'which-key-rcp)

;;; Commentary:
;; Local Variables:
;; byte-compile-warnings: (not unresolved free-vars)
;; End:
;;; which-key-rcp.el ends here
