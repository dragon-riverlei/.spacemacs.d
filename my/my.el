;; Additional packages configuration
(use-package key-chord
  :defer t
  :init
  (setq key-chord-two-keys-delay 0.5)
  (key-chord-define evil-hybrid-state-map "jj" 'evil-normal-state)
  (key-chord-mode 1))

;; Common lisp layer customization
(setq inferior-lisp-program "/cygdrive/c/installed/sbcl/sbcl.exe")

;; JavaScript layer customization
(setq-default js2-basic-offset 4)
(setq-default js-indent-level 4)
(setq-default js2-bounce-indent-p t)

;; org layer customization
(require 'my_org)

(provide 'my)
