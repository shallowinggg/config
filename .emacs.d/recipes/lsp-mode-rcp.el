;;; lsp-mode-rcp.el --- Emacs client/library for the Language Server Protocol

;;; Code:
(eval-when-compile (require 'use-package))
(use-package lsp-mode
  :ensure t
  :defer t
  :functions (lsp lsp-deferred lsp-completion-at-point)
  :custom
  ;; (lsp-completion-enable                  t)
  ;; (lsp-completion-show-detail             t)
  ;; (lsp-completion-show-kind               t)
  ;; (lsp-completion-sort-initial-results    t)
  ;; (lsp-diagnostics-provider               :flycheck)
  ;; (lsp-enable-file-watchers               nil)
  ;; (lsp-enable-imenu                       t)
  ;; (lsp-enable-on-type-formatting          nil)
  ;; (lsp-enable-symbol-highlighting         t)
  ;; (lsp-enable-text-document-color         t)
  ;; (lsp-enable-which-key-integration       t)
  ;; (lsp-enable-xref                        t)
  ;; (lsp-file-watch-threshold               1000)
  ;; (lsp-go-use-placeholders                nil)
  ;; (lsp-headerline-breadcrumb-enable       t)
  ;; (lsp-headerline-breadcrumb-icons-enable t)
  ;; (lsp-headerline-breadcrumb-segments     '(project file symbols))
  ;; (lsp-idle-delay                         0.5)
  ;; (lsp-imenu-container-name-separator     t)
  ;; (lsp-imenu-show-container-name          t)
  (lsp-keymap-prefix                      "C-l")
  ;; (lsp-lens-enable                        t)
  ;; (lsp-log-io                             nil)
  ;; (lsp-modeline-code-actions-enable       t)
  ;; (lsp-modeline-code-actions-segments     '(count icon name))
  ;; (lsp-modeline-diagnostics-enable        t)
  ;; (lsp-signature-auto-activate            nil)
  ;; (lsp-use-plists                         t)
  ;; (read-process-output-max                (* 1024 1024)) ;; 1mb
  :config
  (add-to-list 'lsp-language-id-configuration '(k8s-mode . "yaml"))
  (advice-add 'json-parse-string :around
            (lambda (orig string &rest rest)
              (apply orig (s-replace "\\u0000" "" string)
                     rest)))
  (advice-add 'json-parse-buffer :around
            (lambda (oldfn &rest args)
	      (save-excursion
                (while (search-forward "\\u0000" nil t)
                  (replace-match "" nil t)))
		(apply oldfn args)))
  :bind(
        :map lsp-mode-map
        ([remap xref-find-definitions] . lsp-find-definition)
        ([remap xref-find-references]  . lsp-find-references)
        ([remap xref-find-apropos]     . lsp-find-declaration)
        ("C-."                         . lsp-find-implementation)
        )
  :hook ((rust-mode . (lambda()
                        (setq-default lsp-rust-server                              'rust-analyzer
                                      lsp-rust-analyzer-server-display-inlay-hints t
                                      lsp-semantic-tokens-enable                   nil)
                        (lsp-deferred)
                        ))
         (c++-mode       . lsp-deferred)
         (java-mode      . lsp-deferred)
         (js2-mode       . lsp-deferred)
         (scala-mode     . lsp-deferred)
         (terraform-mode . lsp-deferred)
         (sql-mode       . lsp-deferred)
	 (go-mode        . lsp-deferred)
         ;; (vimrc-mode     . lsp-deferred)
         ;; (yaml-mode      . lsp-deferred)
         ;; (sh-mode        . lsp-deferred)
         )
)

(use-package lsp-ui
  :ensure t
  :defer t
  :commands lsp-ui-mode
  :custom
  (lsp-ui-doc-enable                  t)
  (lsp-ui-doc-delay                   1)
  (lsp-ui-doc-show-with-cursor        t)
  (lsp-ui-doc-show-with-mouse         nil)
  ;; (lsp-ui-doc-max-height           3)
  ;; (lsp-ui-doc-max-width            30)
  (lsp-ui-sideline-enable             t)
  (lsp-ui-sideline-show-diagnostics   t)
  (lsp-ui-sideline-show-hover         t)
  (lsp-ui-sideline-show-code-actions  t)
  
    ;; :bind
  ;; (:map lsp-ui-mode-map
  ;;       ([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
  ;;       ([remap xref-find-references]  . lsp-ui-peek-find-references)
  ;;       ([remap xref-go-back]          . lsp-ui-peek-jump-backward)
  ;;       ([remap xref-go-forward]       . lsp-ui-peek-jump-forward)
  ;;       ("C-."                         . lsp-ui-peek-find-implementation)
  ;;       )
)

(use-package dap-mode
  :ensure t
  :commands (dap-hydra go-dap-setup)
  :preface
  (defun go-dap-setup ()
    (interactive)
    (require 'dap-dlv-go)
    (dap-mode 1)
    (dap-ui-mode nil)
    (dap-tooltip-mode nil)
    (dap-ui-controls-mode nil)
    (dap-go-setup)
    (projectile-with-default-dir (projectile-acquire-root)
      (call-interactively 'dap-debug))
  )
  :custom
  (dap-auto-configure-features '(sessions locals breakpoints controls tooltip))
  (dap-ui-variable-length      60)
  (dap-stopped . (lambda (arg) (call-interactively #'dap-hydra)))
)

(use-package f
  :ensure t
)

(provide 'lsp-mode-rcp)
;;; Commentary:
;; Local Variables:
;; byte-compile-warnings: (not unresolved free-vars)
;; End:
;;; lsp-mode-rcp.el ends here
