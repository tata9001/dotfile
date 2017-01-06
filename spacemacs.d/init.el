;; -*- mode: emacs-lisp -*-
;; brew tap railwaycat/emacsmacport
;; brew install emacs-mac --with-spacemacs-icon --HEAD --with-gnutls
(defun dotspacemacs/layers ()
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-enable-lazy-installation 'nil
   dotspacemacs-ask-for-lazy-installation t
   dotspacemacs-configuration-layer-path '()
   dotspacemacs-configuration-layers
   '(
     yaml
     ivy
     better-defaults
     python
     html
     emacs-lisp
     git
     docker
     markdown
     ranger
     shell-scripts
     vimscript
     search-engine
     docker
     osx
     (chinese :variables chinese-enable-youdao-dict t)
     (org :variables org-enable-reveal-js-support t)
     (shell :variables
            shell-default-shell 'eshell
            shell-default-height 60
            shell-default-term-shell "zsh")
     (syntax-checking :variables
                      syntax-checking-enable-by-default t
                      syntax-checking-enable-tooltips t
                      )
     (auto-completion :variables
                      auto-completion-enable-sort-by-usage t
                      auto-completion-enable-help-tooltip t
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-private-snippets-directory "~/.spacemacs.d/snippets/"
                      )
     (colors :variables colors-enable-nyan-cat-progress-bar t)
     (ibuffer :variables ibuffer-group-buffers-by 'projects))

   dotspacemacs-additional-packages'()
   dotspacemacs-frozen-packages '()
   dotspacemacs-excluded-packages '(ido, tern, vi-tilde-fringe)

   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  (setq-default
   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 10
   dotspacemacs-check-for-update nil
   dotspacemacs-elpa-subdirectory nil
   dotspacemacs-editing-style 'vim
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner 'official
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   dotspacemacs-startup-buffer-responsive t
   dotspacemacs-scratch-mode 'text-mode
   dotspacemacs-themes '(spacemacs-dark monokai dracula )
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font '("Source Code Pro"
                               :size 15
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   dotspacemacs-emacs-command-key "SPC"
   dotspacemacs-distinguish-gui-tab nil
   dotspacemacs-remap-Y-to-y$ t
   dotspacemacs-retain-visual-state-on-shift t
   dotspacemacs-visual-line-move-text t
   dotspacemacs-ex-substitute-global nil
   dotspacemacs-default-layout-name "Default"
   dotspacemacs-display-default-layout nil
   dotspacemacs-auto-resume-layouts nil
   dotspacemacs-large-file-size 1
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-max-rollback-slots 5
   dotspacemacs-helm-resize nil
   dotspacemacs-helm-no-header nil
   dotspacemacs-helm-position 'bottom
   dotspacemacs-helm-use-fuzzy 'always
   dotspacemacs-enable-paste-transient-state nil
   dotspacemacs-which-key-delay 0.1
   dotspacemacs-which-key-position 'bottom
   dotspacemacs-loading-progress-bar t
   dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup t
   dotspacemacs-active-transparency 90
   dotspacemacs-inactive-transparency 90
   dotspacemacs-show-transient-state-title t
   dotspacemacs-show-transient-state-color-guide t
   dotspacemacs-mode-line-unicode-symbols t
   dotspacemacs-smooth-scrolling t
   dotspacemacs-line-numbers 'relative
   dotspacemacs-folding-method 'evil
   dotspacemacs-smartparens-strict-mode t
   dotspacemacs-smart-closing-parenthesis nil
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-persistent-server nil
   dotspacemacs-search-tools '("ag" "grep" "pt" "ack")
   dotspacemacs-default-package-repository nil
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  (setq configuration-layer--elpa-archives
    '(("melpa-cn" . "http://elpa.emacs-china.org/melpa/")
      ("org-cn"   . "http://elpa.emacs-china.org/org/")
      ("gnu-cn"   . "http://elpa.emacs-china.org/gnu/")))

  (setq tramp-ssh-controlmaster-options
        "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")

  (setq custom-file (expand-file-name "custom.el" dotspacemacs-directory))
  (load custom-file 'no-error 'no-message)
  (setq exec-path-from-shell-check-startup-files nil)

  )

(defun dotspacemacs/user-config ()
  (setcdr evil-insert-state-map nil)
  (define-key evil-insert-state-map [escape] 'evil-normal-state)
  (setq powerline-default-separator 'brace)

  (setq byte-compile-warnings '(not obsolete))
  (setq warning-minimum-level :error)
  (fset 'evil-visual-update-x-selection 'ignore)

  ;; key bindings  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (define-key evil-insert-state-map  (kbd "C-j C-j") 'evil-change-to-previous-state)
  (spacemacs/declare-prefix "o" "owner")

  ;; youdao Dict
  (global-set-key (kbd "C-c y") 'youdao-dictionary-search-at-point+)
  (spacemacs/set-leader-keys "oy" 'youdao-dictionary-search-at-point+)
  ;; (,) add Space
  (global-set-key (kbd ",") #'(lambda () (interactive) (insert ", ")))

  ;; prog-mode config ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (add-hook 'prog-mode-hook 'which-function-mode)
  (add-hook 'prog-mode-hook 'hungry-delete-mode)
  ;; format header line
  ;; (setq-default header-line-format
  ;;               '((which-func-mode ("" which-func-format " "))))

  ;; auto complete config  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; abbrev
  (add-hook 'after-init-hook 'global-company-mode)
  (define-abbrev-table 'global-abbrev-table '(
                        ("8mail" "geek.colin@gmail.com")
                        ("8name" "Colin.Lee")))
  ;; run shell command
  (defun shell-command-on-buffer ()
    (interactive)
    (shell-command-on-region
     (point-min) (point-max)
     (read-shell-command "Run shell command on buffer: ")))

  (spacemacs/set-leader-keys "or" 'shell-command-on-buffer)

  ;; org-mode config ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; org-mode auto new line
  (add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))
  (add-hook 'org-mode-hook 'org-indent-mode)
  ;; org to el
  ;; (org-babel-load-file (expand-file-name "colin.org" user-emacs-directory))
  (eval-after-load "org"
    '(require 'ox-md nil t))

  ;; global setting ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (delete-selection-mode 1)
  (setq which-key-side-window-max-height 0.8)
  (setq which-key-side-window-max-width 0.1)
  ;; upload resource to qiniu
  (defun qiniu-qshell (command)
    (let ((command-str (format "qshell qupload 10 %s" command)))
      (shell-command-to-string command-str)))
  (defun qiniu-upload ()
    (interactive)
    (qiniu-qshell "~/DataCenter/qiniu/conf.json")
    (message "upload OK"))

  )
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
)
