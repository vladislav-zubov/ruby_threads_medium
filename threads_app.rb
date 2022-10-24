require 'net/http'

def call_http_server
  http = Net::HTTP.new('127.0.0.1', 4567)
  http.read_timeout = 1000

  http.get('/')
end

def call_sleep
  sleep(0.1)
end

puts "Process pid is #{Process.pid}"

gets # stop point to capture process id information

t = Thread.new do
  call_http_server
  50.times { call_sleep }
end

t2 = Thread.new do
  150.times { call_sleep }
end

puts `sleep 1 && ps axH -o pid,pgid,tid,comm,args -q #{$$}`

t.join
t2.join