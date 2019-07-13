# coding: utf-8
require 'csv'
require 'pp'

pp CSV
  .read("c01.csv", encoding: 'sjis:UTF-8', headers:true)
  .map{|d| d.to_hash}
  .select{|row| row["都道府県コード"].to_i > 0}
  .select{|row| row["西暦（年）"].to_i == 2000}
  .map{|row| row["人口（総数）"].to_i}
  .inject(:+)


