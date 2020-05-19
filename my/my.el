;; ;; Additional packages configuration
(use-package key-chord
  :defer t
  :init
  (setq key-chord-two-keys-delay 0.5)
  (key-chord-define evil-hybrid-state-map "jj" 'evil-normal-state)
  (key-chord-mode 1))

;; javascript layer customization
(require 'my_javascript)

;; org layer customization
(require 'my_org)

;; my functions
(require 'my_func)

;; my wechat mini program
(require 'my_wechat_mini)

;; my indent
(require 'my_indent)

;; my go-lang
(require 'my_go_lang)

(setq ispell-program-name "/usr/local/bin/aspell")
;; (global-set-key (kbd "C-x C-<tab>") 'my/aj-toggle-fold)
(global-set-key (kbd "C-c C-w s") 'treemacs-switch-workspace)

(setq spacemacs-default-jump-handlers
      (remove 'evil-goto-definition spacemacs-default-jump-handlers))
;;(setq omnisharp-server-executable-path "/Users/i062289/Green/omnisharp-osx/run")

(persistent-scratch-setup-default)

(setq tramp-default-method "ssh")


;;(add-to-list 'auto-mode-alist '("\\.jl\\'" . fundmental-mode))

(cnfonts-enable)
(cnfonts-set-spacemacs-fallback-fonts)
(server-start)

;; (defvar lou-the-gc-max (* 512 1024 1024)
;;   "Maximum Size of garbage collector.  Half gig seems reasonable.
;; This value is basically not sane.")

;; (defvar lou-the-gc-sane (car (get 'gc-cons-threshold 'standard-value))
;;   "Sane GC Value, straight from The Yaks Mouth.")

;; (defvar lou-is-chatty t
;;   "Whether or not Lou is chatty about debug messages")

;; (defun lou-the-gc-go-crazy ()
;;   "Tell Lou the garbage collector to use maximum garbage size"
;;   (when lou-is-chatty
;;     (with-current-buffer (messages-buffer)
;;       (let ((inhibit-read-only t))
;;         (goto-char (point-max))
;;         (insert "\nLou is going crazy!"))))
;;   (setq gc-cons-threshold lou-the-gc-max))

;; (defun lou-the-gc-be-sane ()
;;   "Tell Lou to stop acting crazy and use a sane garbage collection ammount"
;;   (when lou-is-chatty
;;     (with-current-buffer (messages-buffer)
;;       (let ((inhibit-read-only t))
;;         (goto-char (point-max))
;;         (insert "\nLou is sane again."))))

;;   (setq gc-cons-threshold lou-the-gc-sane))

;; (unless after-init-time
;;   (lou-the-gc-go-crazy)
;;   (add-hook 'emacs-startup-hook #'lou-the-gc-be-sane t))

;; (add-hook 'minibuffer-setup-hook #'lou-the-gc-go-crazy)
;; (add-hook 'minibuffer-exit-hook #'lou-the-gc-be-sane)

(provide 'my)
