;; -*-Emacs-Lisp-*-
;; NioNiu .emacs file
;; ~2018
;; -------------------------------------------------------------------------- ;;
(defun system-is-linux()
  "if system linux"
  (string-equal system-type "gnu/linux"))

(defun system-is-windows()
  "if system windows"
  (string-equal system-type "windows-nt"))

(defun reload-init-file ()
  "reload config file"
  (interactive)
  (load-file "~/.emacs"))

(defun swap-buffer ()
  "swap buffers"
  (interactive)
  (cond ((one-window-p) (display-buffer (other-buffer)))
	((let* ((buffer-a (current-buffer))
		(window-b (cadr (window-list)))
		(buffer-b (window-buffer window-b)))
	   (set-window-buffer window-b buffer-a)
	   (switch-to-buffer buffer-b)
	   (other-window 1)))))

(defun comment-or-uncomment-region-or-line ()
  "Comments or uncomments the region or the current line if there's no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
	(setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)))




;; -------------------------------------------------------------------------- ;;
;; path
(when (system-is-windows)
  (setq win-init-path "C:/.emacs.d"))

(when (system-is-linux)
  (setq unix-init-path "~/.emacs.d"))


;; -------------------------------------------------------------------------- ;;
;; cod
(if (system-is-linux)
    (progn
      (setq default-buffer-file-coding-system 'utf-8)
      (setq-default coding-system-for-read 'utf-8)
      (setq file-name-coding-system 'utf-8)
      (set-selection-coding-system 'utf-8)
      (set-keyboard-coding-system 'utf-8-unix)
      (set-terminal-coding-system 'utf-8)
      (prefer-coding-system 'utf-8))
  (progn
    (prefer-coding-system 'windows-1251)
    (set-terminal-coding-system 'windows-1251)
    (set-keyboard-coding-system 'windows-1251-unix)
    (set-selection-coding-system 'windows-1251)
    (setq file-name-coding-system 'windows-1251)
    (setq-default coding-system-for-read 'windows-1251)
    (setq default-buffer-file-coding-system 'windows-1251)))

;; -------------------------------------------------------------------------- ;;
(set-language-environment 'UTF-8) ;; coding-system settings
(setq frame-title-format "emacs -> [%b]") ;; title
(setq inhibit-splash-screen   t) ;; startup
(setq ingibit-startup-message t) ;; startup
(show-paren-mode t)
(setq show-paren-style -1)
(electric-indent-mode -1)
(electric-pair-mode -1)
(delete-selection-mode 1)
(tooltip-mode -1)
(menu-bar-mode -1) ;; gui
(tool-bar-mode -1) ;; gui
(scroll-bar-mode -1) ;; gui
(blink-cursor-mode -1)             ;; cursor
(setq-default cursor-type 'box)    ;; cursor
(setq use-dialog-box -1) ;; gui
;;(set-frame-font "Consolas 9")
;;(set-frame-font "Terminus 10")
(set-frame-font "-*-dejavu sans mono-medium-r-*-*-12-*-*-*-*-*-iso10646-1")
(setq ring-bell-function 'ignore)
(setq redisplay-dont-pause t)
(setq make-backup-files   nil)   ;; backup and autosave
(setq auto-save-default   nil)
(setq auto-save-file-name nil)
(column-number-mode t)
(setq-default indicate-empty-lines -1)
(setq-default indicate-buffer-boundaries 'left)
(setq display-time-24hr-format t)
(display-time-mode -1)
(size-indication-mode -1)
(setq word-wrap          t)
(global-visual-line-mode t)
;;(when (window-system)(set-frame-size (selected-frame) 81 53))
(defalias 'yes-or-no-p 'y-or-n-p)
(global-hl-line-mode 0)               ;; hl
(setq x-select-enable-clipboard t)  ;; clipboard overall with os
(setq auto-fill-mode -1)
(setq next-line-add-newlines  nil)
(setq search-highlight t)
(setq query-replace-highlight  t)
(setq read-quoted-char-radix 10) ;; C-q

;; -------------------------------------------------------------------------- ;;
(require 'linum)
(line-number-mode   t)
(global-linum-mode  -1)
(setq linum-format "%4d")
(global-set-key (kbd "C-c C-l") 'linum-mode)

;; -------------------------------------------------------------------------- ;;
(require 'fringe)
(fringe-mode '(0 . 0))

;; -------------------------------------------------------------------------- ;;
(require 'bs)
(require 'ibuffer)
(defalias 'list-buffers 'ibuffer) ;; C-x C-b

;; -------------------------------------------------------------------------- ;;
(require 'font-lock)
(global-font-lock-mode             t)
(setq font-lock-maximum-decoration t)

;; -------------------------------------------------------------------------- ;;
;; scroll smooth
(setq scroll-step 1)
;; shift when n steps
(setq scroll-margin 2)
(setq scroll-conservatively 100000)

;; -------------------------------------------------------------------------- ;;
(require 'dired)
(setq dired-recursive-deletes 'top)
(setq dired-listing-switches "-alh --group-directories-first")
(setq dired-dwim-target t)
;; keys
(define-key dired-mode-map (kbd "<up>")     (lambda () (interactive) (dired-my-nav-line -1)))
(define-key dired-mode-map (kbd "<down>")   (lambda () (interactive) (dired-my-nav-line 1)))
(define-key dired-mode-map (kbd "DEL")      (lambda () (interactive) (dired-my-nav-line -1)))
(define-key dired-mode-map (kbd "SPC")      (lambda () (interactive) (dired-my-nav-line 1)))
(define-key dired-mode-map (kbd "p")        (lambda () (interactive) (dired-my-nav-line -1)))
(define-key dired-mode-map (kbd "n")        (lambda () (interactive) (dired-my-nav-line 1)))
(define-key dired-mode-map (kbd "<prior>")  (lambda () (interactive) (dired-my-nav-line -10)))
(define-key dired-mode-map (kbd "<next>")   (lambda () (interactive) (dired-my-nav-line 10)))
(define-key dired-mode-map (kbd "RET")      'dired-find-file)
(define-key dired-mode-map (kbd "<right>")  'dired-find-file)
(define-key dired-mode-map (kbd "<left>")   (lambda () (interactive) (find-file "..")))
(define-key dired-mode-map (kbd "TAB")      'dired-my-other-window)
(define-key dired-mode-map (kbd "M-<up>")    nil)
(define-key dired-mode-map (kbd "M-<down>")  nil)
(define-key dired-mode-map (kbd "M-<right>") nil)
(define-key dired-mode-map (kbd "M-<left>")  nil)
(define-key dired-mode-map (kbd "a")         nil)
(define-key dired-mode-map (kbd "^")         nil)
(define-key dired-mode-map (kbd "o")         nil)
(define-key dired-mode-map (kbd "C-SPC")     'dired-my-dush)
;;
(add-hook 'dired-mode-hook 'dired-my-settings)

(defun dired-my-dush ()
  "get size file or dir du -sh"
  (interactive)
  (let ((buf))
    (setq buf (dired-get-marked-files))
    (setq buf (mapconcat 'identity buf " "))
    (setq buf (format "du -sh \'%s\'" buf))
    (message buf)
    (shell-command buf)))
  
(defun dired-my-other-window ()
  "Navigate in dired-mode between window if widow is Dired"
  (interactive)
  (setq mv-this-window (buffer-name))
  (other-window 1)
  (setq mv-other-window (buffer-name))
  (setq mv-other-window-mode mode-name)
  (other-window 1)
  (if (dired-my-other-window-is-dired)
      (other-window 1)
    (message "not dired")))

(defun dired-my-other-window-is-dired ()
  "other window is Dired ?"
  (setq mv-this-window (buffer-name))
  (other-window 1)
  (setq mv-other-window (buffer-name))
  (setq mv-other-window-mode mode-name)
  (other-window 1)
  ;;(switch-to-buffer mv-this-window)
  (if (equal mv-other-window-mode "Dired by name")
      t
    nil))

(defun dired-my-nav-line (arg)
  "Navigate in dired-mode"
  (interactive "p")
  (if (> arg 0)
      ;; down
      (while (> arg 0)
	(dired-my-next-line 1)
	(setq arg (1- arg)))
    ;; up
    (while (< arg 0)
      (dired-my-previous-line 1)
      (setq arg (1+ arg)))
    )
  (let ((buf))
    (setq buf (dired-get-marked-files))
    (setq buf (mapconcat 'identity buf " "))
    (setq buf (format "%s" buf))
    (message buf)))

(defun dired-my-previous-line (arg)
  "Move up lines then position at filename."
  (interactive "p")
  (what-line)
  (max-line)
  ;;(message "Line up: %d %d %d" mv-curline mv-maxline arg)
  (if (> mv-curline 3)
      (setq mv-incline -1)
      (setq mv-incline 0))
  (let ((line-move-visual)
	(goal-column))
    (line-move mv-incline t))
  ;; We never want to move point into an invisible line.
  (while (and (invisible-p (point)) (not (if (and arg (< arg 0)) (bobp) (eobp))))
    (forward-char (if (and arg (< arg 0)) -1 1)))
  (dired-move-to-filename))

(defun dired-my-next-line (arg)
  "Move down lines then position at filename."
  (interactive "p")
  (what-line)
  (max-line)
  ;;(message "Line down: %d %d %d" mv-curline mv-maxline arg)
  (if (< mv-curline (- mv-maxline 1))
      (setq mv-incline 1)
      (setq mv-incline 0))
  (let ((line-move-visual)
	(goal-column))
    (line-move mv-incline t))
  ;; We never want to move point into an invisible line.
  (while (and (invisible-p (point)) (not (if (and arg (< arg 0)) (bobp) (eobp))))
    (forward-char (if (and arg (< arg 0)) -1 1)))
  (dired-move-to-filename))

(defun what-line ()
  "number current string"
  (interactive)
  (save-restriction
    (widen)
    (save-excursion
      (beginning-of-line)
      (setq mv-curline (1+ (count-lines 1 (point)))))))

(defun max-line ()
  "all strings"
  (interactive)
  (save-restriction
    (widen)
    (save-excursion
      (beginning-of-line)
      (setq mv-maxline (1+ (count-lines 1 (point-max)))))))

(defun dired-my-settings ()
  "dired-mode settings"
  (hl-line-mode 1)
  (set (make-local-variable 'line-move-visual) nil)
  (setq cursor-type nil)
  (face-remap-add-relative 'hl-line '((:background "#343434") hl-line)))

(add-hook 'dired-mode-hook '(lambda () (toggle-truncate-lines 1)))
(add-hook 'dired-mode-hook '(lambda () (visual-line-mode 0)))

(put 'dired-find-alternate-file 'disabled nil)

;; -------------------------------------------------------------------------- ;;
(require 'imenu)
(setq imenu-auto-rescan t)
(setq imenu-use-popup-menu nil)

;; -------------------------------------------------------------------------- ;;
(require 'ido)
(ido-mode t)
(setq ido-separator "  ")

;; -------------------------------------------------------------------------- ;;
(require 'package)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-milkbox" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)


;; -------------------------------------------------------------------------- ;;
(require 'eshell)
(setq eshell-history-file-name "~/.emacs.eshell.history")
(setq eshell-history-size 16384)
;;(setq shell-file-name "bash")
;;(setq shell-command-switch "-ic")

(add-hook 'eshell-mode-hook (lambda () (define-key eshell-mode-map (kbd "<up>")     'nil)))
(add-hook 'eshell-mode-hook (lambda () (define-key eshell-mode-map (kbd "<down>")   'nil)))
(add-hook 'eshell-mode-hook (lambda () (define-key eshell-mode-map (kbd "S-<up>")   'nil)))
(add-hook 'eshell-mode-hook (lambda () (define-key eshell-mode-map (kbd "S-<down>") 'nil)))

(defun eshell-my-nothing ()
  ""
  (interactive)
  (message "-"))

(defcustom eshell-banner-message "...::: EMACS SHELL. WELCOME :::...\n\n"
  "The banner message to be displayed when Eshell is loaded.
This can be any sexp, and should end with at least two newlines."
  :type 'sexp
  :group 'eshell-banner)

(defcustom eshell-prompt-function
  (function
   (lambda ()
     (concat (abbreviate-file-name (eshell/pwd))
	     (if (= (user-uid) 0) " # " " > "))))
  "A function that returns the Eshell prompt string.
Make sure to update `eshell-prompt-regexp' so that it will match your
prompt."
  :type 'function
  :group 'eshell-prompt)


(defun eshell-load-bash-aliases ()
  "Reads bash aliases from .bashrc and inserts
    them into the list of eshell aliases."
  (interactive)
  (progn
    (shell-command "cat ~/.bashrc | grep -v grep | grep ^alias" "bash-aliases" "bash-errors")
    (switch-to-buffer "bash-aliases")
    (replace-string "alias " "")
    (goto-char 1)
    (replace-string "='" " ")
    (goto-char 1)
    (replace-string "'\n" "\n")
    (goto-char 1)
    (let ((alias-name) (command-string) (alias-list))
      (while (not (eobp))
	(while (not (char-equal (char-after) 32))
	  (forward-char 1))
	(setq alias-name
	      (buffer-substring-no-properties (line-beginning-position) (point)))
	(forward-char 1)
	(setq command-string 
	      (buffer-substring-no-properties (point) (line-end-position)))
	(setq alias-list (cons (list alias-name command-string) alias-list))
	(forward-line 1))
      (setq eshell-command-aliases-list alias-list))
    (if (get-buffer "bash-aliases")(kill-buffer "bash-aliases"))
    (if (get-buffer "bash-errors")(kill-buffer "bash-errors"))))

(defun eshell-load-bash-env ()
  "Reads bash env from .bashrc and set"
  (interactive)
  (progn
    (shell-command 
     "for i in $(cat ~/.bashrc | grep '^export'); do if [ $i != 'export' ]; then eval \"echo $i\"; fi; done" 
     "bash-env" "bash-errors")
    (switch-to-buffer "bash-env")
    (goto-char 1)
    (replace-string "export " "")
    (goto-char 1)
    (replace-string "=" " ")
    (goto-char 1)
    (let ((par-name) (value-string))
      (while (not (eobp))
	(while (not (char-equal (char-after) 32))
	  (forward-char 1))
	(setq par-name
	      (buffer-substring-no-properties (line-beginning-position) (point)))
	(forward-char 1)
	(setq value-string 
	      (buffer-substring-no-properties (point) (line-end-position)))
	(setenv par-name value-string)
	(forward-line 1)))
    (if (get-buffer "bash-env")(kill-buffer "bash-env"))
    (if (get-buffer "bash-errors")(kill-buffer "bash-errors"))
    ))

(eshell-load-bash-aliases)
(eshell-load-bash-env)
(delete-other-windows)

;; -------------------------------------------------------------------------- ;;
;; themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'nimbus t)


;; -------------------------------------------------------------------------- ;;
(require 'man)
(setq Man-notify-method 'pushy)

;; -------------------------------------------------------------------------- ;;
(global-set-key (kbd "<prior>") (kbd "C-u 20 C-p"))  ;;pageup
(global-set-key (kbd "<next>") (kbd "C-u 20 C-n"))  ;;pagedown
(global-set-key (kbd "C-<tab>") 'eshell)
(global-set-key (kbd "<f1>") nil)
(global-set-key (kbd "<f2>") nil)
(global-set-key (kbd "<f3>") nil)
(global-set-key (kbd "<f4>") nil)
(global-set-key (kbd "<f5>") nil)
(global-set-key (kbd "<f6>") nil)
(global-set-key (kbd "<f7>") nil)
(global-set-key (kbd "<f8>") nil)
(global-set-key (kbd "<f9>") nil)
(global-set-key (kbd "<10>") nil)
(global-set-key (kbd "<12>") nil)
(global-set-key (kbd "C-z") nil)
(global-set-key (kbd "C-c C-e")        'swap-buffer)
(global-set-key (kbd "C-c C-r")        'reload-init-file)
(global-set-key (kbd "C-.")            'comment-or-uncomment-region-or-line)
(global-set-key (kbd "C-x <C-up>")     'other-window)
(global-set-key (kbd "C-x <C-down>")   'other-window)

(put 'upcase-region   'disabled nil)  ;; C-x C-u
(put 'downcase-region 'disabled nil)  ;; C-x C-l


