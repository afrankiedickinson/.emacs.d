;; LSP for Javascript
(add-to-list 'load-path "~/lsp-mode")
(add-to-list 'load-path "~/lsp-javascript")
(require 'lsp-javascript-typescript)
(add-hook 'js-mode-hook #'lsp-javascript-typescript-enable)
;; (add-hook 'typescript-mode-hook #'lsp-javascript-typescript-enable) ;; for typescript support
(add-hook 'js3-mode-hook #'lsp-javascript-typescript-enable) ;; for js3-mode support
(add-hook 'rjsx-mode #'lsp-javascript-typescript-enable) ;; for rjsx-mode support

;; Completion prefix temp bug fix 
(defun my-company-transformer (candidates)
  (let ((completion-ignore-case t))
    (all-completions (company-grab-symbol) candidates)))

(defun my-js-hook nil
  (make-local-variable 'company-transformers)
  (push 'my-company-transformer company-transformers))

(add-hook 'js-mode-hook 'my-js-hook)

require 'lsp-javascript-flow)
(add-hook 'js-mode-hook #'lsp-javascript-flow-enable)
(add-hook 'js2-mode-hook #'lsp-javascript-flow-enable) ;; for js2-mode support
(add-hook 'rjsx-mode #'lsp-javascript-flow-enable) ;; for rjsx-mode support

