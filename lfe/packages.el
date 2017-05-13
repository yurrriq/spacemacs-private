;;; packages.el --- lfe Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Eric Bailey <eric@ericb.me>
;; URL: https://github.com/yurrriq/spacemacs-private/tree/master/lfe
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:

(defconst lfe-packages '(lfe-mode rainbow-delimiters dash-at-point)
  "The list of Lisp packages required by the LilyPond layer.")

(defun lfe/init-lfe-mode ()
  "Initialize `lfe-mode'."
  (use-package lfe-mode
    :defer     t
    :mode      ("\\.lfe\\'" . lfe-mode)
    :load-path "~/src/rvirding/lfe/emacs"
    :config    (progn
                 (require 'lfe-start)
                 (require 'lfe-indent)
                 (define-lfe-indent
                   ;; defmodule
                   (from   1)
                   (rename 1)
                   (import 0)

                   ;; exemplar
                   (body    0)
                   ;; (div     1)
                   (div     'defun)
                   (head    0)
                   (html    'defun)
                   (link-to 1)
                   (pre     1)
                   (span    'defun)
                   (ul      0)

                   (try 0)

                   ;; (main 0)
                   (list 0)
                   ;; (list 'defun)

                   (GET 1)
                   (POST 1)
                   (PUT 1)
                   (NOTFOUND 0)

                   (lodox-util:when* 1)

                   ;; lists
                   (lists:all       'defun)
                   (lists:any       'defun)
                   (lists:dropwhile 'defun)
                   (lists:filter    'defun)
                   (lists:filtermap 'defun)
                   (lists:flatmap   'defun)
                   (lists:foldl     'defun)
                   (lists:foreach   'defun)
                   (lists:keydelete 'defun)
                   (lists:map       'defun)
                   (lists:member    'defun)
                   (lists:sort      'defun)
                   (lists:mapfoldl  'defun)

                   (maps:fold 'defun)

                   (condp 2)

                   (cowboy_router:compile 'defun)
                   (cowboy:start_http 'defun)
                   (cowboy:start_https 'defun)
                   (cowboy_req:reply 'defun)
                   (cowboy_req:set_resp_cookie 'defun)
                   (priv-dir 2)
                   (priv-file 2)

                   (logjam:set-level 'defun)

                   (io_lib:format 'defun)
                   (io:format 'defun)
                   (io:fwrite 'defun)
                   (lfe_io:format 'defun)

                   (fold-replace 'defun)
                   (iff 'defun)
                   (when-not 'defun)

                   (dojo-mnesia:list-data 'defun)
                   (set-course-masters 'defun)
                   (query-data 'defun)
                   ;; (set-Course 'defun)
                   (set-LessonGroup 'defun)
                   ;; (set-Lesson 'defun)
                   (try-create 'defun)

                   ;; dragon
                   (base-page 'defun)
                   (main 'defun)

                   (doto 'defun)

                   (binary 'defun)

                   ;; lmug-lint
                   (lint 'defun)

                   ;; hackey
                   (hackney_cookie:setcookie 'defun)
                   (hackney:get 'defun)
                   (hackney:post 'defun)

                   ;; rebar
                   (rebar_api:console 'defun)
                   (rebar_api:debug 'defun)

                   (if-found 'defun)

                   ;; FIXME: Does this work?
                   ;; `(funcall defun)

                   ;; prometheus
                   (prometheus_histogram:observe 'defun)

                   ;; dojo
                   (maybe-handle 'defun)

                   (clj:as-> 'defun)
                   (as-> 'defun)
                   (clj:cond-> 'defun)
                   (cond-> 'defun)
                   (clj:cond->> 'defun)
                   (cond->> 'defun)
                   (clj:if-not 'defun)
                   (clj:iff 'defun)
                   (clj:doto 'defun)
                   (clj:condp 'defun)
                   (set-Course 'defun)
                   (clj:defn 'defun)
                   (defn 'defun)
                   (if-not 'defun)

                   (create-table 'defun)

                   (ul 'defun)

                   (edoc_report:report 'defun)
                   (edoc_report:warning 'defun)
                   )
                 (put-lfe-indent 'funcall 'defun)
                 (dolist (func '(paredit-mode
                                 rainbow-delimiters-mode
                                 auto-complete-mode
                                 hl-todo-mode
                                 prettify-symbols-mode
                                 yas-minor-mode))
                   (add-hook 'lfe-mode-hook func))
                 (add-to-list 'dash-at-point-mode-alist
                              '(lfe-mode . "erlang")))))

;;; packages.el ends here
