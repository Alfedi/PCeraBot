defmodule PceraBot do
  use Application

  import Supervisor.Spec

  require Logger

  def start(_, _) do
    token = ExGram.Config.get(:pcera_bot, :token)

    children = [
      supervisor(ExGram, []),
      supervisor(PCeraBot.Bot, [:polling, token])
    ]

    opts = [strategy: :one_for_one, name: PCeraBot]

    case Supervisor.start_link(children, opts) do
      {:ok, _} = ok ->
        Logger.info("Starting Bot")
        ok

      error ->
        Logger.error("There was a problem")
        error
    end
  end
end
