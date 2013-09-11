;;(load "/usr/share/cmake-2.8.11.2/editors/emacs/cmake-mode")

;; Here is a sample .emacs configuration for working with C++.
;; Note that everything after a semicolon is a comment.
;; Part I. Essentials to editing
;; Specify a directory where to load additional Emacs Lisp files.
(add-to-list 'load-path (expand-file-name "~/.emacs.d"))
;;(add-to-list 'load-path (expand-file-name "~/.emacs.d/elpa/autopair-20121123.1829")

(load "cpp")

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
)
(load "autopair")
(load "cedet_setup")
(setq make-backup-files nil)
