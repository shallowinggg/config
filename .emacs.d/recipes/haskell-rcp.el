;;; haskell-rcp.el --- Haskell Support

;;; Code:
(eval-when-compile (require 'use-package))

(use-package haskell-mode
  :ensure t
)

(use-package lsp-haskell
  :ensure t
  :init
  (add-hook 'haskell-mode-hook #'lsp)
  (add-hook 'haskell-literate-mode-hook #'lsp)
  )

(provide 'haskell-rcp)

;;; Commentary:
;;; haskell-rcp.el ends here
