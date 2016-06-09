;;; packages.el --- lilypond layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Mo Hacker <mohacker@TheMatrix>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `lilypond-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `lilypond/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `lilypond/pre-init-PACKAGE' and/or
;;   `lilypond/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst lilypond-packages '(lilypond-mode)
  "The list of Lisp packages required by the lilypond layer.")

(defun lilypond/init-lilypond-mode ()
  "Initialize lilypond."
  (use-package LilyPond-mode
    :defer     t
    :mode      ("\\.i?ly\\'" . LilyPond-mode)
    :load-path "/usr/local/share/emacs/site-lisp/lilypond"
    :config    (progn
                 (add-hook 'LilyPond-mode-hook
                           (lambda ()
                             (turn-on-font-lock)
                             (make-local-variable 'comment-add)
                             ;; default to `;;' in comment-region
                             (setq comment-add 1))))))

;;; packages.el ends here
