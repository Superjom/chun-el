(defun chun-wrap-word (c)
  "wrape a word with a token"
  (interactive "cwrap char:")
  (let (pt)
    (skip-chars-backward "-_A-Za-z0-9")
    (insert c)
    (skip-chars-forward "-_A-Za-z0-9")
    (insert c)
    (forward-char 1)))

(defun chun-insert-date()
  "insert a formated date"
  (interactive)
  (insert (shell-command-to-string "date +%Y-%m-%d")))

(defun chun-monitor()
    "display some information"
  (interactive)
  (with-current-buffer
      (progn
        (insert (format "current position: %d\n" (point)))
        (insert "hello world")
      )
    )
  )


(set-buffer
 (get-buffer-create "*chun*"))

(with-current-buffer (get-buffer-create "chun")
  (insert "hello world")
  )

(buffer-name)

