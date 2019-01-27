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
      download(url)
      answer(context,"DONE")
    else
      answer(context, "Por favor usa una URL de youtube válida")
    end
  end

  def handle({:command, "ip", msg}, context) do
    usuario = ExGram.Config.get(:pcera_bot, :user)
    if msg.from.id == elem(Integer.parse(usuario), 0)  do
      ip = System.cmd("curl", ["https://ipinfo.io/ip"])
      answer(context, "La dirección ip actual es: " <> elem(ip, 0))
    else
      answer(context, "Buen intento compañero")
    end
  end

  def download(url) do
    System.cmd("youtube-dl",  ["--extract-audio", "--audio-format", "mp3", "--audio-quality", "0", "--embed-thumbnail", url], cd: ExGram.Config.get(:pcera_bot, :carpeta))
  end
end
