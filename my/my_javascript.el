(setq-default js2-bounce-indent-p t)

;; (add-hook 'js2-mode-hook
;;   (lambda ()
;;     (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))
(setq js2-mode-show-parse-errors nil)
(setq js2-mode-show-strict-warnings nil)

(provide 'my_javascript)
