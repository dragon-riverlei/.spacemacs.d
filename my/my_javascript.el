(setq-default js2-basic-offset 2)
(setq-default js-indent-level 2)
(setq-default js2-bounce-indent-p t)

(add-hook 'js2-mode-hook
  (lambda ()
    (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))

(provide 'my_javascript)
