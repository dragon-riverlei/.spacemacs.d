(setq org-agenda-files
  (quote
    ("/BaiduYun/org/edu.org"
      "/BaiduYun/org/gtd.org"
      "/BaiduYun/org/journal.org"
      "/BaiduYun/org/investment_journey.org"
      "/BaiduYun/org/learning.org")))

(defvar my/org-task-tpl "* TODO %^{Task}
:PROPERTIES:
:Effort: %^{effort|1:00|0:05|0:15|0:30|2:00|4:00}
:END:
Captured %<%Y-%m-%d %H:%M>
%?

%i
" "Task data")
(defvar my/org-project-tpl "* TODO %^{Project}
:PROPERTIES:
:Effort: %^{effort|1w|2w|3w|4w|5w|6w|7w|8w}
:END:
Captured %<%Y-%m-%d %H:%M>
%?

%i
" "Project data")

(setq org-capture-templates
  `(
     ("t" "Task" entry
      (file+headline "gtd.org" "TASKS")
      ,my/org-task-tpl)
     ("p" "Project" entry
       (file+headline "gtd.org" "PROJECTS")
       ,my/org-project-tpl)
     ("j" "Journal entry" entry
       (file+datetree "journal.org")
       "* %^{Topic}\n%?\n"
       :unnarrowed t)
     ("q" "Quick note" item
       (file+headline "note.org" "Quick note"))))

(setq org-todo-keywords
  '(
     (sequence "TODO(t)" "IDEA(i)" "STARTED(s)" "NEXT(n)" "WAITING(w)" "|" "DONE(d)")
     (sequence "|" "CANCELED(c)" "DELEGATED(l)" "SOMEDAY(f)")
     ))

(setq org-refile-targets
  '(
     (nil :maxlevel . 4)                ;;all top 4 level headlines in the current buffer
     (org-agenda-files :maxlevel . 4))) ;;all top 4 level headlines in agenda files

(provide 'my_org)
