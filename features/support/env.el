(require 'f)

(defvar rspec-focus-support-path
  (f-dirname load-file-name))

(defvar rspec-focus-features-path
  (f-parent rspec-focus-support-path))

(defvar rspec-focus-root-path
  (f-parent rspec-focus-features-path))

(add-to-list 'load-path rspec-focus-root-path)

(require 'rspec-focus)
(require 'espuds)
(require 'ert)

(Setup
 ;; Before anything has run
 )

(Before
 ;; Before each scenario is run
 )

(After
 ;; After each scenario is run
 )

(Teardown
 ;; After when everything has been run
 )
