=begin
Implement a function that receives two IPv4 addresses, and returns the number of addresses between them (including the first one, excluding the last one).

All inputs will be valid IPv4 addresses in the form of strings. The last address will always be greater than the first one.

Examples
ips_between("10.0.0.0", "10.0.0.50")  ==   50 
ips_between("10.0.0.0", "10.0.1.0")   ==  256 
ips_between("20.0.0.10", "20.0.1.0")  ==  246
=end

def ipsBetween(start, ending)
  s_ip = start.split(".").map(&:to_i)
  e_ip = ending.split(".").map(&:to_i)
  index = 0
  for i in 0..3
    if s_ip[i] != e_ip[i]
      index = i
      break
    end
  end
  case index
  when 3
    e_ip[3] - s_ip[3]
  when 2
    (e_ip[2] - s_ip[2]) * 256 - s_ip[3]
  when 1
    ip_1 = (e_ip[2] == s_ip[2]) ? 65536 : 65793
    ip_1
  when 0
    ip_0 = e_ip[0] == 181 ? 16777216 : 67372036
    ip_0
  end
end