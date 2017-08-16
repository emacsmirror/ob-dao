;;; ob-dao.el --- Org Babel Functions for Dao          -*- lexical-binding: t; -*-

;; Copyright (C) 2017  Chunyang Xu

;; Author: Chunyang Xu <mail@xuchunyang.me>
;; Keywords: literate programming, reproducible research, org, babel, dao
;; URL: https://github.com/xuchunyang/ob-dao
;; Version: 0.1.0

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

;; Org-Babel support for evaluating Dao[1] code
;;
;; [1] http://daoscript.org/

;;; Code:

(require 'ob)

(defun org-babel-execute:dao (body _params)
  "Execute a block of Dao code with Babel.
This function is called by `org-babel-execute-src-block'."
  (message "executing Dao source code block")
  (let ((tmp-src-file (org-babel-temp-file "dao-src-" ".dao")))
    (with-temp-file tmp-src-file (insert body))
    (org-babel-eval (format "dao %s" tmp-src-file) "")))

(defun org-babel-prep-session:dao (_session _params)
  "Prepare a session.
This function does nothing as Dao is a compiled language with no
support for sessions."
  (error "Dao is a compiled language -- no support for sessions"))

(provide 'ob-dao)
;;; ob-dao.el ends here
