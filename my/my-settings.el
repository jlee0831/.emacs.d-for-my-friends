(setq custom-file "~/.emacs.d/my/my-customizations.el"
      inferior-lisp-program "clisp -K full"
      tramp-default-method "ssh"
      ido-enable-flex-matching t
      org-log-done t
      require-trailing-newline t
      x-select-enable-clipboard t
      inhibit-startup-message t
      backup-directory-alist '(("." . "~/.emacs.d/.backups"))
      echo-keystrokes 0.1
      next-line-add-newlines nil
      recentf-max-saved-items 999
      column-number-mode t
      ido-max-directory-size 100000
      magit-completing-read 'ido-completing-read
      font-lock-maximum-decoration t)

(setq-default kill-read-only-ok t
              indent-tabs-mode nil)

(set-default 'tramp-default-proxies-alist (quote ((".*" "\\`root\\'" "/ssh:%h:"))))
;; allows files to be opened like:
;; /sudo:root@host:

(fset 'yes-or-no-p 'y-or-n-p)
(put 'narrow-to-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(load custom-file)

;; BEGIN ESLINT STUFF

;; use web-mode for .jsx files
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))

;; http://www.flycheck.org/manual/latest/index.html
(require 'flycheck)

;; turn on flychecking globally
(add-hook 'after-init-hook #'global-flycheck-mode)

;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers '(javascript-jshint))

;; use eslint with web-mode for jsx files
(flycheck-add-mode 'javascript-eslint 'web-mode)

;; disable json-jsonlist checking for json files
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(json-jsonlist)))

;; https://github.com/purcell/exec-path-from-shell
;; only need exec-path-from-shell on OSX
;; this hopefully sets up path and other vars better
;; (when (memq window-system '(mac ns))
;;   (exec-path-from-shell-initialize))

;; END ESLINT STUFF

(provide 'my-settings)
