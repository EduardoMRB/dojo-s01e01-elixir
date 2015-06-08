defmodule ChequeTest do
  use ExUnit.Case

  def humanize(n) do
    Cheque.humanize(n)
  end

  test "um real" do
    assert humanize(1) == "um real"
  end

  test "dois reais" do
    assert humanize(2) == "dois reais"
  end

  test "tres reais" do
    assert humanize(3) == "tres reais"
  end

  test "cinco reais" do
    assert humanize(5) == "cinco reais"
  end

  test "nove reais" do
    assert humanize(9) == "nove reais"
  end

  test "dez reais" do
    assert humanize(10) == "dez reais"
  end

  test "dezesseis reais" do
    assert humanize(16) == "dezesseis reais"
  end

  test "dezenove reais" do
    assert humanize(19) == "dezenove reais"
  end

  test "vinte reais" do
    assert humanize(20) == "vinte reais"
  end

  test "vinte e um reais" do
    assert humanize(21) == "vinte e um reais"
  end

  test "trinta e cinco reais" do
    assert humanize(35) == "trinta e cinco reais"
  end

  test "noventa e nove reais" do
    assert humanize(99) == "noventa e nove reais"
  end

  test "cem reais" do
    assert humanize(100) == "cem reais"
  end

  test "cento e dez reais" do
    assert humanize(110) == "cento e dez reais"
  end

  test "cento e noventa e nove reais" do
    assert humanize(199) == "cento e noventa e nove reais"
  end

  test "duzentos reais" do
    assert humanize(200) == "duzentos reais"
  end

  test "quinhentos e noventa e cinco reais" do
    assert humanize(595) == "quinhentos e noventa e cinco reais"
  end

  test "novecentos e noventa e nove reais" do
    assert humanize(999) == "novecentos e noventa e nove reais"
  end

  test "mil reais" do
    assert humanize(1000) == "mil reais"
  end

  test "nove mil novecentos e noventa e nove reais" do
    assert humanize(9999) == "nove mil novecentos e noventa e nove reais"
  end

  test "dez mil" do
    assert humanize(10000) == "dez mil reais"
  end

  test "quinze mil oitocentos e noventa e cinco reais" do
    assert humanize(15895) == "quinze mil oitocentos e noventa e cinco reais"
  end

  test "numbers greater than 20000 must raise error" do
    assert_raise(ArgumentError, "Unsupported value", fn ->
      humanize(200000)
    end)
  end
end
