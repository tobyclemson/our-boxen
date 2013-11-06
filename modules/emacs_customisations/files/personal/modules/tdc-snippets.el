(prelude-ensure-module-deps '(yasnippet))
(require 'yasnippet)
(yas-global-mode 1)

(defvar tdc-snippets-dir (expand-file-name "snippets" prelude-personal-dir)
  "The directory containing personal snippets.")

(add-to-list 'yas-snippet-dirs tdc-snippets-dir)
(delete "~/.emacs.d/snippets" 'yas-snippet-dirs)

(setq
 yas/prompt-functions
 '(yas/ido-prompt
   yas/dropdown-prompt
   yas/completing-prompt
   yas/x-prompt
   yas/no-prompt))

(provide 'tdc-snippets)
