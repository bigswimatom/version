;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;  version.el -- 
;;;	author: nakai <bigswim.atom@gmail.com>
;;;	create day: Thu Sep 26 16:42:55 2002    
;;;     last updated: Mon Jul 10 09:42:14 2017
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun lastvarsion-file nil
  "last Update: "
  (interactive)
  (let ()
    (save-excursion
      (goto-char (point-min))
      (while (re-search-forward
              "\\\$version ?= ?\\([0-9.]*\\)?;$" nil t)
	(setq version (string-to-number (buffer-substring-no-properties
		       (match-beginning 1) (match-end 1))))
	
        (replace-match
	 (concat "$version = " (number-to-string (+ version 0.01)) ";") nil t)
	))))
(add-hook 'write-file-hooks 'lastvarsion-file)
