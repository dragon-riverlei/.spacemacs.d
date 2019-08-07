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

(setq ispell-program-name "/usr/local/bin/aspell")
;; (global-set-key (kbd "C-x C-<tab>") 'my/aj-toggle-fold)

(setq spacemacs-default-jump-handlers
      (remove 'evil-goto-definition spacemacs-default-jump-handlers))
(setq omnisharp-server-executable-path "/Users/i062289/Green/omnisharp-osx/run")

(persistent-scratch-setup-default)

(setq tramp-default-method "ssh")

(setq org-hide-emphasis-markers t)

(add-to-list 'auto-mode-alist '("\\.jl\\'" . fundmental-mode))

(cnfonts-enable)
(cnfonts-set-spacemacs-fallback-fonts)

(provide 'my)
