defmodule Cheque do
  @dict %{
    1 => "um",
    2 => "dois",
    3 => "tres",
    4 => "quatro",
    5 => "cinco",
    6 => "seis",
    7 => "sete",
    8 => "oito",
    9 => "nove",
    10 => "dez",
    11 => "onze",
    12 => "doze",
    13 => "treze",
    14 => "quatorze",
    15 => "quinze",
    16 => "dezesseis",
    17 => "dezessete",
    18 => "dezoito",
    19 => "dezenove",
    20 => "vinte",
    30 => "trinta",
    40 => "quarenta",
    50 => "cinquenta",
    60 => "sessenta",
    70 => "setenta",
    80 => "oitenta",
    90 => "noventa",
    200 => "duzentos",
    300 => "trezentos",
    400 => "quatrocentos",
    500 => "quinhentos",
    600 => "seiscentos",
    700 => "setecentos",
    800 => "oitocentos",
    900 => "novecentos",
    1000 => "mil",
    2000 => "dois mil",
    3000 => "tres mil",
    4000 => "quatro mil",
    5000 => "cinco mil",
    6000 => "seis mil",
    7000 => "sete mil",
    8000 => "oito mil",
    9000 => "nove mil",
    10000 => "dez mil",
    11000 => "onze mil",
    12000 => "doze mil",
    13000 => "treze mil",
    14000 => "quatorze mil",
    15000 => "quinze mil",
    16000 => "dezesseis mil",
    17000 => "dezessete mil",
    18000 => "dezoito mil",
    19000 => "dezenove mil",
    20000 => "vinte mil",
  }

  def humanize(amount) do
    "#{Enum.join(List.flatten(do_humanize(amount)), " ")} #{currency(amount)}"
  end

  def do_humanize(amount) when amount < 20 do
    [@dict[amount]]
  end

  def do_humanize(amount) when amount < 100 do
    humanize_with_rem(amount, 10, "e")
  end

  def do_humanize(amount) when amount < 200 do
    rest = rem(amount, 100)
    if rest == 0 do
      ["cem"]
    else
      ["cento" | ["e", do_humanize(rest)]]
    end
  end

  def do_humanize(amount) when amount < 1000 do
    humanize_with_rem(amount, 100, "e")
  end

  def do_humanize(amount) when amount < 20000 do
    humanize_with_rem(amount, 1000)
  end

  def do_humanize(amount), do: raise(ArgumentError, "Unsupported value")

  defp humanize_with_rem(amount, factor) do
    rest = rem(amount, factor)
    if rest == 0 do
      [@dict[amount]]
    else
      [@dict[amount - rest] |  do_humanize(rest)]
    end
  end

  defp humanize_with_rem(amount, factor, sep) do
    rest = rem(amount, factor)
    if rest == 0 do
      [@dict[amount]]
    else
      [@dict[amount - rest] |  [sep, do_humanize(rest)]]
    end
  end

  defp currency(amount) when amount > 1, do: "reais"
  defp currency(_), do: "real"
end
