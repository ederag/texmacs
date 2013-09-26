
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; MODULE      : fold-markup.scm
;; DESCRIPTION : extra markup for laptop presentations
;; COPYRIGHT   : (C) 2013  Joris van der Hoeven
;;
;; This software falls under the GNU general public license version 3 or later.
;; It comes WITHOUT ANY WARRANTY WHATSOEVER. For details, see the file LICENSE
;; in the root directory or <http://www.gnu.org/licenses/gpl-3.0.html>.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(texmacs-module (dynamic fold-markup)
  (:use (utils library tree)
        (utils library cursor)))

(define (screens-parent? t)
  (tree-is? (tree-up t) 'screens))

(tm-define (screens-index body)
  (:secure #t)
  (with t (tree-search-upwards body screens-parent?)
    (if t (number->string (tree-index t)) "-1")))

(tm-define (screens-arity body)
  (:secure #t)
  (with t (tree-search-upwards body screens-parent?)
    (if t (number->string (tree-arity (tree-up t))) "-1")))