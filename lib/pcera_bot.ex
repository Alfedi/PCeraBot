defmodule PceraBot do
  use Application

  import Supervisor.Spec

  require Logger

  def start(_type, _args) do
    token = ExGram.Config.get(:ex_gram, :token)

    children = [
      supervisor(ExGram, []),
      supervisor(PceraBot.Bot, [:polling, token])
    ]

    opts = [strategy: :one_for_one, name: PceraBot]

    case Supervisor.start_link(children, opts) do
      {:ok, _} = ok ->
        Logger.info("Starting Pcerabot")
        ok

      error ->
        Logger.error("Error starting PceraBot")
        error
    end
  end
end
