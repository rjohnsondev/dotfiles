(require 'package)
(require 'subr-x)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(require 'package)
(add-to-list 'package-archives
                          '("melpa" . "https://melpa.org/packages/") t)
(when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
      (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

(global-git-gutter+-mode)
(require 'git-gutter-fringe+)
(git-gutter-fr+-minimal)
(tool-bar-mode -1)
(global-linum-mode 1)

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))

(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(set-variable 'undo-tree-auto-save-history 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (github)))
 '(custom-safe-themes
   (quote
    ("dc758223066a28f3c6ef6c42c9136bf4c913ec6d3b710794252dc072a3b92b14" default)))
 '(inhibit-startup-screen t)
 '(tool-bar-mode nil))
 '(custom-theme-directory "~/.emacs.d/themes/")
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Consolas" :foundry "microsoft" :slant normal :weight normal :height 132 :width normal)))))

;; The following will create a minor mode foo-mode with Normal
;; state bindings for the keys w and e:

(defun evil-hack ()
    (message "one")
    (define-minor-mode cider-enter-eval-mode
                       "cider enter-eval mode"
                       :keymap (make-sparse-keymap))
    (message "two")
    (evil-define-key ’normal cider-enter-eval-mode-map (kbd "RET") 'cider-eval-last-sexp)
    (message "three")
    ;; This minor mode can then be enabled in any buffers where the
    ;; custom bindings are desired:
    (add-hook 'cider-mode-hook 'cider-enter-eval-mode) ; enable alongside text-mode
    (message "added?")
    )


;; (eval-after-load
;;     'evil
;;     (lambda ()
;;         (message "one")
;;         (define-minor-mode cider-enter-eval-mode
;;                            "cider enter-eval mode"
;;                            :keymap (make-sparse-keymap))
;;         (message "two")
;;         (evil-define-key 'normal cider-enter-eval-mode-map (kbd "RET") 'cider-eval-last-sexp)
;;         (message "three")
;;         ;; This minor mode can then be enabled in any buffers where the
;;         ;; custom bindings are desired:
;;         (add-hook 'cider-mode-hook 'cider-enter-eval-mode) ; enable alongside text-mode
;;         (message "added?"))
;; )
(eval-after-load
  'evil
  '(progn
     (define-key evil-normal-state-map (kbd "C-S-h") 'previous-buffer)
     (define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
     (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
     (define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
     (define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)
     (define-key evil-normal-state-map (kbd "C-S-l") 'next-buffer)
     (evil-define-key 'normal cider-mode-map (kbd "RET") 'cider-eval-last-sexp)
     (evil-define-key 'normal cider-mode-map [(control return)] 'cider-pprint-eval-last-sexp)))

(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

(require 'evil)
(evil-mode t)
