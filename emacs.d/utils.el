(defun tidy-region (start end)
  "Indent, delete whitespace, and untabify the region."
  (interactive "r")
  (progn
    (delete-trailing-whitespace start end)
    (indent-region start end nil)
    (untabify start end)))

(defun tidy-buffer ()
  "Indent, delete whitespace, and untabify the buffer."
  (interactive)
  (save-excursion
    (tidy-region (point-min) (point-max))))

(defun date ()
  (interactive)
  (insert (format-time-string "%Y-%m-%d")))

(defun time ()
  (interactive)
  (insert (format-time-string "%H:%M:%S")))

(defun view-buffer-name ()
  "Display the filename of the current buffer."
  (interactive)
  (message (buffer-file-name)))

(setq search-engine-url "http://www.google.com/search?ie=utf-8&oe=utf-8&q=")

(defun search-engine ()
  "Search the selected region if any, display a query prompt otherwise."
  (interactive)
  (browse-url
   (concat search-engine-url
    (url-hexify-string (if mark-active
                           (buffer-substring (region-beginning) (region-end))
                         (read-string "Search: "))))))

(defun move-line-up ()
  (interactive)
  (transpose-lines 1)
  (forward-line -2))

(defun move-line-down ()
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1))
