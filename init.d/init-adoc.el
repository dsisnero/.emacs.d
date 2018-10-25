(require 'req-package)

(req-package adoc-mode
  :ensure t
  :hook turn-on-autofill
  :mode "\\.adoc\\'")
