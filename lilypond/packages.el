;;; packages.el --- lilypond layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Eric Bailey <eric@ericb.me>
;; URL: https://github.com/yurrriq/spacemacs-private/tree/master/lilypond
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:

(defconst lilypond-packages '(lilypond-mode)
  "The list of Lisp packages required by the LilyPond layer.")

(defun lilypond/init-lilypond-mode ()
  "Initialize `lilypond-mode'."
  (use-package lilypond-mode
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
