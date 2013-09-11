;; Use spaces instead of tabs
(setq-default indent-tabs-mode nil)
;; Turns on syntax highlighting.
(global-font-lock-mode t)
;; Sets the syntax highlighting to the maximum amount of colorization.
(setq font-lock-maximum-decoration t)
;; Do not make backup recovery files when editing.
(setq make-backup-files nil)
;; Use Shift + the arrow keys to move between windows in a frame
(when (fboundp 'windmove-default-keybindings)
            (windmove-default-keybindings))
;; Part II. Configure Emacs as a great C++ IDE
;; Include the C/C++ mode Elisp package
(require 'cc-mode)
;; In versions of Emacs greater than 23.2, do the following
(when (or (> emacs-major-version 23)
                (and (= emacs-major-version 23)
                     (>= emacs-minor-version 2)))
 ;; Use the GDB visual debugging mode
 (setq gdb-many-windows t)
 ;; Turn Semantic on
 (semantic-mode 1)
 ;; Try to make completions when not typing
 (global-semantic-idle-completions-mode 1)
 ;; Use the Semantic speedbar additions
 (add-hook 'speedbar-load-hook (lambda () (require 'semantic/sb))))
;; Treat .h files as C++ files (instead of C)
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
;; Use the indentation style of "The C++ Programming Language"
(setq c-default-style "stroustrup")
;; Run compile when you press F5
(global-set-key (kbd "<f5>") 'compile)

(c-set-offset 'inline-open 0)
(c-set-offset 'friend '-)
(c-set-offset 'substatement-open 0)

(defun my-c-mode-common-hook()
  (setq tab-width 4 indent-tabs-mode nil)
  (c-toggle-auto-hungry-state 1)
  (define-key c-mode-base-map [(control \`)] 'hs-toggle-hiding)
  (define-key c-mode-base-map [(return)] 'newline-and-indent)
  (define-key c-mode-base-map [(meta \`)] 'c-indent-command)
  (define-key c-mode-base-map [(tab)] 'my-indent-or-complete)
  (define-key c-mode-base-map [(meta ?/)] 'semantic-ia-complete-symbol-menu)
  (setq c-macro-shrink-window-flag t)
  (setq c-macro-preprocessor "cpp")
  (setq c-macro-cppflags " ")
  (setq c-macro-prompt-flag t)
  (setq hs-minor-mode t)
  (setq abbrev-mode t)
)
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

