;;; init.el --- Main init
;;; Code:

;; Disable tool bar, menu bar
;; (tool-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)

;; Highlight current line.
(global-hl-line-mode t)
(set-face-background 'hl-line "gray13")

(setq display-buffer-alist '(("\\`\\*e?shell" display-buffer-below-selected)))

(require 'package)
(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(add-to-list 'load-path (expand-file-name "recipes/" (file-name-directory load-file-name)))

(require 'functions_my)

(require 'base-rcp) ; emacs default settings
(require 'use-package-chords-rcp) ; provide :chords for use-package

(require 'all-the-icons-rcp)
(require 'flycheck-rcp)
(require 'git-rcp)
(require 'highlight-indentation-rcp)
(require 'json-mode-rcp)
(require 'lsp-mode-rcp)
(require 'markdown-mode-rcp)
(require 'yasnippet-rcp)
(require 'company-rcp)
(require 'treemacs-rcp)
(require 'org-mode-rcp)
(require 'projectile-rcp)
(require 'rainbow-rcp)
(require 'which-key-rcp)
(require 'paredit-rcp)

(require 'web-mode-rcp)

(require 'rust-rcp)
(require 'go-rcp)
(require 'haskell-rcp)
(require 'ripgrep-rcp)

(use-package darcula-theme
  :ensure t)
(load-theme 'darcula t)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-insertion-triggers '(32 40 41 119 46 34 36 47 124 33) nil nil "Customized with use-package company")
 '(company-show-quick-access t nil nil "Customized with use-package company")
 '(package-selected-packages
   '(darcula-theme indium highlight-indent-guides treemacs-all-the-icons treemacs-magit treemacs-projectile treemacs-icons-dired yafolding ripgrep flycheck-golangci-lint go-tag flycheck-rust dap-mode lsp-ui lsp-mode json-navigator blamer \
                   git-gutter magit-todos flycheck company-box projectile company rainbow-delimiters use-package)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; Commentary:
;; Main init file
;; Local Variables:
;; byte-compile-warnings: (not unresolved free-vars)
;; End:
;;; init.el ends here
