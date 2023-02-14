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
  :bind
  ("C-x a s" . sort-lines)
  ("C-x a d" . delete-trailing-whitespace)
  ;; keybindings from functions_my.el file
  ([M-S-up] . vd/move-line-up)
  ([M-S-down] . vd/move-line-down)
  ("C-x C-d" . vd/duplicate-line)
  ("C-c C-k" . vd/copy-line)
  ("C-c C-w" . vd/copy-word)
  ("C-d" . vd/delete-line)
  ("C-o" . vd/open-next-line)
  ("C-x C-x" . vd/kill-emacs-with-save)
  ("C-c o" . vd/open-previous-line)
)

(use-package display-line-numbers
  :demand t
  :custom
  (display-line-numbers-type t)
  :config
  (global-display-line-numbers-mode t)
)

(use-package windmove
  :defer t
  :ensure nil
  :init
  (windmove-default-keybindings)
  :custom
  (windmove-wrap-around t)
)

(provide 'base-rcp)
;;; Commentary:
;; Local Variables:
;; byte-compile-warnings: (not unresolved free-vars)
;; End:
;; Configuration for base Emacs without packages
;;; base-rcp.el ends here
