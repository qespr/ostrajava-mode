;;; ostrajava-mode.el --- Major mode for edditing OSTRAjava language  -*- lexical-binding: t; -*-

;; Copyright (C) 2022  resp

;; Author: resp
;; Keywords: languages

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; Ostravsky neumím takže musím psát česky, bohužel

;;; Code:
;;Hlavní zdroj: http://www.xahlee.info/emacs/emacs/elisp_syntax_coloring.html
(setq ostrajava-font-lock-keywords
      (let* (
            ;; define several category of keywords
             (x-keywords '("banik" "fajront" ;;Značení souboru
			   "tryda" "joch" "fagan od" "forant" "zrob" ;;OOP
			   "kajtez" "boinak" "kaj" ;;podmínky
			   "rubat" "zdybat" "dlabat" ;;cykly
			   "davaj"
			   "ci" "aj" ;;Logické operace
			   "toz" ;;Deklarace
			   "statyk" "natyv" ;;Nedokumentvoané ale obsažené v Konzola.cyp
			   ))
             (x-types '("cyslo" "cyslo_desetinne" "bul" "chachar" ;Primitivy
			"Dryst" "Bazmek" "Citac" "Konzola" "Bafr")) ;;Třídy
             (x-constants '("fajne" "nyt" "chuj"))
             (x-events '("Ostrava" "pyco"))
             (x-functions '("naDryst" "kantuje" ;;Funkce děděné z Objektu
			    "citajRadku" "otevr" "zavr" ;;Funkce v Citaci
			    "rynek"))

            ;; generate regex string for each category of keywords
            (x-keywords-regexp (regexp-opt x-keywords 'words))
            (x-types-regexp (regexp-opt x-types 'words))
            (x-constants-regexp (regexp-opt x-constants 'words))
            (x-events-regexp (regexp-opt x-events 'words))
            (x-functions-regexp (regexp-opt x-functions 'words)))

        `(
          (,x-types-regexp . 'font-lock-type-face) ;; 'font-lock--face
          (,x-constants-regexp . 'font-lock-constant-face)
          (,x-events-regexp . 'font-lock-builtin-face)
          (,x-functions-regexp . 'font-lock-function-name-face)
          (,x-keywords-regexp . 'font-lock-keyword-face)
          ;; note: order above matters, because once colored, that part won't change.
          ;; in general, put longer words first
          )))

(define-derived-mode ostrajava-mode java-mode "ostrajava"
  "Major mode for editing OSTRAjava files"
  (setq font-lock-defaults '((ostrajava-font-lock-keywords))))

(add-to-list 'auto-mode-alist '("\\.cyp\\'" . ostrajava-mode))

(provide 'ostrajava-mode)
;;; ostrajava-mode.el ends here
