;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Package                                                                      ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;c-x i insert file
;c-x c-i indent region
;c-x c-x exchange mark
;M-% Query replace
;C-M-s Regexp search
;M-! exec shell oommand c-u M-! insert current buffer
;M-| shell command region  c-u M-! insert current buffer
;M-; comment
;macro
; c-x ( start macro
; c-x ) end macro

;矩形
; rectange-mark-mode

;;; load-path
(add-to-list 'load-path "~/.emacs.d/elisp")

;;; package
(require 'package)
;(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

;;; quelpa
(if (require 'quelpa nil t)
    (quelpa-self-upgrade)
  (with-temp-buffer
    (url-insert-file-contents "https://raw.github.com/quelpa/quelpa/master/bootstrap.el")
    (eval-buffer)))

;; List quelpa
(quelpa 'let-alist)
(quelpa 'ac-html)
(quelpa 'ace-jump-mode)
(quelpa 'ace-link)
(quelpa 'ace-window)
(quelpa 'anzu)
(quelpa 'atom-dark-theme)
(quelpa 'atom-one-dark-theme)
(quelpa 'auto-complete)
(quelpa 'company)
(quelpa 'company-go)
(quelpa 'company-quickhelp)
(quelpa 'direx)
(quelpa 'eldoc-extension)
(quelpa 'exec-path-from-shell)
(quelpa 'expand-region)
(quelpa 'free-keys)
(quelpa 'flycheck)
(quelpa 'ggtags)
(quelpa 'git-commit-mode)
(quelpa 'git-gutter)
(quelpa 'git-rebase-mode)
(quelpa 'go-mode)
(quelpa 'go-autocomplete)
(quelpa 'go-eldoc)
(quelpa 'go-direx)
(quelpa 'graphviz-dot-mode)
(quelpa 'haskell-mode)
(quelpa 'helm)
(quelpa 'helm-ag)
(quelpa 'helm-c-yasnippet)
(quelpa 'helm-descbinds)
(quelpa 'helm-gtags)
(quelpa 'helm-projectile)
(quelpa 'helm-swoop)
(quelpa 'inf-ruby)
(quelpa 'js2-mode)
(quelpa 'json-mode)
(quelpa 'magit)
(quelpa 'markdown-mode)
(quelpa 'moe-theme)
(quelpa 'multiple-cursors)
(quelpa 'mwim)
(quelpa 'neotree)
(quelpa 'open-junk-file)
(quelpa 'plan9-theme)
(quelpa 'popup)
(quelpa 'projectile)
(quelpa 'projectile-codesearch)
(quelpa 'quickrun)
(quelpa 'rainbow-delimiters)
(quelpa 'recentf-ext)
(quelpa 'robe)
(quelpa 'ruby-end)
(quelpa 'scala-mode2)
(quelpa 'scss-mode)
(quelpa 'smartrep)
(quelpa 'tern)
(quelpa 'tern-auto-complete)
(quelpa 'company-tern)
(quelpa 'terraform-mode)
(quelpa 'undo-tree)
(quelpa 'web-mode)
(quelpa 'yaml-mode)
(quelpa 'yasnippet)
(quelpa 'zenburn-theme)


(setq ac-symbols-cache
            (cl-loop for x being the symbols
                     if (or (fboundp x)
                            (boundp x)
                            (symbol-plist x))
                     collect (symbol-name x)))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Theme                                                                        ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'moe-theme)

;(load-theme 'atom-dark t)
;(load-theme 'atom-one-dark t)
;(load-theme 'manoj-dark t)
(load-theme 'moe-dark t)
;(load-theme 'moe-light t)
;(load-theme 'plan9 t)
;(load-theme 'tango-dark t)
;(load-theme 'zenburn t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Font                                                                         ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; MAC用フォント設定
;; http://tcnksm.sakura.ne.jp/blog/2012/04/02/emacs/
 ;; 英語
 (set-face-attribute 'default nil
             :family "Menlo" ;; font
             :height 135)    ;; font size

;; 日本語
(set-fontset-font
 nil 'japanese-jisx0208
;; (font-spec :family "Hiragino Mincho Pro")) ;; font
  (font-spec :family "Hiragino Kaku Gothic ProN")) ;; font

;; 半角と全角の比を1:2にしたければ
(setq face-font-rescale-alist
;;        '((".*Hiragino_Mincho_pro.*" . 1.2)))
      '((".*Hiragino_Kaku_Gothic_ProN.*" . 1.2)));; Mac用フォント設定


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ace-jump-mode                                                                ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun add-keys-to-ace-jump-mode (prefix c &optional mode)
  (define-key global-map
    (read-kbd-macro (concat prefix (string c)))
    `(lambda ()
       (interactive)
       (funcall (if (eq ',mode 'word)
         #'ace-jump-word-mode
         #'ace-jump-char-mode) ,c))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ace-link                                                                     ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(ace-link-setup-default)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ace-window                                                                   ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; anzu                                                                         ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-anzu-mode +1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; aspell                                                                       ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(when (executable-find "aspell") 
  (setq-default ispell-program-name "aspell")
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; auto-complete                                                                ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'auto-complete)
(require 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)
(setq ac-use-menu-map t)
(setq ac-auto-start 2)  ;; n文字以上の単語の時に補完を開始
(setq ac-delay 0.05)  ;; n秒後に補完開始
;(setq ac-use-fuzzy t)  ;; 曖昧マッチ有効
;(setq ac-use-comphist t)  ;; 補完推測機能有効
(setq ac-auto-show-menu 0.05)  ;; n秒後に補完メニューを表示
(setq ac-quick-help-delay 0.5)  ;; n秒後にクイックヘルプを表示
(setq ac-ignore-case t)  ;; 大文字・小文字を区別する
(setq ac-dwim nil)
(setq ac-trigger-commands '(self-insert-command delete-backward-char)) ;;補完開始のコマンド


(add-to-list 'ac-modes 'text-mode)
(add-to-list 'ac-modes 'markdown-mode)
(add-to-list 'ac-modes 'yaml-mode)
(add-to-list 'ac-modes 'json-mode)

(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")

(defun ac-common-setup ()
  (add-to-list 'ac-sources 'ac-source-yasnippet)
  ac-sources
)

;auto-complete
(define-key ac-mode-map (kbd "M-?") 'auto-complete)
(define-key ac-completing-map (kbd "TAB") 'ac-complete)
(define-key ac-completing-map [tab] 'ac-complete)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; company                                                                      ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (require 'company)
;; (add-hook 'after-init-hook 'global-company-mode)
;; (setq company-idle-delay 0) ; デフォルトは0.5
;; (setq company-minimum-prefix-length 2) ; デフォルトは4
;; (setq company-selection-wrap-around t) ; 候補の一番下でさらに下に行こうとすると一番上に戻る
;; (setq company-begin-commands '(self-insert-command
;;                                delete-backward-char
;;                                org-self-insert-command
;;                                orgtbl-self-insert-command
;;                                c-scope-operator
;;                                c-electric-colon
;;                                c-electric-lt-gt
;;                                c-electric-slash))

;; (setq company-backends '((company-yasnippet company-dabbrev-code company-gtags company-etags
;;                                            company-keywords)
;;                          company-oddmuse company-files company-dabbrev))

;;  (add-hook 'go-mode-hook
;;            (lambda ()
;;              (set (make-local-variable 'company-backends) '(
;;                                                             (company-go company-yasnippet company-keywords)
;;                                                             ))))
;; (company-quickhelp-mode 1)
;;
;; ; company
;; (define-key company-mode-map (kbd "M-?") 'company-complete)
;; (define-key company-active-map (kbd "C-n") 'company-select-next)
;; (define-key company-active-map (kbd "C-p") 'company-select-previous)
;; (define-key company-active-map [tab] 'company-complete-selection)
;; (define-key company-active-map (kbd "TAB") 'company-complete-selection)
;; (define-key company-active-map (kbd "M-n") nil)
;; (define-key company-active-map (kbd "M-p") nil)
;; (define-key company-active-map (kbd "C-h") nil)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; flycheck                                                                     ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-hook 'after-init-hook #'global-flycheck-mode)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; git-gutter                                                                   ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-git-gutter-mode 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("f05342b7fc8b59ffbcd450b03f25d2ba48177133e37781ea34f9facc54557056" "4ffab30a4cb29e07e9d18d4566f271644ad4070c9d103815831cf25ac794a045" "32670bc9e04237f376f1446de3d3a3526bc22afec5f4420aed0884570755e198" default)))
 '(git-gutter:handled-backends (quote (git hg)))
 '(git-gutter:unchanged-sign " "))
(set-face-background 'git-gutter:unchanged "yellow")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; helm                                                                         ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'helm-config)
(helm-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; helm-descbinds-mode                                                          ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(helm-descbinds-mode)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; open-junk-file                                                               ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'open-junk-file)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; rainbow-delimiters                                                           ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'scheme-mode-hook 'rainbow-delimiters-mode)
(add-hook 'lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; recentf, recentf-ext                                                         ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq recentf-max-saved-items 1000)
(require 'recentf-ext)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; yasnippet                                                                    ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;https://github.com/capitaomorte/yasnippet
;http://yasnippet-doc-jp.googlecode.com/svn-history/r5/trunk/doc-jp/index.html

(yas-global-mode 1)
(setq yas/prompt-functions '(yas/completing-prompt yas/ido-prompt))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; undo-tree                                                                    ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-undo-tree-mode t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Elisp                                                                        ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
             (require 'eldoc-extension)
             (eldoc-mode t)
             ))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Haskel                                                                      ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; haskell-mode
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
;(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)
(add-to-list 'auto-mode-alist '("\\.hs$" . haskell-mode))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Javascript                                                                         ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-hook 'js2-mode-hook
          '(lambda ()
             (setq js2-basic-offset 2)
             (setq js-indent-level 2)
             ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Json                                                                         ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-hook 'json-mode-hook
          '(lambda ()
             (setq js-indent-level 2)
             ))

(setq json-reformat:indent-width 2)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Markdown                                                                     ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

                                        ; mark  down-mode
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Ruby                                                                         ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; robe-mode
(add-hook 'ruby-mode-hook 'robe-mode)
(add-hook 'robe-mode-hook 'ac-robe-setup)

;"# -*- coding: utf-8 -*-"のようなコメントの自動挿入をやめる
(setq ruby-insert-encoding-magic-comment nil)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; sh                                                                           ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; C-c : sh-set-shell

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Terraform                                                                    ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq terraform-indent-level 4)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Web                                                                          ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;scss
(add-hook 'scss-mode-hook 'ac-css-mode-setup)

;;; web-mode
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Go                                                                           ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;go get golang.org/x/tools/cmd/goimports
;go get github.com/rogpeppe/godef
;go get github.com/nsf/gocode

;go-autocomplete
; add (require 'go-autocomplete) before auto-complete (ac-config-default)

;(setq gofmt-command "goimports")
(add-hook 'go-mode-hook
          (lambda ()
            (go-eldoc-setup)
            (add-hook 'before-save-hook 'gofmt-before-save)
            (setq tab-width 4)
            (setq indent-tabs-mode 1)
            (define-key go-mode-map (kbd "M-.") 'godef-jump)
            (define-key go-mode-map (kbd "M-,") 'pop-tag-mark)))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; OS                                                                           ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; OSX
(when (eq system-type 'darwin)
  ;;; hyper key
  (setq ns-right-command-modifier (quote hyper))  
  ;(setq ns-command-modifier (quote meta))
  ;(setq ns-alternate-modifier (quote super))
  ;(setq ns-right-alternate-modifier (quote alt))
  )

; linux
(when (eq system-type 'gnu/linux)
  )

; windows
(when (eq system-type 'windows-nt)
  ;; make PC keyboard's Win key or other to type Super or Hyper, for emacs running on Windows.
  ;(setq w32-pass-lwindow-to-system nil)
  ;(setq w32-lwindow-modifier 'super) ; Left Windows key

  ;(setq w32-pass-rwindow-to-system nil)
  ;(setq w32-rwindow-modifier 'super) ; Right Windows key

  (setq w32-pass-apps-to-system nil)
  (setq w32-apps-modifier 'hyper) ; Menu/App key
  )

; cocoa
(when (eq window-system 'ns)
  ;;;exec-path-from-shell
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOPATH")
  )

; X
(when (eq window-system 'X)
  ;;;exec-path-from-shell
  (exec-path-from-shell-initialize)  
  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Basic setting                                                                ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; 右から左に読む言語に対応させないことで描画高速化
(setq-default bidi-display-reordering nil)

; 起動時の画面を表示しない
(setq inhibit-startup-message -1)
(setq inhibit-startup-screen -1)

; splash screenを無効にする
(setq inhibit-splash-screen -1)

; 同じ内容を履歴に記録しないようにする
(setq history-delete-duplicates t)

; C-u C-SPC C-SPC ...でどんどん過去のマークを遡る

(setq set-mark-command-repeat-pop t)

; メニューを非表示
;;;(menu-bar-mode 1)
(tool-bar-mode 0)

; 時刻の表示
(display-time)

; 対応する括弧を光らせる。
(show-paren-mode 1)

; バックアップ・オートセーブファイルの作成をやめる
(setq make-backup-files nil)
(setq auto-save-default nil)

; スペース、タブの表示
;;;(global-whitespace-mode 1)

; インデントにTABを使わないようにする
(setq-default indent-tabs-mode nil)

; 括弧内を強調
; ウィンドウ内に収まらないときだけ括弧内も光らせる。
;(setq show-paren-style 'expression)
; ウィンドウ内に収まらないときだけ括弧内も光らせる。
(setq show-paren-style 'mix)

; 履歴の設定
(setq history-length 10000)

; scrollは１行で
(setq scroll-step 1
      scroll-conservatively 10000)

; 列番号の表示
(column-number-mode t)

; 大文字と小文字を無視
(setq completion-ignore-case t)

; 日本語設定
(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)
(setq default-coding-systems 'utf-8)
(setq file-name-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)


; 画面を最大化
(set-frame-parameter nil 'fullscreen 'fullboth)

; kill ring size
(setq kill-ring-max 1000)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Key-map                                                                       ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; basic
(global-set-key "\C-h" 'delete-backward-char)
;(global-set-key "\C-o" 'other-window)

; ace-jump-mode
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(loop for c from ?0 to ?9 do (add-keys-to-ace-jump-mode "H-" c))
(loop for c from ?a to ?z do (add-keys-to-ace-jump-mode "H-" c))
(loop for c from ?0 to ?9 do (add-keys-to-ace-jump-mode "H-M-" c 'word))
(loop for c from ?a to ?z do (add-keys-to-ace-jump-mode "H-M-" c 'word))
(loop for c from ?! to ?~ do (add-keys-to-ace-jump-mode "H-" c))
(loop for c from ?! to ?~ do (add-keys-to-ace-jump-mode "H-M-" c 'word))

;;; ace-link 
(eval-after-load 'eww '(define-key eww-mode-map "f" 'ace-link-eww))

;;; ace-windows
(global-set-key (kbd "C-x o") 'ace-window)



; expand-region
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C-M-=") 'er/contract-region) ;; リージョンを狭める

; git-gutter
(global-set-key (kbd "C-c g p") 'git-gutter:previous-hunk)
(global-set-key (kbd "C-c g n") 'git-gutter:next-hunk)
(global-set-key (kbd "C-c g r") 'git-gutter:revert-hunk)

; helm
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(global-set-key (kbd "C-c C-h") 'helm-mini)
(global-set-key (kbd "C-c h s") 'helm-ag)
(global-set-key (kbd "C-c h h") 'helm-mini)
(global-set-key (kbd "C-c h r") 'helm-recentf)
(global-set-key (kbd "C-c h i") 'helm-imenu)
(global-set-key (kbd "C-c h k") 'helm-show-kill-ring)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(define-key helm-map (kbd "C-h") 'delete-backward-char)

; helm-projectile
(global-set-key (kbd "C-c p p") 'helm-projectile)
(global-set-key (kbd "C-c p s") 'helm-projectile-ag)

; mwin
(global-set-key (kbd "C-a") 'mwim-beginning-of-line-or-code)
(global-set-key (kbd "C-e") 'mwim-end-of-line-or-code)
;; (global-set-key (kbd "C-a") 'mwim-beginning-of-line-or-code)
;; (global-set-key (kbd "C-e") 'mwim-end-of-line-or-code)

; yasnippet
(define-key yas-minor-mode-map (kbd "C-c y n") 'yas-new-snippet)
(define-key yas-minor-mode-map (kbd "C-c y i") 'yas-insert-snippet)
(define-key yas-minor-mode-map (kbd "C-c y v") 'helm-yas-visit-snippet-file)
(define-key yas-minor-mode-map (kbd "C-c y e") 'yas-expand)
;;(define-key yas-minor-mode-map (kbd "C-@") 'yas-expand)
(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)

;;; multiple-cursors
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;;; neotree
(global-set-key [f8] 'neotree-toggle)

;;; undo-tree
(global-set-key (kbd "C-?") 'undo-tree-redo)

;;; smarttrep
;; https://github.com/myuhe/smartrep.el
;; (smartrep-define-key
;;     global-map "M-g"
;;   '(("n" . next-line)
;;     ("p" . previous-line)))

