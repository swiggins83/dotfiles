;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
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
   '(
     restclient
     rust
     nginx
     ansible
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
     treemacs
     version-control
                      ;; :variables
                      ;; version-control-global-margin t)
     )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      beacon
                                      kubernetes
                                      dired-git-info
                                      evil-collection
                                      sublimity
                                      vmd-mode
                                      pycoverage
                                      docker-compose-mode
                                      traad
                                      key-chord
                                      editorconfig
                                      exec-path-from-shell
                                      diff-hl
                                      )
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
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=~/.emacs.d/.cache/dumps/spacemacs.pdmp
   ;; (default spacemacs.pdmp)
   dotspacemacs-emacs-dumper-dump-file "spacemacs.pdmp"

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
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
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

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
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
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

   ;; Default font or prioritized list of fonts.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 18
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
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

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

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
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
   dotspacemacs-maximized-at-startup nil

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' in OSX to obtain
   ;; borderless fullscreen. (default nil)
   dotspacemacs-undecorated-at-startup nil

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

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   dotspacemacs-mode-line-theme 'vim-powerline

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but lines are only visual lines are counted. For example, folded lines
   ;; will not be counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers t

   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'origami
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'current

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle 120

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."

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
  (add-hook 'compilation-mode-hook (lambda () (font-lock-mode -1)))

  ;; proced
  (defun proced-settings ()
    (proced-toggle-auto-update))
  (add-hook 'proced-mode-hook 'proced-settings)

  )

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
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
  (require 'helm-command)
  (require 'editorconfig)
  (require 'evil-matchit)
  (require 'all-the-icons)
  (require 'ansi-color)
  (require 'compile)

  (remove-hook 'comint-output-filter-functions
               'comint-postoutput-scroll-to-bottom)

  ;; etc
  (beacon-mode 1)
  (editorconfig-mode t)
  (global-evil-matchit-mode 1)
  (golden-ratio-mode t)
  (setq evil-normal-state-modes (append evil-motion-state-modes evil-normal-state-modes))

  ;; compilation mode
  (defun colorize-compilation-buffer ()
    (toggle-read-only)
    (ansi-color-apply-on-region compilation-filter-start (point))
    (toggle-read-only))
  (add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

  ;; magit
  (global-git-commit-mode t)
  (setq magit-repository-directories '("/Users/stevenwiggins/development/"))
  ;; (add-hook 'magit-mode-hook 'turn-on-magit-gh-pulls)

  ;; projectile
  (setq projectile-globally-ignored-file-suffixes '(".class" ".xd" ".blob" ".lck" ".jks" ".exec" ".min.js"))
  (setq projectile-enable-caching t)
  (setq projectile-indexing-method 'alien)
  (setq projectile-find-dir-includes-top-level t)
  (setq projectile-switch-project-action 'projectile-find-dir)
  (add-hook 'projectile-find-dir-hook 'deer)

  ;; compilation
  (setq compilation-always-kill t)
  (setq compilation-scroll-output nil)

  ;; ag
  (setq helm-ag-use-agignore t)

  ;; grep
  (setq grep-find-ignored-directories '(".git" "node_modules"))
  (setq grep-find-ignored-files '("*.class" "*.xd" "*.blob" "*.lck" "*.jks" "*.exec" "*.jar" "*.lst" "*.csv" "*.min.js" "*.pyc"))

  ;; https://gist.github.com/pesterhazy/fabd629fbb89a6cd3d3b92246ff29779
  ;; ripgrep
  (evil-leader/set-key "/" 'spacemacs/helm-project-do-ag)
  (setq helm-ag-base-command "rg -S --no-heading")

  ;; dired
  (with-eval-after-load 'dired
    (define-key dired-mode-map ")" 'dired-git-info-mode))
  (setq dired-dwim-target t)

  ;; js
  (setq js-indent-level 2)

  ;; python
  (setq flycheck-python-pycompile-executable 'python3)
  (setq flycheck-python-pylint-executable 'python3)

  (defun kill-to-end-of-buffer() "Deletes all lines after the current line"
         (interactive)
         (progn
           (forward-line 1)
           (delete-region (point) (point-max))))


  ;; key chord (binding action to one key after another)
  (setq key-chord-one-key-delay 0.6)
  (key-chord-mode t)

  (key-chord-define evil-insert-state-map "\'\'" 'delete-window)
  (key-chord-define evil-normal-state-map "\'\'" 'delete-window)

  (key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
  (key-chord-define evil-insert-state-map "kk" 'evil-normal-state)

  ;; kill
  (key-chord-define evil-normal-state-map "d\'" 'kill-to-end-of-buffer)

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
  (define-key evil-normal-state-map (kbd "C-o") 'other-frame)

  (define-key evil-normal-state-map (kbd "s-g") 'evil-goto-line)
  (define-key evil-normal-state-map (kbd "SPC j j") 'dumb-jump-go)
  (define-key evil-normal-state-map (kbd "SPC k j") 'dumb-jump-go)
  (define-key evil-normal-state-map (kbd "SPC j k") 'dumb-jump-back)

  (define-key evil-normal-state-map (kbd "s-]") 'evil-forward-paragraph)
  (define-key evil-normal-state-map (kbd "s-[") 'evil-backward-paragraph)

  (define-key evil-normal-state-map (kbd "s-d") 'evil-scroll-down)
  (define-key evil-normal-state-map (kbd "s-u") 'evil-scroll-up)
  (define-key evil-normal-state-map (kbd "s-t") 'evil-scroll-line-to-top)

  (define-key shell-mode-map (kbd "k") 'evil-window-up)
  (define-key shell-mode-map (kbd "C-k") 'evil-window-up)

  (define-key ranger-mode-map (kbd "s-l") 'evil-window-right)

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
  (define-key compilation-minor-mode-map (kbd "r") 'recompile)
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
  (define-key evil-normal-state-map (kbd "SPC r r") 'replace-string)
  (define-key evil-normal-state-map (kbd "SPC p D") 'helm-projectile-find-dir)

  )
