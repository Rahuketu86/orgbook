(require 'package)
(package-initialize)
(unless package-archive-contents
  (add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
  (package-refresh-contents))
(dolist (pkg '(org-plus-contrib htmlize))
  (unless (package-installed-p pkg)
    (package-install pkg)))

(require 'org)
(require 'ox-rss)
(require 'ox-publish)
(require 'ox-html)
(require 'jbemacs)

(setq org-html-htmlize-output-type nil)

(setq org-publish-project-alist
	'(

    ("org-book-jb"
	    ;; Path to your org files.
	    :base-directory "./book"
	    :base-extension "org"

	    ;; Path to your Jekyll project.
	    :publishing-directory "./book/"
	    :recursive t
	    :publishing-function org-rst-publish-to-rst
	    :html-extension "rst"
	    :body-only t ;; Only export section between <body> </body>
      )

      ("orgbook" :components ("org-book-jb"))

  ))

(defun orgbook-publish-all ()
  "Publish the blog to HTML."
  (interactive)
  (org-publish-all))


(provide 'publish)
