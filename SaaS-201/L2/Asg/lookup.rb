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
  dns_raw.each { |record|
    record = record.strip
    if not(record == "" or record[0] == "#")
      type, src, des = record.split(",")
      dns_records[src.strip] = [des.strip, type.strip]
    end
  }

  return dns_records
end

def resolve(dns_records, lookup_chain, domain)
  if dns_records[domain] == nil
    return ["Error: record not found for #{domain}"]
  else
    des, type = dns_records[domain]
    lookup_chain.push(des)
    if type == "A"
      return lookup_chain
    else
      resolve(dns_records, lookup_chain, des)
    end
  end
end

# To complete the assignment, implement `parse_dns` and `resolve`.
# Remember to implement them above this line since in Ruby
# you can invoke a function only after it is defined.
dns_records = parse_dns(dns_raw)
lookup_chain = [domain]
lookup_chain = resolve(dns_records, lookup_chain, domain)
puts lookup_chain.join(" => ")
