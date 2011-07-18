;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;            planner
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(require 'muse-mode)
(require 'muse-html)
(require 'muse-project)
(require 'muse-wiki)

(require 'remember-planner)
(setq remember-handler-functions '(remember-planner-append))
(setq remember-annotation-functions 'planner-annotation-function)




(require 'planner)
(require 'planner-schedule)
(require 'planner-appt)
(require 'planner-calendar)
(require 'planner-deadline)
(require 'planner-cyclic)

(setq planner-project "ChandleWEiPlanner")

(setq muse-project-alist
	  '(("ChandleWEiPlanner"
		 ("/home/chandle/.Plan/Plans"	;; where your Planner pages are located
		  :default "TaskPool" ;; use value of `planner-default-page'
		  :major-mode planner-mode
		  :visit-link planner-visit-link)
     
		 ;; This next part is for specifying where Planner pages
		 ;; should be published and what Muse publishing style to
		 ;; use.  In this example, we will use the XHTML publishing
		 ;; style.
     
		 (:base "planner-xhtml"
				;; where files are published to
				;; (the value of `planner-publishing-directory', if
				;;  you have a configuration for an older version
				;;  of Planner)
				:path "/home/chandle/.Plan/public_html/Plans"))))
(planner-appt-use-tasks-and-schedule)
(planner-appt-schedule-cyclic-insinuate)
(planner-appt-insinuate)