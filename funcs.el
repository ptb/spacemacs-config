(defun ptb/get-buffer-menu-in-new-frame ()
  (interactive)
  (switch-to-buffer-other-frame (list-buffers-noselect)))

;; http://emacs.stackexchange.com/questions/4062

(defun ptb/minibuffer-keyboard-quit ()
  "Abort recursive edit.
In Delete Selection mode, if the mark is active, just deactivate it;
then it takes a second \\[keyboard-quit] to abort the minibuffer."
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))

(defun ptb/kill-current-buffer ()
  (interactive)
  (kill-buffer (current-buffer)))

(defun ptb/new-untitled-buffer ()
  "Create a new untitled buffer in the current frame."
  (interactive)
  (let
    ((buffer "Untitled-") (count 1))
    (while
      (get-buffer (concat buffer (number-to-string count)))
      (setq count (1+ count)))
    (switch-to-buffer
     (concat buffer (number-to-string count))))
  (org-mode))

(defun ptb/new-untitled-frame ()
  "Create a new untitled buffer in a new frame."
  (interactive)
  (let
    ((buffer "Untitled-") (count 1))
    (while
      (get-buffer (concat buffer (number-to-string count)))
      (setq count (1+ count)))
    (switch-to-buffer-other-frame
     (concat buffer (number-to-string count))))
  (org-mode))

;; https://bitbucket.org/lyro/evil/issue/468/how-delete-to-the-register-in-a-keymap

(evil-define-operator ptb/evil-delete-without-register (beg end type yank-handler)
  (interactive "<R><y>")
  (evil-delete beg end type ?_ yank-handler))

(evil-define-operator ptb/evil-delete-char-without-register (beg end type register)
  "Delete next character."
  :motion evil-forward-char
  (interactive "<R><x>")
  (evil-delete beg end type ?_))

(evil-define-operator ptb/evil-delete-backward-char-without-register (beg end type register)
  "Delete previous character."
  :motion evil-backward-char
  (interactive "<R><x>")
  (evil-delete beg end type ?_))

(require 'cl)

(defun is-useless-buffer (buffer)
  (let ((name (buffer-name buffer)))
    (and (= ?* (aref name 0))
         (string-match "^\\**" name))))

(defun kill-useless-buffers ()
  (interactive)
  (loop for buffer being the buffers
        do (and (is-useless-buffer buffer) (kill-buffer buffer))))

