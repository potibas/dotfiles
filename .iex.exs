Application.put_env(:elixir, :ansi_enabled, true)

IEx.configure(
  colors: [enabled: true],
  default_prompt: [
    "\e[G",
    :magenta,
    "%prefix",
    ">",
    :reset
  ]
  |> IO.ANSI.format()
  |> IO.chardata_to_string()
)
