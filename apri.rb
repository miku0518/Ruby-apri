require "csv" 

def janken
  puts "じゃんけん..."
  puts "0(グー)1(チョキ)2(パー)3(戦わない)"

  input = gets.chomp
    unless input.match?(/\A[0-3]\z/)
    puts "0〜3の数字を入力してください"
    return true
  end

  player_hand = input.to_i

  if player_hand == 3
    puts "戦わない為、終了します"
    exit
  end

  program_hand = rand(3) #ランダムで値をだす

  jankens=["グー","チョキ","パー"]
  puts "ホイ！"
  puts "あなた:#{jankens[player_hand]}"
  puts "相手の手:#{jankens[program_hand]}"
  puts "---------------"

  if player_hand == program_hand
    puts "あいこで..."
    return true
  elsif (player_hand == 0 && program_hand == 1 ) || (player_hand == 1 && program_hand == 2) || (player_hand == 2 && program_hand == 0)
    puts "あなたの勝ちです！"
    return "player"
  else
    puts "あなたの負けです！"
    return "program"
  end
end

def acchimuite_hoi(winner)
  directions = ["上", "下", "左", "右"]
  puts "あっち向いて～"
  puts  "0(上) 1(下) 2(左) 3(右)"

  player_direction = nil

  loop do
    input = gets.chomp
    if input.match?(/\A[0-3]\z/)
      player_direction = input.to_i
      break                           #0～3が入力されたらこの処理を抜ける
    else
      puts "0〜3の数字を入力してください"
    end
  end

  program_direction = rand(4)
  
  puts "ホイ！"
  puts "あなた: #{directions[player_direction]}"
  puts "相手: #{directions[program_direction]}"
  puts "---------------"

  if player_direction == program_direction
    if winner == "player"
      puts "あなたの勝ち！(ゲーム終了)"
    else
      puts "あなたの負け！(ゲーム終了)"
    end
    return false
  else
    return true
  end
end

next_game = true

while next_game  
  result =  janken  #じゃんけんの結果を受けとる "player" or "program"
  if result == true  #あいこの時
    next
  end
  next_game = acchimuite_hoi(result)  #じゃんけんの結果を受け取ってwinnerに渡す  
end