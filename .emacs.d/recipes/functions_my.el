;;;###autoload
;;; Code:

(defun vd/duplicate-line()
  "Duplicate whole line."
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (forward-line 1)
  (yank)
  )

;;;###autoload
(defun vd/copy-line (arg)
  "Copy lines (as many as prefix ARG) in the kill ring."
  (interactive "p")
  (kill-ring-save (line-beginning-position)
                  (line-beginning-position (+ 1 arg)))
  (message "%d line%s copied" arg (if (= 1 arg) "" "s")))

;;;###autoload
(defun vd/delete-line ()
  "Delete text from begin to end of line char."
  (interactive)
  (kill-region
   (move-beginning-of-line 1)
   (save-excursion (move-end-of-line 1) (point)))
  (delete-char 1)
  )

(defvar newline-and-indent t)

;;;###autoload
(defun vd/open-next-line ()
  "Open new line (vi's o command)."
  (interactive)
  (end-of-line)
  (open-line 1)
  (forward-line 1)
  (when newline-and-indent
    (indent-according-to-mode)))

;;;###autoload
(defun vd/open-previous-line (arg)
  "Open a new line before the current one.
See also `newline-and-indent'.  Behave like vi's O command.  With optional ARG."
  (interactive "p")
  (beginning-of-line)
  (open-line arg)
  (when newline-and-indent
    (indent-according-to-mode)))

;;;###autoload
(defun vd/kill-emacs-with-save ()
  "Kill terminal."
  (interactive)
  (save-buffers-kill-terminal "y")
  )

;;;###autoload
(defun vd/kill-other-buffers ()
    "Kill all other buffers."
    (interactive)
    (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))


(provide 'functions_my)
