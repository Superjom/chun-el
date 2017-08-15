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


;; youdao translate
(defvar chun-youdao-translate-appid "17ea0374e10001a5")
(defvar chun-youdao-translate-secret-key "N7spl1iwV1RhLfzIOM2n3GNg2XewrJdv")
(defconst chun-youdao-translate-api-url "http://openapi.youdao.com/api")

(defun md5sum (str)
  "generate md5 secure key for a string"
  (let*
      ((cmd (format "md5 -s \"%s\"" str))
       (shell-res (shell-command-to-string cmd))
       (str-start-index (length (format "MD5 (\"%s\") = " str)))
       (res))
    (substring shell-res str-start-index (length shell-res))))

(defun chun-youdao-generate-request-command
    (q from to)
  (let* ((salt (random t))
         (str (format "%s%s%d%s" chun-youdao-translate-appid q salt chun-youdao-translate-secret-key))
         (md5-key (shell-command-to-string "md5sum"))
         )
    (message "str: %s" str)
    ))

(chun-youdao-generate-request-command "hello" "auto" "en")

