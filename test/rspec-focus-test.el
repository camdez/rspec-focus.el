(ert-deftest rspec-focus--tag-regexp-test ()
  (should     (string-match-p rspec-focus--tag-regexp ", focus: true"))
  (should-not (string-match-p rspec-focus--tag-regexp ", focus: false"))
  (should     (string-match-p rspec-focus--tag-regexp ", focus:   true")))

(ert-deftest rspec-focus--new-tag-test ()
  (should (string-match-p rspec-focus--tag-regexp rspec-focus--new-tag)))
