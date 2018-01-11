gen_a = 516
gen_b = 190
counter = 0
start = Time.now

40000000.times do
  gen_a = gen_a*16807%2147483647
  gen_b = gen_b*48271%2147483647
  gen_a_bin = "%032d" % gen_a.to_s(2)
  gen_b_bin = "%032d" % gen_b.to_s(2)
  counter += 1 if gen_a_bin[16,31] == gen_b_bin[16,31]
end

finish = Time.now
diff = finish - start
p diff
p counter