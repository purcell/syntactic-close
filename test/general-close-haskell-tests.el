
;; (ert-deftest general-close-haskell-concat-test ()
;;   ;; indent s = "    " ++ s
;;   (general-close-test "indent s = \"asdf\""
;;     'haskell-mode
;;     'general-close-debug-p
;;     (general-close)
;;     (skip-chars-backward " \t\r\n\f") 
;;     (should (eq (char-before) ?+))))


(provide 'general-close-haskell-tests)
;;; general-close-haskell-tests.el ends here
