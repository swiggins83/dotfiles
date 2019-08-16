;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(ansible
     ruby
     csv
     php
     javascript
     react
     docker
     sql
     spotify
     go
     (ranger :variables
             ranger-cleanup-eagerly t)
     sql
     vimscript
     lua
     python
     git
     github
     yaml
     windows-scripts
     ;; (markdown :variables
     ;;           markdown-live-preview-engine 'vmd)
     java
     html
     helm
     better-defaults
     emacs-lisp
     syntax-checking
     search-engine
     themes-megapack
     auto-completion
     (shell :variables
            shell-default-shell 'multi-term
            shell-default-position 'bottom)
     ;; org
     ;; spell-checking
     version-control
                      ;; :variables
                      ;; version-control-global-margin t)
     )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(kubernetes
                                      dired-git-info
                                      evil-collection
                                      sublimity
                                      vmd-mode
                                      realgud
                                      pycoverage
                                      docker-compose-mode
                                      traad
                                      key-chord
                                      editorconfig
                                      exec-path-from-shell
                                      diff-hl)
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(evil-search-highlight-persist
                                    )

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 300

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default nil)
   dotspacemacs-verify-spacelpa-archives nil

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'random
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists nil
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(sanityinc-tomorrow-blue
                         misterioso
                         cyberpunk
                         spacemacs-dark)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :width normal
                               :weight normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   dotspacemacs-mode-line-theme 'vim-powerline

   ;; If non-nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil

   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t

   ;; If non-nil, `J' and `K' move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil

   ;; If non-nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts t

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize t

   ;; if non-nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header t

   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'left

   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always

   ;; If non-nil, the paste transient-state is enabled. While enabled, pressing
   ;; `p' several times cycles through the elements in the `kill-ring'.
   ;; (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'right-then-bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers t

   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'origami
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'current

   ;; If non-nil, start an Emacs server if one is not already running.
   dotspacemacs-enable-server t

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."

  ;; magit
  (setq-default git-magit-status-fullscreen t)

  ;; ranger
  (add-hook 'ranger-mode-hook
            (lambda () (dired-git-info-mode)))
  (setq ranger-override-dired t)
  (setq ranger-cleanup-eagerly t)
  (setq ranger-show-hidden t)

  ;; eshell
  (defvar eshell-path-env (getenv "PATH"))

  ;; multi-term
  (setq multi-term-program "/usr/local/bin/zsh")

  ;; compilation mode
  (setq shell-file-name "zsh")
  (setq shell-command-switch "-ic")
  (setq compilation-always-kill t)
  (setq compilation-scroll-output nil)
  (setq compilation-error-regexp-alist
        (delete 'maven compilation-error-regexp-alist))
  (add-hook 'compilation-mode-hook (lambda () (font-lock-mode -1)))

  ;; proced
  (defun proced-settings ()
    (proced-toggle-auto-update))
  (add-hook 'proced-mode-hook 'proced-settings)

  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (require 'dired-git-info)
  (require 'helm-bookmark)
  (require 'editorconfig)
  (require 'realgud)
  (require 'evil-matchit)
  (require 'all-the-icons)

  (remove-hook 'comint-output-filter-functions
               'comint-postoutput-scroll-to-bottom)

  ;; etc
  (editorconfig-mode t)
  (global-evil-matchit-mode 1)
  (golden-ratio-mode t)
  (setq evil-normal-state-modes (append evil-motion-state-modes evil-normal-state-modes))

  ;; magit
  (global-git-commit-mode t)
  (setq magit-repository-directories '("/Users/stevenwiggins/development/"))

  ;; projectile
  (setq projectile-globally-ignored-file-suffixes '(".class" ".xd" ".blob" ".lck" ".jks" ".exec" ".min.js"))
  (setq projectile-enable-caching t)
  (setq projectile-indexing-method 'alien)
  (setq projectile-find-dir-includes-top-level t)
  (setq projectile-switch-project-action 'projectile-find-dir)
  (add-hook 'projectile-find-dir-hook 'deer)

  ;; ag
  (setq helm-ag-use-agignore t)

  ;; grep
  (setq grep-find-ignored-directories '(".git" "node_modules"))
  (setq grep-find-ignored-files '("*.class" "*.xd" "*.blob" "*.lck" "*.jks" "*.exec" "*.jar" "*.lst" "*.csv" "*.min.js" "*.pyc"))

  ;; dired
  (with-eval-after-load 'dired
    (define-key dired-mode-map ")" 'dired-git-info-mode))
  (setq dired-dwim-target t)

  ;; js
  (setq js-indent-level 2)

  ;; python
  (setq flycheck-python-pycompile-executable 'python3)
  (setq flycheck-python-pylint-executable 'python3)


  ;; key chord (binding action to one key after another)
  (setq key-chord-one-key-delay 0.6)
  (key-chord-mode t)

  (key-chord-define evil-insert-state-map "\'\'" 'delete-window)
  (key-chord-define evil-normal-state-map "\'\'" 'delete-window)

  (key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
  (key-chord-define evil-insert-state-map "kk" 'evil-normal-state)


  ;; define-key (key combo binding)
  ;; helm up/down
  (define-key helm-map (kbd "C-d") 'helm-next-page)
  (define-key helm-map (kbd "C-u") 'helm-previous-page)
  (define-key helm-map (kbd "s-j") 'helm-next-line)
  (define-key helm-map (kbd "s-k") 'helm-previous-line)

  ;; fast search
  (define-key evil-normal-state-map (kbd "s-s") 'isearch-forward)

  ;; deleting buffers
  (spacemacs/declare-prefix "d" "delete stuff")
  (spacemacs/set-leader-keys "dd" 'kill-this-buffer)

  ;; moving around windows
  (define-key term-mode-map (kbd "k") 'evil-window-up)
  (define-key term-mode-map (kbd "C-k") 'evil-window-up)

  (define-key ranger-mode-map (kbd "s-l") 'evil-window-right)

  (define-key evil-normal-state-map (kbd "C-o") 'other-frame)

  (define-key evil-normal-state-map (kbd "s-g") 'evil-goto-line)

  (define-key evil-normal-state-map (kbd "s-]") 'evil-forward-paragraph)
  (define-key evil-normal-state-map (kbd "s-[") 'evil-backward-paragraph)

  (define-key evil-normal-state-map (kbd "s-d") 'evil-scroll-down)
  (define-key evil-normal-state-map (kbd "s-u") 'evil-scroll-up)

  (define-key evil-normal-state-map (kbd "s-t") 'evil-scroll-line-to-top)
  (define-key evil-normal-state-map (kbd "s-w") 'delete-window)
  (define-key evil-normal-state-map (kbd "s-j") 'evil-window-down)
  (define-key evil-normal-state-map (kbd "s-k") 'evil-window-up)
  (define-key evil-normal-state-map (kbd "s-h") 'evil-window-left)
  (define-key evil-normal-state-map (kbd "s-l") 'evil-window-right)

  (define-key evil-insert-state-map (kbd "s-t") 'evil-scroll-line-to-top)
  (define-key evil-insert-state-map (kbd "s-w") 'delete-window)
  (define-key evil-insert-state-map (kbd "s-j") 'evil-window-down)
  (define-key evil-insert-state-map (kbd "s-k") 'evil-window-up)
  (define-key evil-insert-state-map (kbd "s-h") 'evil-window-left)
  (define-key evil-insert-state-map (kbd "s-l") 'evil-window-right)

  (define-key evil-normal-state-map (kbd "C-w") 'delete-window)
  (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
  (define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
  (define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
  (define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)

  (define-key evil-insert-state-map (kbd "C-w") 'delete-window)
  (define-key evil-insert-state-map (kbd "C-j") 'evil-window-down)
  (define-key evil-insert-state-map (kbd "C-k") 'evil-window-up)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-window-left)
  (define-key evil-insert-state-map (kbd "C-l") 'evil-window-right)

  ;; f key ez movement bindings (evil mode)
  (define-key evil-normal-state-map (kbd "<f3>") 'kill-this-buffer)
  (define-key evil-normal-state-map (kbd "<f4>") 'delete-window)
  (define-key evil-normal-state-map (kbd "<f5>") 'evil-scroll-down)
  (define-key evil-normal-state-map (kbd "<f6>") 'evil-scroll-line-to-top)
  (define-key evil-insert-state-map (kbd "<f7>") 'other-window)
  (define-key evil-normal-state-map (kbd "<f7>") 'other-window)
  (define-key evil-normal-state-map (kbd "<f8>") 'evil-scroll-up)
  (define-key evil-normal-state-map (kbd "<f9>") 'evil-switch-to-windows-last-buffer)
  (define-key evil-normal-state-map (kbd "<f10>") 'maximize-buffer)

  ;; f key ez movement bindings (ranger)
  (define-key ranger-mode-map (kbd "<f3>") 'kill-this-buffer)
  (define-key ranger-mode-map (kbd "<f4>") 'delete-window)
  (define-key ranger-mode-map (kbd "<f5>") 'evil-scroll-down)
  (define-key ranger-mode-map (kbd "<f6>") 'evil-scroll-line-to-top)
  (define-key ranger-mode-map (kbd "<f7>") 'other-window)
  (define-key ranger-mode-map (kbd "<f7>") 'other-window)
  (define-key ranger-mode-map (kbd "<f8>") 'evil-scroll-up)
  (define-key ranger-mode-map (kbd "<f9>") 'evil-switch-to-windows-last-buffer)
  (define-key ranger-mode-map (kbd "<f10>") 'maximize-buffer)

  ;; magit
  (spacemacs/declare-prefix "g c" "checkout / commit")
  (define-key evil-normal-state-map (kbd "SPC g c") nil)
  (define-key evil-normal-state-map (kbd "SPC g c o") 'magit-checkout)
  (define-key evil-normal-state-map (kbd "SPC g c b") 'magit-branch-and-checkout)
  (define-key evil-normal-state-map (kbd "SPC g c c") 'magit-commit)
  (define-key evil-normal-state-map (kbd "SPC g c l") 'magit-clone)
  (define-key evil-normal-state-map (kbd "SPC g d") 'magit-diff-working-tree)
  (spacemacs/declare-prefix "g p" "push / pull")
  (define-key evil-normal-state-map (kbd "SPC g p") nil)
  (define-key evil-normal-state-map (kbd "SPC g p p") 'magit-push)
  (define-key evil-normal-state-map (kbd "SPC g p u") 'magit-pull)
  (spacemacs/declare-prefix "g L" "log")
  (define-key evil-normal-state-map (kbd "SPC g L") 'magit-log-buffer-file)

  ;; eclim
  (spacemacs/declare-prefix "e" "eclim")
  (define-key evil-normal-state-map (kbd "SPC e S") 'start-eclimd)
  (define-key evil-normal-state-map (kbd "SPC e e") 'eclim-problems-correct)
  (define-key evil-normal-state-map (kbd "SPC e p") 'eclim-problems-compilation-buffer)
  (define-key evil-normal-state-map (kbd "SPC e r") 'eclim-maven-lifecycle-phase-run)
  (define-key evil-normal-state-map (kbd "SPC e i") 'eclim-java-import-organize)
  (define-key evil-normal-state-map (kbd "SPC e l") 'eclim-java-show-documentation-for-current-element)
  (define-key evil-normal-state-map (kbd "SPC e b") 'eclim-java-find-type)

  ;; compilation mode
  (define-key compilation-mode-map (kbd "r") 'recompile)
  ;; (define-key compilation-mode-map (kbd "f") 'first-error)
  ;; (define-key compilation-mode-map (kbd "n") 'compilation-next-error)
  ;; (define-key compilation-mode-map (kbd "p") 'compilation-previous-error)

  ;; pop dat shell
  (define-key ranger-mode-map (kbd "s") 'spacemacs/default-pop-shell)
  (define-key ranger-mode-map (kbd "S") 'spacemacs/default-pop-shell)

  ;; window move
  (define-key ranger-mode-map (kbd "C-w") 'delete-window)
  (define-key ranger-mode-map (kbd "C-j") 'evil-window-down)
  (define-key ranger-mode-map (kbd "C-k") 'evil-window-up)
  (define-key ranger-mode-map (kbd "C-h") 'evil-window-left)
  (define-key ranger-mode-map (kbd "C-l") 'evil-window-right)

  ;; spotify
  (define-key evil-normal-state-map (kbd "SPC p a") 'helm-spotify-plus)
  (define-key evil-normal-state-map (kbd "SPC p s") 'helm-spotify-plus-toggle-play-pause)
  (define-key evil-normal-state-map (kbd "SPC p n") 'helm-spotify-plus-next)

  ;; etc.
  (define-key evil-normal-state-map (kbd "SPC w w") 'spacemacs/window-manipulation-transient-state/body)
  (define-key evil-normal-state-map (kbd "SPC j j") 'dumb-jump-go)
  (define-key evil-normal-state-map (kbd "SPC k j") 'dumb-jump-go)
  (define-key evil-normal-state-map (kbd "SPC j k") 'dumb-jump-back)
  (define-key evil-normal-state-map (kbd "SPC r r") 'replace-string)
  (define-key evil-normal-state-map (kbd "SPC p D") 'helm-projectile-find-dir)

  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (kubernetes-evil kubernetes treepy graphql realgud test-simple loc-changes load-relative pycoverage traad virtualenvwrapper request-deferred deferred spotify magit-gh-pulls helm-spotify-plus multi github-search github-clone github-browse-file gist gh marshal logito pcache ht docker-compose-mode dockerfile-mode docker tablist docker-tramp white-sand-theme solarized-theme rebecca-theme ranger madhat2r-theme exotica-theme go-guru go-eldoc company-go go-mode vimrc-mode lua-mode fuzzy fill-column-indicator ghub dactyl-mode company-emacs-eclim eclim company-anaconda editorconfig yapfify sql-indent pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode key-chord hy-mode helm-pydoc cython-mode anaconda-mode pythonic smeargle orgit magit-gitflow helm-gitignore gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link evil-magit magit magit-popup ag winum unfill yaml-mode git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-commit with-editor git-gutter flyspell-correct-helm flyspell-correct diff-hl auto-dictionary origami engine-mode powershell web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc company-tern dash-functional tern coffee-mode web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data zonokai-theme zenburn-theme zen-and-art-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme soothe-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme pastels-on-dark-theme organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme niflheim-theme naquadah-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme lush-theme light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatui-theme flatland-theme firebelly-theme farmhouse-theme espresso-theme dracula-theme django-theme darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme xterm-color shell-pop multi-term eshell-z eshell-prompt-extras esh-help org-projectile org-present org org-pomodoro alert log4e gntp org-download mwim mmm-mode markdown-toc markdown-mode htmlize helm-company helm-c-yasnippet gnuplot gh-md flycheck-pos-tip pos-tip flycheck company-statistics company auto-yasnippet yasnippet ac-ispell auto-complete colorsarenice-theme ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide ido-vertical-mode hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump f s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed dash aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async quelpa package-build spacemacs-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (jinja2-mode company-ansible ansible-doc ansible kubernetes-evil kubernetes treepy graphql realgud test-simple loc-changes load-relative pycoverage traad virtualenvwrapper request-deferred deferred spotify magit-gh-pulls helm-spotify-plus multi github-search github-clone github-browse-file gist gh marshal logito pcache ht docker-compose-mode dockerfile-mode docker tablist docker-tramp white-sand-theme solarized-theme rebecca-theme ranger madhat2r-theme exotica-theme go-guru go-eldoc company-go go-mode vimrc-mode lua-mode fuzzy fill-column-indicator ghub dactyl-mode company-emacs-eclim eclim company-anaconda editorconfig yapfify sql-indent pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode key-chord hy-mode helm-pydoc cython-mode anaconda-mode pythonic smeargle orgit magit-gitflow helm-gitignore gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link evil-magit magit magit-popup ag winum unfill yaml-mode git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-commit with-editor git-gutter flyspell-correct-helm flyspell-correct diff-hl auto-dictionary origami engine-mode powershell web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc company-tern dash-functional tern coffee-mode web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data zonokai-theme zenburn-theme zen-and-art-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme soothe-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme pastels-on-dark-theme organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme niflheim-theme naquadah-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme lush-theme light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatui-theme flatland-theme firebelly-theme farmhouse-theme espresso-theme dracula-theme django-theme darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme xterm-color shell-pop multi-term eshell-z eshell-prompt-extras esh-help org-projectile org-present org org-pomodoro alert log4e gntp org-download mwim mmm-mode markdown-toc markdown-mode htmlize helm-company helm-c-yasnippet gnuplot gh-md flycheck-pos-tip pos-tip flycheck company-statistics company auto-yasnippet yasnippet ac-ispell auto-complete colorsarenice-theme ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide ido-vertical-mode hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump f s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed dash aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async quelpa package-build spacemacs-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)


