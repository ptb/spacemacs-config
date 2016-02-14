(setq
  default-frame-alist '(
    (top . 23)
    (left . 44)
    (height . 60)
    (width . 124)
    (vertical-scroll-bars . right))
  initial-frame-alist (copy-alist default-frame-alist)
  deft-directory "~/Dropbox/Notes"
  focus-follows-mouse t
  mouse-wheel-follow-mouse t
  mouse-wheel-scroll-amount '(1 ((shift) . 1))
  purpose-display-at-right 20
  recentf-max-saved-items 5
  scroll-step 1
  system-uses-terminfo nil)

(global-linum-mode t)
(recentf-mode t)
(x-focus-frame nil)

(setq ibuffer-formats
      '((mark modified read-only " "
              (name 18 18 :left :elide))))
(setq ibuffer-shrink-to-minimum-size t)
(setq ibuffer-always-show-last-buffer nil)
(setq ibuffer-sorting-mode 'recency)
(setq ibuffer-use-header-line nil)
