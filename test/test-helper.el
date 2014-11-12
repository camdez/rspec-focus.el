(require 'f)

(defvar rspec-focus-test-path
  (f-dirname (f-this-file)))

(defvar rspec-focus-code-path
  (f-parent rspec-focus-test-path))

(require 'rspec-focus (f-expand "rspec-focus.el" rspec-focus-code-path))
