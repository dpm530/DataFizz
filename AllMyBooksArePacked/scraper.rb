require 'nokogiri'
require 'httparty'
require 'byebug'
require 'json'



answer=[]
doc = File.open("data/book1.html") {|f| Nokogiri::HTML(f)}


book_title = doc.css("div.buying h1.parseasinTitle span").text
book_author = doc.css("div.buying span a").text
book_price = doc.css("table.product b.priceLarge").text
book_weight = doc.at_css("table#productDetailsTable ul li:nth-child(7)").text
book_ISBN = doc.at_css("table#productDetailsTable ul li:nth-child(4)").text

answer.push(title: book_title, author: book_author, price: book_price, weight: book_weight, isbn: book_ISBN)

puts JSON.pretty_generate(answer)
