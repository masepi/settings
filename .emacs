


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Packet manager
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)

(require 'evil)
(evil-mode 1)

(tool-bar-mode -1)
(scroll-bar-mode -1)
(set-default-font "Monaco 14")

;; Scrolling settings
(setq scroll-step               1) ;; РІРІРµСЂС…-РІРЅРёР· РїРѕ 1 СЃС‚СЂРѕРєРµ
(setq scroll-margin            10) ;; СЃРґРІРёРіР°С‚СЊ Р±СѓС„РµСЂ РІРµСЂС…/РІРЅРёР· РєРѕРіРґР° РєСѓСЂСЃРѕСЂ РІ 10 С€Р°РіР°С… РѕС‚ РІРµСЂС…РЅРµР№/РЅРёР¶РЅРµР№ РіСЂР°РЅРёС†С‹  
(setq scroll-conservatively 10000)

; line and column number
(setq column-number-mode t)

; prefer unicode
(prefer-coding-system 'utf-8)

; window navigation
(global-set-key (kbd "<M-left>")  'windmove-left)
(global-set-key (kbd "<M-right>") 'windmove-right)
(global-set-key (kbd "<M-up>")    'windmove-up)
(global-set-key (kbd "<M-down>")  'windmove-down)

; change window size
(global-set-key (kbd "<s-up>") 'shrink-window)
(global-set-key (kbd "<s-down>") 'enlarge-window)
(global-set-key (kbd "<s-left>") 'shrink-window-horizontally)
(global-set-key (kbd "<s-right>") 'enlarge-window-horizontally)

; auto pair
(electric-pair-mode)
;; Show-paren-mode settings
(show-paren-mode t) ;; РІРєР»СЋС‡РёС‚СЊ РІС‹РґРµР»РµРЅРёРµ РІС‹СЂР°Р¶РµРЅРёР№ РјРµР¶РґСѓ {},[],()
(setq show-paren-style 'expression) ;; РІС‹РґРµР»РёС‚СЊ С†РІРµС‚РѕРј РІС‹СЂР°Р¶РµРЅРёСЏ РјРµР¶РґСѓ {},[],()


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(require 'auto-complete)
(global-auto-complete-mode t)

(require 'yasnippet)
(yas-global-mode 1)

(defun my-c-mode-common-hook ()
 ;; my customizations for all of c-mode, c++-mode, objc-mode, java-mode
 (c-set-offset 'substatement-open 0)
 ;; other customizations can go here

 (setq c++-tab-always-indent t)
 (setq c-basic-offset 4)                  ;; Default is 2
 (setq c-indent-level 4)                  ;; Default is 2
 (setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60))
 (setq tab-width 4)
 (setq indent-tabs-mode t)  ; use spaces only if nil
 )
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

(electric-indent-mode)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; no indent in namespaces
(defconst my-cc-style
  '("cc-mode"
    (c-offsets-alist . ((innamespace . [0])))))

(c-add-style "my-cc-mode" my-cc-style)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Auto-complete C/C++ header file names
(add-hook 'c-mode-common-hook
      (lambda()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'achead:include-directories '"/usr/include/c++/4.8.2")
 ))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CEDET

(require 'cedet) ;; РёСЃРїРѕР»СЊР·СѓСЋ "РІС€РёС‚СѓСЋ" РІРµСЂСЃРёСЋ CEDET. РњРЅРµ С…РІР°С‚Р°РµС‚...
(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-mru-bookmark-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-highlight-func-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-completions-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-show-parser-state-mode)
(semantic-mode   t)
(global-ede-mode t)
(require 'ede/generic)
(require 'semantic/ia)
(ede-enable-generic-projects)

;; Auto-complete plugin <http://www.emacswiki.org/emacs/AutoComplete>
(defun ac-init()
    (require 'auto-complete-config)
    (ac-config-default)
    (setq ac-auto-start        t)
    (setq ac-auto-show-menu    t)
    (global-auto-complete-mode t)
    (add-to-list 'ac-modes   'lisp-mode)
    (add-to-list 'ac-sources 'ac-source-semantic) ;; РёСЃРєР°С‚СЊ Р°РІС‚РѕРґРѕРїРѕР»РЅРµРЅРёСЏ РІ CEDET
    (add-to-list 'ac-sources 'ac-source-variables) ;; СЃСЂРµРґРё РїРµСЂРµРјРµРЅРЅС‹С…
    (add-to-list 'ac-sources 'ac-source-functions) ;; РІ РЅР°Р·РІР°РЅРёСЏС… С„СѓРЅРєС†РёР№
    (add-to-list 'ac-sources 'ac-source-dictionary) ;; РІ С‚РѕР№ РїР°РїРєРµ РіРґРµ СЂРµРґР°РєС‚РёСЂСѓРµРјС‹Р№ Р±СѓС„РµСЂ
    (add-to-list 'ac-sources 'ac-source-words-in-all-buffer) ;; РїРѕ РІСЃРµРјСѓ Р±СѓС„РµСЂСѓ
    (add-to-list 'ac-sources 'ac-source-files-in-current-dir))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;switch source-header by s-o
(add-hook 'c-mode-common-hook
  (lambda() 
    (local-set-key  (kbd "s-o") 'ff-find-other-file)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defconst my-cc-style
  '("gnu"
    (c-offsets-alist . ((innamespace . [4])))))

(c-add-style "my-cc-style" my-cc-style)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

(semantic-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defun my-recompile ()
    "Run compile and resize the compile window closing the old one if necessary"
    (interactive)
    (progn
      (if (get-buffer "*compilation*") ; If old compile window exists
  	(progn
  	  (delete-windows-on (get-buffer "*compilation*")) ; Delete the compilation windows
  	  (kill-buffer "*compilation*") ; and kill the buffers
  	  )
        )
      (call-interactively 'compile)
      (enlarge-window 20)
      )
  )
  (defun my-next-error () 
    "Move point to next error and highlight it"
    (interactive)
    (progn
      (next-error)
      (end-of-line-nomark)
      (beginning-of-line-mark)
      )
  )
  
  (defun my-previous-error () 
    "Move point to previous error and highlight it"
    (interactive)
    (progn
      (previous-error)
      (end-of-line-nomark)
      (beginning-of-line-mark)
      )
  )
  (global-set-key (kbd "C-n") 'my-next-error)
  (global-set-key (kbd "C-p") 'my-previous-error)
  
(global-set-key [f5] 'my-recompile)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'semantic)
(require 'semantic/bovine/gcc)

(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-local-symbol-highlight-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-summary-mode)

(semantic-mode 1)
(global-ede-mode t)
(ede-enable-generic-projects)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-hook 'after-init-hook 'global-company-mode)

(require 'ido)
(ido-mode t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org mode
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-log-done 'time)
(setq org-agenda-files (list "~/org/work.org"
                             "~/org/home.org"
                             "~/org/projectz.org"))

(require 'org-cua-dwim)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'function-args)
(fa-config-default)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define-key global-map (kbd "C-c ;") 'iedit-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




