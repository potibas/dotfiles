; extends

(ERROR) @gitcommit_error

; First line of commit message not to exceeed 50 characters
; see: https://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html

((subject) @gitcommit_error
  (#vim-match? @gitcommit_error ".\{50,}")
  (#offset! @gitcommit_error 0 50 0 0))

((message_line) @gitcommit_error
  (#vim-match? @gitcommit_error ".\{72,}")
  (#offset! @gitcommit_error 0 72 0 0))
