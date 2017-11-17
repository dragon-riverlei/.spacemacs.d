;; Additional packages configuration
(use-package key-chord
  :defer t
  :init
  (setq key-chord-two-keys-delay 0.5)
  (key-chord-define evil-hybrid-state-map "jj" 'evil-normal-state)
  (key-chord-mode 1))

;; JavaScript layer customization
(setq-default js2-basic-offset 4)
(setq-default js-indent-level 4)
(setq-default js2-bounce-indent-p t)

;; org layer customization
(require 'my_org)

;; my functions
(require 'my_func)

(setq ispell-program-name "/usr/local/bin/aspell")
(global-set-key (kbd "C-x C-<tab>") 'my/aj-toggle-fold)

(provide 'my)
