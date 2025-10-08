require "csv" 

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"


memo_type = gets.to_i    #キーボードから入力された値を数字にして変数に入れる

if memo_type == 1
  puts "拡張子を除いたファイルを入力してください"
  name = gets.chomp   #一行でいいから

  puts "メモしたい内容を記入してください （Ctrl+Dで終了）"
  content = readlines.map(&:chomp)  #内容は複数ある為
  
  CSV.open("#{name}.csv","w") do |csv|
    content.each do |memo|  #一個ずつ内容を取り出して
      csv << [memo]  #csvの中にいれる
    end
  end

elsif memo_type == 2
  puts "編集したいファイルの拡張子を除いて入力してください"
  name = gets.chomp

  file_name = "#{name}.csv"

  if !File.exist?(file_name)  #もしファイルがなければ..
    puts "ファイルが存在しません。正しいファイル名を入力してください。"
    exit
  end

  puts "メモしたい内容をおしえてください （Ctrl+Dで終了） "
  content = readlines.map(&:chomp)
  
  CSV.open("#{name}.csv","a") do |csv|
    content.each do |memo|
      csv << [memo]
    end
  end

else
  puts "1か2を入力してください"
end