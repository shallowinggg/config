;;; js-rcp.el --- Javascript support

;;; Code:

(eval-when-compile (require 'use-package))
(use-package js2-mode
  :ensure t
  :mode "\\.js\\'"
  :hook
  (go-mode . (lambda()
               (add-hook 'before-save-hook #'lsp-format-buffer t t)
               (add-hook 'before-save-hook #'lsp-organize-imports t t)
               (lsp-deferred)
               ))

  )

(provide 'js-rcp)
;;; Commentary:
;; Local Variables:
;; byte-compile-warnings: (not unresolved free-vars)
;; End:
;;; js-rcp.el ends here
