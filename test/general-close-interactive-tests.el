;;; general-close-interactive-tests.el --- Tests known to work when called interactively only -*- lexical-binding: t; -*-

;; Authored and maintained by
;; Emacs User Group Berlin <emacs-berlin@emacs-berlin.org>

;; Keywords: lisp

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

;; Some tests fail in batch mode for unknown reasons. Comments welcome

;;; Code:

(ert-deftest general-close-close-ruby-block-test ()
  (general-close-test-with-ruby-buffer "$DBH.SELECT_ALL(\"SELECT \* FROM FOO\") DO |ROW|"
    (general-close)
    (should (eq (char-before) ?d))))

(ert-deftest general-close-c-nesting-comment-test ()
  (general-close-test "/* The open system call "
    'c-mode
    'general-close-debug-p
    (general-close)
    (should (eq (char-before) ?/))))

(ert-deftest general-close-c++-nesting-comment-test ()
  (general-close-test "/* The open system call "
    'c++-mode
    'general-close-debug-p
    (general-close)
    (should (eq (char-before) ?/))))

(ert-deftest general-close-haskell-comment-test ()
  (general-close-test "{- To explore this file: "
    'haskell-mode
    'general-close-debug-p
    (general-close)
    (should (eq (char-before) ?\}))))

(ert-deftest general-close-haskell-assignment-test ()
  (general-close-test "asdf "
    'haskell-mode
    'general-close-debug-p
    (let (general-close-electric-listify-p)
      (general-close)
      (skip-chars-backward " \t\r\n\f")
      (should (eq (char-before) ?=)))))

(ert-deftest general-close-sml-comment-test ()
  (general-close-test "(* definition of nat"
    'sml-mode
    'general-close-debug-p
    (general-close)
    (should (eq (char-before) ?\)))))

(ert-deftest general-close-haskell-right-arrow-test ()
  (general-close-test "add :: (Int,Int"
    'haskell-mode
    'general-close-debug-p
    (let (general-close-electric-listify-p)
      (general-close)
      (should (eq (char-before) ?\)))
      (general-close)
      (skip-chars-backward " \t\r\n\f")
      (should (eq (char-before) ?>)))))

(provide 'general-close-interactive-tests)
;;; general-close-interactive-tests.el ends here
