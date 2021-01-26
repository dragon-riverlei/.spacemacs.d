(with-eval-after-load 'org

  (defun org-renumber-environment (orig-func &rest args)
    (let ((results '())
    (counter -1)
    (numberp))

      (setq results (loop for (begin .  env) in
        (org-element-map (org-element-parse-buffer) 'latex-environment
          (lambda (env)
            (cons
            (org-element-property :begin env)
            (org-element-property :value env))))
        collect
        (cond
        ((and (string-match "\\\\begin{equation}" env)
              (not (string-match "\\\\tag{" env)))
          (incf counter)
          (cons begin counter))
        ((string-match "\\\\begin{align}" env)
          (prog2
              (incf counter)
              (cons begin counter)
            (with-temp-buffer
              (insert env)
              (goto-char (point-min))
              ;; \\ is used for a new line. Each one leads to a number
              (incf counter (count-matches "\\\\$"))
              ;; unless there are nonumbers.
              (goto-char (point-min))
              (decf counter (count-matches "\\nonumber")))))
        (t
          (cons begin nil)))))

      (when (setq numberp (cdr (assoc (point) results)))
        (setf (car args)
        (concat
        (format "\\setcounter{equation}{%s}\n" numberp)
        (car args)))))
    (apply orig-func args))

    (setq org-format-latex-options (plist-put org-format-latex-options :scale 2.0))
    (setq org-format-latex-options (plist-put org-format-latex-options :foreground "SpringGreen1"))
    (add-to-list 'org-latex-packages-alist '("" "amsmath"))
    (add-to-list 'org-latex-packages-alist '("" "mathtools"))
    (add-to-list 'org-latex-packages-alist '("" "tikz"))
    (advice-add 'org-create-formula-image :around #'org-renumber-environment)

    (setq org-latex-create-formula-image-program 'imagemagick)
    (add-to-list 'org-latex-packages-alist '("" "fontspec"))
    (setq org-format-latex-header "\\documentclass{article}           % copied from org.el
          \\usepackage[usenames]{color}
          \[PACKAGES]
          \[DEFAULT-PACKAGES]
          \\pagestyle{empty}                                          % do not remove
          \\setromanfont{STSong}                                      % 设置中文字体 <== This is the whole change to the original configuration
          % The settings below are copied from fullpage.sty
          \\setlength{\\textwidth}{\\paperwidth}
          \\addtolength{\\textwidth}{-3cm}
          \\setlength{\\oddsidemargin}{1.5cm}
          \\addtolength{\\oddsidemargin}{-2.54cm}
          \\setlength{\\evensidemargin}{\\oddsidemargin}
          \\setlength{\\textheight}{\\paperheight}
          \\addtolength{\\textheight}{-\\headheight}
          \\addtolength{\\textheight}{-\\headsep}
          \\addtolength{\\textheight}{-\\footskip}
          \\addtolength{\\textheight}{-3cm}
          \\setlength{\\topmargin}{1.5cm}
          \\addtolength{\\topmargin}{-2.54cm}")
    (add-to-list 'org-preview-latex-process-alist
      (quote (imagemagick                                             ; copied from org.el
              :programs ("latex" "convert")
              :description "pdf > png"
              :message "you need to install the programs: latex and imagemagick."
              :use-xcolor t
              :image-input-type "pdf"
              :image-output-type "png"
              :image-size-adjust (1.0 . 1.0)
              :latex-compiler
              ("xelatex -interaction nonstopmode -output-directory %o %f")  ; This is the whole change to the original configuration.
              :image-converter
              ("convert -density %D -trim -antialias %f -quality 100 %O"))))
)

(provide 'my_org_latex)
