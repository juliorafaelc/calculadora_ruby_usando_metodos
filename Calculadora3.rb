require 'pry'
=begin 
eu, como PO desejo uma calculadora que receba 'valor1 operador valor2' e obtenha um resultado
tambem desejo um menu interativo onde posso sair do programa, armazenar meu resultado, e limpar o resultado
    missão - Adicionar % e arrumar bugs, como divisão por 0 e uso de caracteres invalidos
=end

def soma(valor1, valor2)
  valor1 + valor2
end

def subtracao(valor1, valor2)
  valor1 - valor2
end

def multiplicacao(valor1, valor2)
  valor1 * valor2
end

def divisao(valor1, valor2)
  if valor2 == 0
    puts "Não é possivel divisão por 0"
    return 0
  else
    valor1 / valor2
  end
end

def porcentagem(valor1, valor2)
  (valor1 / 100.to_f) * valor2
end

def boas_vindas
  puts "\n Calculadora"
  puts "Insira o Valor1 Operador Valor2 para ultilização da calculadora"
  print "Operação: "
  conta = gets.chomp.split(' ')
  valida_conta(conta)
end

def valida_conta(conta)
  unless conta.length.eql?(3)
    puts "formatação (#{conta}) invalida, separe os valores por espaço"
    return
  end

  valida_caracteres(conta[0])
  valida_caracteres(conta[2])

  operadores = ["+", "-", "*", "/", "%"]
  unless operadores.include?(conta[1])
    puts "operador (#{conta[1]}), não é valido, ultilize +,-,*,/,%"
  end

  calculadora(conta)
end

def valida_caracteres(valor)
  if valor.match?(/^[a-zA-Z]+$/)
    puts "o valor (#{valor}) não pode conter letras ou caracteres especiais"
  end
end

def continuacao(resultado)
  loop do
    puts "Resultado: #{resultado}"
    puts "Digite x para sair do programa"
    puts "Digite limpar para limpar o resultado"
    puts "digite 'operador valor1' para continuar a operação"
    print "calculo: "

    proximo_calc = gets.chomp.split(' ')
    
    if proximo_calc == ['x']
      break
    end

    if proximo_calc == ['limpar']
      resultado = 0
      next
    end

    unless proximo_calc.length.eql?(2)
      puts "#{proximo_calc} esta na formatação incorreta, separe o operador do valor com espaço"
      next
    end

    valor1 = resultado.to_s
    operador = proximo_calc[0]
    valor2 = proximo_calc[1]
    conta = [valor1, operador, valor2]

    valida_conta(conta)
  end
end

def calculadora(conta)
  valor1 = conta[0].to_f
  operador = conta[1]
  valor2 = conta[2].to_f

  resultado = case operador
                when '+'
                  soma(valor1, valor2)
                when '-'
                  subtracao(valor1, valor2)
                when '*'
                  multiplicacao(valor1, valor2)
                when '/'
                  divisao(valor1, valor2)
                when '%'
                  porcentagem(valor1, valor2)
                end

  continuacao(resultado)
end

boas_vindas
