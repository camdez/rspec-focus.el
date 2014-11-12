;;; rspec-focus.el --- utility to toggle focus tag on rspec tests  -*- lexical-binding: t; -*-

;; Copyright (C) 2014  Cameron Desautels

;; Author: Cameron Desautels <camdez@gmail.com>
;; Keywords: languages
;; Version: 0.1.0
;; Homepage: http://github.com/camdez
;; Package-Requires: (rspec-mode)

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Toggles the `focus' tag on the current test.


;;; Code:

(require 'rspec-mode)

(defun rspec-focus-toggle ()
  (interactive)
  "Toggles the 'focus' tag on an rspec test."
  (save-excursion
    (rspec-beginning-of-example)
    (if (rspec-focus--tag-on-line)
        (rspec-focus--remove-tag-on-line)
      (progn
        (end-of-line)
        (re-search-backward "\"\\|'")
        (forward-char)
        (insert ", focus: true")))))

(defun rspec-focus--tag-on-line ()
  (save-excursion
    (beginning-of-line)
    (search-forward ", focus: true" (line-end-position) t)))

(defun rspec-focus--remove-tag-on-line ()
  (save-excursion
    (beginning-of-line)
    (search-forward ", focus: true" (line-end-position))
    (delete-region (match-beginning 0) (match-end 0))))

(provide 'rspec-focus)
;;; rspec-focus.el ends here
