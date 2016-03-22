;;; packages.el --- coq Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Eric Bailey <eric@ericb.me>
;; URL: https://github.com/yurrriq/spacemacs-coq
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; List of all packages to install and/or initialize. Built-in packages
;; which require an initialization must be listed explicitly in the list.
(setq coq-packages '(company-coq org ob-coq))

(defun coq/init-company-coq ()
  "Initialize company-coq."
  (use-package company-coq
    :defer t
    :mode ("\\.v\\'" . coq-mode)
    :load-path "/usr/local/share/emacs/site-lisp/proof-general/generic"
    :config
    (progn
      (add-hook 'coq-mode-hook 'company-coq-initialize)
      (setq coq-prog-args
            `("-emacs" "-I" ,(concat (getenv "HOME") "/src/yurrriq/cpdt/src")))
      (with-eval-after-load 'org
        (require 'ob-coq)
        (load "coq/coq-inferior.el")

        ;; https://github.com/snu-sf-class/pl2015spring/issues/37#issuecomment-88103764
        (add-hook 'proof-ready-for-assistant-hook
                  (lambda () (show-paren-mode 0)))

        (add-hook 'coq-mode-hook 'prettify-symbols-mode)

        (add-hook 'coq-mode-hook
                  (lambda ()
                    (setq prettify-symbols-alist
                          '(("->"  ?→) ("<-"  ?←) ("*"  ?×)
                            ("<="  ?≤) (">="  ?≥) ("=>" ?⇒)
                            ("<>"  ?≠) ("<->" ?↔) ("|-" ?⊢)
                            ("\\/" ?∨) ("/\\" ?∧) ("~"  ?¬)
                            ("forall" ?∀)
                            ("exists" ?∃)
                            ("False"  ?⊥)
                            ("True"   ?⊤)))))))))
