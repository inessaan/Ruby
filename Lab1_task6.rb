# задание 6

str = "овалу 010 февраля 2012 13 марта 2013ап гкец ыдуы 18 сентября 20932"
puts str.scan(/([0-2][0-9]|3[0-1]).(0[1-9]|1[0-2]|января|февраля|марта|апреля|мая|июня|июля|августа|сентября|октября|ноября|декабря).([0-9]{4})/).map{|e| e.join(' ')}.join(" ")
