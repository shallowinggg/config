;;; base-rcp.el --- Emacs default configuration

;;; Code:
(eval-when-compile (require 'use-package))
(use-package emacs
  :demand t
  :custom
  (display-time-24hr-format     t)
  (display-time-mode            t)
  (indent-tabs-mode             nil)
  (js-indent-level              2)
  (resize-mini-windows        t)
)

(provide 'base-rcp)
;;; Commentary:
;; Local Variables:
;; byte-compile-warnings: (not unresolved free-vars)
;; End:
;; Configuration for base Emacs without packages
;;; base-rcp.el ends here
