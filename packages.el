;;; packages.el --- ptb Layer packages File for Spacemacs
;;
;; Copyright (c) 2015 Peter T Bosse II
;;
;; Author: Peter T Bosse II <ptb@ioutime.com>
;; URL: https://github.com/ptb
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; List of all packages to install and/or initialize. Built-in packages
;; which require an initialization must be listed explicitly in the list.

(setq ptb-packages '(
  auto-indent-mode
  inline-crypt
  ov))

;; List of packages to exclude.

(setq ptb-excluded-packages '(
  org-bullets))

;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package

;; For each package, define a function ptb/init-<package-ptb>

(defun ptb/init-auto-indent-mode ()
  (use-package auto-indent-mode
    :init
    (setq
     auto-indent-fix-org-auto-fill t
     auto-indent-start-org-indent t
     auto-indent-fix-org-return t
     auto-indent-delete-backward-char t
     auto-indent-fix-org-move-beginning-of-line t
     auto-indent-fix-org-yank t)))

(defun ptb/init-inline-crypt ()
  (use-package inline-crypt))

(defun ptb/init-adaptive-wrap ()
  "Load the adaptive wrap package"
  (use-package adaptive-wrap
    :init
    (setq adaptive-wrap-extra-indent 2)
    :config
    (progn
      ;; http://stackoverflow.com/questions/13559061
      (when (fboundp 'adaptive-wrap-prefix-mode)
        (defun ptb/activate-adaptive-wrap-prefix-mode ()
          "Toggle 'visual-line-mode' and 'adaptive-wrap-prefix-mode' simultaneously."
          (adaptive-wrap-prefix-mode (if visual-line-mode 1 -1)))
        (add-hook 'visual-line-mode-hook 'ptb/activate-adaptive-wrap-prefix-mode)))))

(defun ptb/init-ov ()
  (use-package ov
    :config
      (defun octicons-insert-icon (theinput)
        (interactive (list (read-string "Which icon? ")))
        (let* ((theicon (rassoc theinput octicons-list))
               (char (car theicon))
               ov)
          (setq ov (ov-insert char))
          (ov-set ov 'face '(:family "github-octicons"))))
    :init
      (setq octicons-list '(
        ("\xf02d" . "oc-alert")
        ("\xf08a" . "oc-alignment-align")
        ("\xf08e" . "oc-alignment-aligned-to")
        ("\xf08b" . "oc-alignment-unalign")
        ("\xf03f" . "oc-arrow-down")
        ("\xf040" . "oc-arrow-left")
        ("\xf03e" . "oc-arrow-right")
        ("\xf0a0" . "oc-arrow-small-down")
        ("\xf0a1" . "oc-arrow-small-left")
        ("\xf071" . "oc-arrow-small-right")
        ("\xf09f" . "oc-arrow-small-up")
        ("\xf03d" . "oc-arrow-up")
        ("\xf069" . "oc-beer")
        ("\xf007" . "oc-book")
        ("\xf07b" . "oc-bookmark")
        ("\xf0d3" . "oc-briefcase")
        ("\xf048" . "oc-broadcast")
        ("\xf0c5" . "oc-browser")
        ("\xf091" . "oc-bug")
        ("\xf068" . "oc-calendar")
        ("\xf03a" . "oc-check")
        ("\xf076" . "oc-checklist")
        ("\xf0a3" . "oc-chevron-down")
        ("\xf0a4" . "oc-chevron-left")
        ("\xf078" . "oc-chevron-right")
        ("\xf0a2" . "oc-chevron-up")
        ("\xf084" . "oc-circle-slash")
        ("\xf0d6" . "oc-circuit-board")
        ("\xf035" . "oc-clippy")
        ("\xf046" . "oc-clock")
        ("\xf00b" . "oc-cloud-download")
        ("\xf00c" . "oc-cloud-upload")
        ("\xf05f" . "oc-code")
        ("\xf065" . "oc-color-mode")
        ("\xf02b" . "oc-comment")
        ("\xf04f" . "oc-comment-discussion")
        ("\xf045" . "oc-credit-card")
        ("\xf0ca" . "oc-dash")
        ("\xf07d" . "oc-dashboard")
        ("\xf096" . "oc-database")
        ("\xf056" . "oc-device-camera")
        ("\xf057" . "oc-device-camera-video")
        ("\xf27c" . "oc-device-desktop")
        ("\xf038" . "oc-device-mobile")
        ("\xf04d" . "oc-diff")
        ("\xf06b" . "oc-diff-added")
        ("\xf099" . "oc-diff-ignored")
        ("\xf06d" . "oc-diff-modified")
        ("\xf06c" . "oc-diff-removed")
        ("\xf06e" . "oc-diff-renamed")
        ("\xf09a" . "oc-ellipsis")
        ("\xf04e" . "oc-eye")
        ("\xf094" . "oc-file-binary")
        ("\xf010" . "oc-file-code")
        ("\xf016" . "oc-file-directory")
        ("\xf012" . "oc-file-media")
        ("\xf014" . "oc-file-pdf")
        ("\xf017" . "oc-file-submodule")
        ("\xf0b1" . "oc-file-symlink-directory")
        ("\xf0b0" . "oc-file-symlink-file")
        ("\xf011" . "oc-file-text")
        ("\xf013" . "oc-file-zip")
        ("\xf0d2" . "oc-flame")
        ("\xf0cc" . "oc-fold")
        ("\xf02f" . "oc-gear")
        ("\xf042" . "oc-gift")
        ("\xf00e" . "oc-gist")
        ("\xf08c" . "oc-gist-secret")
        ("\xf020" . "oc-git-branch")
        ("\xf01f" . "oc-git-commit")
        ("\xf0ac" . "oc-git-compare")
        ("\xf023" . "oc-git-merge")
        ("\xf009" . "oc-git-pull-request")
        ("\xf0b6" . "oc-globe")
        ("\xf043" . "oc-graph")
        ("\x2665" . "oc-heart")
        ("\xf07e" . "oc-history")
        ("\xf08d" . "oc-home")
        ("\xf070" . "oc-horizontal-rule")
        ("\xf09e" . "oc-hourglass")
        ("\xf09d" . "oc-hubot")
        ("\xf0cf" . "oc-inbox")
        ("\xf059" . "oc-info")
        ("\xf028" . "oc-issue-closed")
        ("\xf026" . "oc-issue-opened")
        ("\xf027" . "oc-issue-reopened")
        ("\xf019" . "oc-jersey")
        ("\xf072" . "oc-jump-down")
        ("\xf0a5" . "oc-jump-left")
        ("\xf0a6" . "oc-jump-right")
        ("\xf073" . "oc-jump-up")
        ("\xf049" . "oc-key")
        ("\xf00d" . "oc-keyboard")
        ("\xf0d8" . "oc-law")
        ("\xf000" . "oc-light-bulb")
        ("\xf05c" . "oc-link")
        ("\xf07f" . "oc-link-external")
        ("\xf062" . "oc-list-ordered")
        ("\xf061" . "oc-list-unordered")
        ("\xf060" . "oc-location")
        ("\xf06a" . "oc-lock")
        ("\xf092" . "oc-logo-github")
        ("\xf03b" . "oc-mail")
        ("\xf03c" . "oc-mail-read")
        ("\xf051" . "oc-mail-reply")
        ("\xf00a" . "oc-mark-github")
        ("\xf0c9" . "oc-markdown")
        ("\xf077" . "oc-megaphone")
        ("\xf0be" . "oc-mention")
        ("\xf089" . "oc-microscope")
        ("\xf075" . "oc-milestone")
        ("\xf024" . "oc-mirror")
        ("\xf0d7" . "oc-mortar-board")
        ("\xf0a8" . "oc-move-down")
        ("\xf074" . "oc-move-left")
        ("\xf0a9" . "oc-move-right")
        ("\xf0a7" . "oc-move-up")
        ("\xf080" . "oc-mute")
        ("\xf09c" . "oc-no-newline")
        ("\xf008" . "oc-octoface")
        ("\xf037" . "oc-organization")
        ("\xf0c4" . "oc-package")
        ("\xf0d1" . "oc-paintcan")
        ("\xf058" . "oc-pencil")
        ("\xf018" . "oc-person")
        ("\xf041" . "oc-pin")
        ("\xf0bd" . "oc-playback-fast-forward")
        ("\xf0bb" . "oc-playback-pause")
        ("\xf0bf" . "oc-playback-play")
        ("\xf0bc" . "oc-playback-rewind")
        ("\xf0d4" . "oc-plug")
        ("\xf05d" . "oc-plus")
        ("\xf0af" . "oc-podium")
        ("\xf052" . "oc-primitive-dot")
        ("\xf053" . "oc-primitive-square")
        ("\xf085" . "oc-pulse")
        ("\xf0c0" . "oc-puzzle")
        ("\xf02c" . "oc-question")
        ("\xf063" . "oc-quote")
        ("\xf030" . "oc-radio-tower")
        ("\xf001" . "oc-repo")
        ("\xf04c" . "oc-repo-clone")
        ("\xf04a" . "oc-repo-force-push")
        ("\xf002" . "oc-repo-forked")
        ("\xf006" . "oc-repo-pull")
        ("\xf005" . "oc-repo-push")
        ("\xf033" . "oc-rocket")
        ("\xf034" . "oc-rss")
        ("\xf047" . "oc-ruby")
        ("\xf066" . "oc-screen-full")
        ("\xf067" . "oc-screen-normal")
        ("\xf02e" . "oc-search")
        ("\xf097" . "oc-server")
        ("\xf07c" . "oc-settings")
        ("\xf036" . "oc-sign-in")
        ("\xf032" . "oc-sign-out")
        ("\xf0c6" . "oc-split")
        ("\xf0b2" . "oc-squirrel")
        ("\xf02a" . "oc-star")
        ("\xf0c7" . "oc-steps")
        ("\xf08f" . "oc-stop")
        ("\xf087" . "oc-sync")
        ("\xf015" . "oc-tag")
        ("\xf088" . "oc-telescope")
        ("\xf0c8" . "oc-terminal")
        ("\xf05e" . "oc-three-bars")
        ("\xf0db" . "oc-thumbsdown")
        ("\xf0da" . "oc-thumbsup")
        ("\xf031" . "oc-tools")
        ("\xf0d0" . "oc-trashcan")
        ("\xf05b" . "oc-triangle-down")
        ("\xf044" . "oc-triangle-left")
        ("\xf05a" . "oc-triangle-right")
        ("\xf0aa" . "oc-triangle-up")
        ("\xf039" . "oc-unfold")
        ("\xf0ba" . "oc-unmute")
        ("\xf064" . "oc-versions")
        ("\xf081" . "oc-x")
        ("\x26A1" . "oc-zap")))))
