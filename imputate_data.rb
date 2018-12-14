require 'parallel'
require 'open3'
# 何ならRのスクリプトを叩くだけのスクリプトです
# 定義ね
FILE_DIR = "#{File.expand_path("../")}/date"
# まず処理するファイルのリストを取得します
files = Dir.glob("#{FILE_DIR}/*.csv") # フルパスで入ってきます
# 始めますよ
#files.each do |file|
Parallel.each(files, in_processes: 3) do |file| 
    # パスを除いたファイル名とアウトプット名を決めます
    file_name = file.split("/")[-1] # Fileオブジェクトなら簡単なんだけどね
    p file_name
    out_file = file_name # とりまおんなじ名前で作ってみましょう
    # Rを実行します
    p "#{file_name} 開始しました"
    Open3.capture3("Rscript imputate_mice_daily.R #{file_name} #{file_name}")
end




