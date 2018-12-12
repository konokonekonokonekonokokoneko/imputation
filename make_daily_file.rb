# coding: utf-8
require 'optparse' #久しぶりにオプションを受け付けるですよ

# 定義ね
IN_DIR = Dir.pwd
OUT_DIR = "#{Dir.pwd}/date"

# まあ受け取るのはファイル名なんだが
params = ARGV.getopts('f:')

# track_A.csv こんな名前
file_base_name = params["f"].split(".")[0] # splitで分けちゃお。まあいいでしょ

# ファイルは全部開けないから一回開いたら変わったところで閉じよう
def get_file_pointer(file_name)
  # ファイルポインタを返します
  return File.open("#{OUT_DIR}/#{file_name}", 'w')
end

# いるか？
def close_file_pointer(fp)
  fp.close
end

# 始めます
# 2017-04-01,10000,-1.16,-0.23,1.2,1.2,0.83,3.89,84.0 こんな感じのデータを読みます
open("#{IN_DIR}/#{params["f"]}") do |fp|
  # 問答無用で一行読み飛ばします。ヘッダw
  fp.gets
  # 初期値はちゃんと設定しますか
  current_pointer = "2017-04-01"
  wp = get_file_pointer("#{file_base_name}_2017-04-01.csv")
  while line = fp.gets
    # 日付を取得します
    date = line.split(",")[0]
    # 日付が変わっていたら新しいファイルじゃ
    if date != current_pointer
      # 古いのは閉じる
      close_file_pointer(wp)
      p "古いのは閉じました"
      p "新しいファイルになりました。#{file_base_name}_#{date}.csv"
      wp = get_file_pointer("#{file_base_name}_#{date}.csv")
      current_pointer = date # 良くない
    end
    # そのまま書いちゃうかw
    wp.write line
  end
  # 最後も閉じます
  close_file_pointer(wp)
end

