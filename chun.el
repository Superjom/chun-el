(defface chun-lang-hightlight-face
  '((t :foreground "black"
       :background "grey"
       :weight bold
       :underline t))
  "Face to hight light"
  :group 'chun-mode)

(defun chun-wrap-word (c)
  "wrape a word with a token"
  (interactive "cwrap char:")
  (let (pt region-start region-end)
    (skip-chars-backward "-_A-Za-z0-9")
    (setq region-start (point))
    (insert c)
    (skip-chars-forward "-_A-Za-z0-9")
    ;; TODO some bugs here, tells end of buffer
    (setq region-end (point))
    (insert c)
    (forward-char 1)
    ;; (overlay-put (make-overlay region-start (+ 1 region-end)) 'face 'font-lock-type-face)
    (overlay-put (make-overlay region-start (+ 1 region-end)) 'face 'chun-lang-hightlight-face)
    (setq mark-active nil)
    ))

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

