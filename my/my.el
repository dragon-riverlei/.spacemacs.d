
(server-start)

;; javascript layer customization
(require 'my_javascript)

;; org layer customization
(require 'my_org_agenda)
(require 'my_org_latex)

;; my functions
(require 'my_func)

;; my wechat mini program
(require 'my_wechat_mini)

;; my indent
(require 'my_indent)

;; my go-lang
(require 'my_go_lang)

(setq ispell-program-name "/usr/local/bin/aspell")
(global-set-key (kbd "C-c C-w s") 'treemacs-switch-workspace)

(setq spacemacs-default-jump-handlers
      (remove 'evil-goto-definition spacemacs-default-jump-handlers))

(setq tramp-default-method "ssh")

(cnfonts-enable)
(cnfonts-set-spacemacs-fallback-fonts)

(add-to-list 'edit-server-new-frame-alist '(width  . 260))
(add-to-list 'edit-server-new-frame-alist '(height . 70))

(provide 'my)
