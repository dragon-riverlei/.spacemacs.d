(with-eval-after-load 'org

  (setq org-directory "~/ORG")

  (setq org-agenda-files
    (quote
      ("~/ORG/edu.org"
      "~/ORG/gtd.org"
      "~/ORG/gtd_20170503_archive.org"
      "~/ORG/journal.org"
      "~/ORG/investment_journey.org"
      "~/ORG/learning.org")))

  (setq org-agenda-custom-commands
    '(("Q" . "Qiao") ;; gives label to "Q"
      ("Qa" "Agenda list" org-agenda-list ""
       ((org-agenda-files (file-expand-wildcards "~/Library/Mobile Documents/com~apple~CloudDocs/Documents/ORG/*.org"))))
      ))

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
        (file+headline "~/ORG/gtd.org" "TASKS")
        ,my/org-task-tpl)
      ("p" "Project" entry
        (file+headline "~/ORG/gtd.org" "PROJECTS")
        ,my/org-project-tpl)
      ("j" "Journal entry" entry
        (file+datetree "~/ORG/journal.org")
        "* %^{Topic}\n%?\n"
        :unnarrowed t)
      ("q" "Quick note" item
        (file+headline "~/ORG/note.org" "Quick note"))))

  (setq org-todo-keywords
    '(
      (sequence "TODO(t)" "IDEA(i)" "STARTED(s)" "NEXT(n)" "WAITING(w)" "|" "DONE(d)")
      (sequence "|" "CANCELED(c)" "DELEGATED(l)" "SOMEDAY(f)")
      ))

  (setq org-refile-targets
    '(
      (nil :maxlevel . 4)                ;;all top 4 level headlines in the current buffer
      (org-agenda-files :maxlevel . 4))) ;;all top 4 level headlines in agenda files

  (setq org-hide-emphasis-markers t)
)

(provide 'my_org_agenda)
