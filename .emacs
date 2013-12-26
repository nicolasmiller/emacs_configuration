(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq-default py-indent-offset 2)
(setq-default c-basic-offset 2)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tango-dark)))
 '(custom-safe-themes (quote ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default)))
 '(python-guess-indent nil)
 '(python-indent 2))

(defun shell-named (name)
  (shell)
  (rename-buffer name)
  (process-kill-without-query (get-buffer-process name)))

(defmacro hot-shell (name)
  `(lambda () (interactive)
     (if (get-buffer ,name) (switch-to-buffer ,name)
       (shell-named ,name))))

(global-set-key [(meta ?1)] (hot-shell "*shell1*"))
(global-set-key [(meta ?2)] (hot-shell "*shell2*"))
(global-set-key [(meta ?3)] (hot-shell "*shell3*"))
(global-set-key [(meta ?4)] (hot-shell "*shell4*"))
(global-set-key [(meta ?5)] (hot-shell "*shell5*"))
(global-set-key [(meta ?6)] (hot-shell "*shell6*"))
(global-set-key [(meta ?7)] (hot-shell "*shell7*"))
(global-set-key [(meta ?8)] (hot-shell "*shell8*"))
(global-set-key [(meta ?9)] (hot-shell "*shell9*"))
(global-set-key [(meta ?0)] (hot-shell "*shell0*"))

(setq comint-process-echoes t)
(put 'erase-buffer 'disabled nil)

(defun duplicate-line ()
  (interactive)
  (let ((text (buffer-substring (line-beginning-position) (line-end-position))))
    (move-end-of-line 1)
    (newline)
    (insert text)))

(set-face-attribute 'default nil
                    :family "Source Code Pro" :height 110 :weight 'normal)

(tool-bar-mode -1)
(scroll-bar-mode -1)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(defun toggle-fullscreen ()
  "Toggle full screen"
  (interactive)
  (set-frame-parameter
     nil 'fullscreen
     (when (not (frame-parameter nil 'fullscreen)) 'fullboth)))

;; Keybonds
(global-set-key [(hyper a)] 'mark-whole-buffer)
(global-set-key [(hyper v)] 'yank)
(global-set-key [(hyper c)] 'kill-ring-save)
(global-set-key [(hyper s)] 'save-buffer)
(global-set-key [(hyper l)] 'goto-line)
(global-set-key [(hyper w)]
                (lambda () (interactive) (delete-window)))
(global-set-key [(hyper z)] 'undo)
(global-set-key [(hyper return)] 'toggle-fullscreen)

(setq mac-option-modifier 'hyper)
(setq mac-command-modifier 'meta)

;; mac switch meta key
(defun mac-switch-meta nil 
  "switch meta between Option and Command"
  (interactive)
  (if (eq mac-option-modifier nil)
      (progn
        (setq mac-option-modifier 'hyper)
        (setq mac-command-modifier 'meta)
        )
    (progn 
      (setq mac-option-modifier nil)
      (setq mac-command-modifier 'hyper)
      )
   )
)

(add-to-list 'load-path "./.emacs.d/custom")
(add-to-list 'custom-theme-load-path "./.emacs.d/themes")
(load-theme 'solarized-light t)
(set-face-bold-p 'bold nil)

(mapc
 (lambda (face)
   (set-face-attribute face nil :weight 'normal :underline nil))
 (face-list))
  
(setq make-backup-files nil)
(setq auto-save-default nil)

(setq partial-completion-mode t)

(global-set-key "\C-x\C-b" 'buffer-menu)
(put 'set-goal-column 'disabled nil)

(setq visible-bell t)

(delete-selection-mode 1)
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(setq default-process-coding-system '(utf-8-unix . utf-8-unix))
(put 'downcase-region 'disabled nil)

;;(setq inferior-lisp-program "/opt/local/bin/sbcl") ; your Lisp system
;;(add-to-list 'load-path "~/slime")  ; your SLIME directory
;;(require 'slime)
;;(slime-setup)
