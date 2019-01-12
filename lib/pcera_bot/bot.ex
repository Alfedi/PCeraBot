defmodule PceraBot.Bot do
  @bot :PCeraBot

  use ExGram.Bot,
    name: @bot

  def bot(), do: @bot

  def handle({:command, "start", _msg}, context) do
    answer(context, "Bienvenido al PCeraBot. Explora todo lo que puedo hacer con el comando \help. (WIP).")
  end

  def handle({:command, "download", msg}, context) do
    url = msg.text
    if url != "" do # Necesita comprobar si la url no es válida, preguntar a alguien listo.
      IO.puts("Parece que guay")
      answer(context, "Se está procesando tu petición, por favor se paciente") # Por algún motivo no manda este mensaje cuando se está descargando el archivo
      download(url, context)
    else
      answer(context, "Por favor usa una URL de youtube válida")
    end
  end

  def download(url, context) do
    :ssh.start
    {:ok, conn} = SSHEx.connect # Opciones de conexión con el servidor. [Se necesita encontrar una forma de leerlo desde un archivo]
    SSHEx.cmd! conn, "youtube-dl -x --audio-format mp3 --audio-quality 0 --embed-thumbnail --add-metadata " <> Kernel.inspect(url)
    answer(context, "Ya se ha descargado la canción.")
  end
end
