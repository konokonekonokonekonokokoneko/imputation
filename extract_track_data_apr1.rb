# coding: utf-8
# 特に何のライブラリも使いません
open("#{Dir.pwd}/track_A_1_100000.csv") do |fp|
  open("#{Dir.pwd}/track_A_Apr_1.csv", 'w') do |wp|
    wp.write fp.gets # 改行つけっぱなし
    while line = fp.gets
      # 判別しましょう
      if line.split(",")[0] == "2017-04-01"
        wp.write line
      end
    end
  end
end

      
