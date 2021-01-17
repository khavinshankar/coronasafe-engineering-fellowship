def get_command_line_argument
  # ARGV is an array that Ruby defines for us,
  # which contains all the arguments we passed to it
  # when invoking the script from the command line.
  # https://docs.ruby-lang.org/en/2.4.0/ARGF.html
  if ARGV.empty?
    puts "Usage: ruby lookup.rb <domain>"
    exit
  end
  ARGV.first
end

# `domain` contains the domain name we have to look up.
domain = get_command_line_argument

# File.readlines reads a file and returns an
# array of string, where each element is a line
# https://www.rubydoc.info/stdlib/core/IO:readlines
dns_raw = File.readlines("zone")

def parse_dns(dns_raw)
  dns_records = {}
  dns_raw
    .map { |line| line.strip }
    .reject { |line| line.empty? || line[0] == "#" }
    .map { |line| line.split(", ") }
    .reject { |record| record.length != 3 }
    .each { |record| dns_records[record[1]] = { :type => record[0], :destination => record[2] } }

  return dns_records
end

def resolve(dns_records, lookup_chain, domain)
  record = dns_records[domain]
  if !record
    lookup_chain.push("Error: record not found for #{domain}")
  elsif record[:type] == "A"
    lookup_chain.push(record[:destination])
  elsif record[:type] == "CNAME"
    lookup_chain.push(record[:destination])
    resolve(dns_records, lookup_chain, record[:destination])
  else
    lookup_chain.push("Invalid record type for #{domain}")
  end

  return lookup_chain
end

# To complete the assignment, implement `parse_dns` and `resolve`.
# Remember to implement them above this line since in Ruby
# you can invoke a function only after it is defined.
dns_records = parse_dns(dns_raw)
lookup_chain = [domain]
lookup_chain = resolve(dns_records, lookup_chain, domain)
puts lookup_chain.join(" => ")
