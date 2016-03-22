;;; packages.el --- lfe Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Eric Bailey <eric@ericb.me>
;; URL: https://github.com/yurrriq/spacemacs-lfe
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(setq lfe-packages '(lfe-mode))

(defun lfe/init-lfe-mode ()
  (use-package lfe-mode
    :defer t
    :init
    (progn (defvar lfe-dir (concat (getenv "HOME") "/src/rvirding/lfe/emacs"))
           (add-to-list 'load-path lfe-dir))
    :config
    (progn (require 'lfe-start)
           (require 'lfe-indent)
           (define-lfe-indent
             ;; defmodule
             (from   1)
             (import 0)

             ;; exemplar
             (body    0)
             (div     1)
             (head    0)
             (html    'defun)
             (link-to 1)
             (pre     1)
             (ul      0)
             (span 'defun)
             (div 'defun)

             (try 0)

             ;; (main 0)
             ;; (list 0)

             (GET 1)
             (POST 1)
             (PUT 1)
             (NOTFOUND 0)

             (lodox-util:when* 1)

             ;; lists
             (lists:map   'defun)
             (lists:dropwhile 'defun)
             (lists:filter   'defun)
             (lists:filtermap   'defun)
             (lists:foldl 'defun)
             (lists:sort  'defun)
             (lists:keydelete 'defun)
             (lists:foreach  'defun)
             (lists:member 'defun)
             (lists:any 'defun)
             (lists:all 'defun)

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

             (fold-replace 'defun)
             (iff 'defun)
             (when-not 'defun)

             (dojo-mnesia:list-data 'defun)
             (set-course-masters 'defun)
             (query-data 'defun)

             (list 'defun)

             ;; dragon
             (base-page 'defun)
             (main 'defun))
           (add-hook 'lfe-mode-hook 'paredit-mode)
           (add-hook 'lfe-mode-hook 'rainbow-delimiters-mode)
           (add-hook 'lfe-mode-hook 'auto-complete-mode))))
