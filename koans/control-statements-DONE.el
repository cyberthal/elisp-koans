;;   Copyright 2013 Google Inc.
;;
;;   Licensed under the Apache License, Version 2.0 (the "License");
;;   you may not use this file except in compliance with the License.
;;   You may obtain a copy of the License at
;;
;;       http://www.apache.org/licenses/LICENSE-2.0
;;
;;   Unless required by applicable law or agreed to in writing, software
;;   distributed under the License is distributed on an "AS IS" BASIS,
;;   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
;;   See the License for the specific language governing permissions and
;;   limitations under the License.
;;
;;   Adapted from google/lisp-koans:koans/control-statements.lsp

(elisp-koans/deftest
 elisp-koans/control-statements-test-if-then-else ()
 "`if' statements allow you to execute one statement or another based on a
conditional"
 (let ((result))
   (if t
       (setf result "true value")
     (setf result "false value"))
   (should (equal "true value" result))
   (if nil
       (setf result "true value")
     (setf result "false value"))
   (should (equal "false value" result))
   ))


(elisp-koans/deftest
 elisp-koans/control-statements-test-when-and-unless ()
 "`when' and `unless' allow you to execute multiple forms based on condition"
 (let ((result-1 nil)
       (result-2 nil)
       (when-nums nil)
       (unless-nums nil))
   (dolist (x '(1 2 3 4 5 6 7 8 9 10))
     (when (> x 5)
       (setf result-1 x)
       (push x when-nums))
     (unless (> x 5)
       (setf result-2 x)
       (push x unless-nums)))
   (should (equal 10 result-1))
   (should (equal 5 result-2))
   (should (equal '(10 9 8 7 6) when-nums))
   (should (equal '(5 4 3 2 1) unless-nums))))


(elisp-koans/deftest
 elisp-koans/control-statements-test-and-short-circuits ()
 "`and' only evaluates forms until one evaluates to `nil'"
 (should
  (equal
   2
   (let ((x 0))
     (and
      (setf x (+ 1 x))
      (setf x (+ 1 x))
      nil ;; <- ends execution of and.
      (setf x (+ 1 x)))
     x))))


(elisp-koans/deftest
 elisp-koans/control-statements-test-or-also-short-circuits ()
 "`or' only evaluates until one argument evaluates to non-nil"
 (should
  (equal
   1
   (let ((x 0))
     (or
      (setf x (+ 1 x))
      (setf x (+ 1 x))
      nil
      (setf x (+ 1 x)))
     x))))

;; control-statements.el ends here