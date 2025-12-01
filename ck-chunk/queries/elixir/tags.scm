; Elixir chunk definitions
; In Elixir's tree-sitter grammar, definitions like defmodule, def, defp
; are represented as function calls with specific target identifiers

; Module definition - defmodule ModuleName do ... end
(call
  target: (identifier) @_target
  (arguments
    (alias) @name)
  (#eq? @_target "defmodule")) @module

; Public function - def function_name(...) do ... end
(call
  target: (identifier) @_target
  (#eq? @_target "def")) @definition.function

; Private function - defp function_name(...) do ... end
(call
  target: (identifier) @_target
  (#eq? @_target "defp")) @definition.function

; Public macro - defmacro macro_name(...) do ... end
(call
  target: (identifier) @_target
  (#eq? @_target "defmacro")) @definition.function

; Private macro - defmacrop macro_name(...) do ... end
(call
  target: (identifier) @_target
  (#eq? @_target "defmacrop")) @definition.function

; Protocol definition - defprotocol ProtocolName do ... end
(call
  target: (identifier) @_target
  (#eq? @_target "defprotocol")) @module

; Protocol implementation - defimpl Protocol, for: Type do ... end
(call
  target: (identifier) @_target
  (#eq? @_target "defimpl")) @module

; Struct definition - defstruct [...] (inside a module)
(call
  target: (identifier) @_target
  (#eq? @_target "defstruct")) @definition.struct

; Exception definition - defexception [...] (inside a module)
(call
  target: (identifier) @_target
  (#eq? @_target "defexception")) @definition.struct

; Guard definitions
(call
  target: (identifier) @_target
  (#eq? @_target "defguard")) @definition.function

(call
  target: (identifier) @_target
  (#eq? @_target "defguardp")) @definition.function

; Delegate function - defdelegate function_name(args), to: Module
(call
  target: (identifier) @_target
  (#eq? @_target "defdelegate")) @definition.function

; Override callback - defoverridable [...]
(call
  target: (identifier) @_target
  (#eq? @_target "defoverridable")) @definition.text
