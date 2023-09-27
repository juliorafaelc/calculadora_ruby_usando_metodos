require 'pry'
require_relative '../../calculadora.rb'
require 'stringio'
=begin
Testar todos os metodos da calculadora e todas suas funcionabilidades
=end

RSpec.describe "Testes de todos os metodos da calculadora" do
  context "quando a calculadora está somando ou subtraindo" do
    it "deve somar dois números corretamente" do
      expect(soma(1, 1)).to eql(2) 
    end

    it "deve testar se a funcao valida caracteres esta funcionando" do
      output = StringIO.new
      $stdout = output
      valida_caracteres('abcABC')
      $stdout = STDOUT
      expect(output.string).to eql("o valor (abcABC) não pode conter letras ou caracteres especiais\n")
    end

    it "deve testar o erro de tamanho da conta dentro do metodo valida_conta" do
      output = StringIO.new
      $stdout = output
      valida_conta('10+10')
      $stdout = STDOUT
      expect(output.string).to eql("formatação (10+10) invalida, separe os valores por espaço\n")
    end

    it "deve testar o metodo Calculadora usando o argumento rspec" do
      expect(calculadora(["10", "+", "10"], true)).to eql(20.0)
    end

    it "deve testar o erro de operador dentro do metodo valida_conta" do
      output = StringIO.new
      $stdout = output
      valida_conta(["10", "m", "10"])
      $stdout = STDOUT
      expect(output.string).to eql("operador (m), não é valido, ultilize +,-,*,/,%\n")
    end

    it "deve subtrair dois números corretamente" do
      expect(subtracao(2, 1)).to eql(1)      
    end
  end

  context "quando a calculadora está multiplicando ou dividindo ou em %" do
    it "deve multiplicar dois números corretamente" do
      expect(multiplicacao(2, 2)).to eql(4)
    end

    it "deve dividir dois números corretamente" do
      expect(divisao(2, 2)).to eql(1)
      expect(divisao(2, 0)).to eql(0)
    end

    it "deve me mostrar a porcentagem do valor2 usando valor1 como referencial" do
      expect(porcentagem(10, 100)).to eql(10.0)
    end
    
    it "deve testar a função de erro ao dividir um numero por zero" do
      output = StringIO.new
      $stdout = output
      divisao(2, 0)
      $stdout = STDOUT
      expect(output.string).to eql("Não é possivel divisão por 0\n")
    end
  end
end