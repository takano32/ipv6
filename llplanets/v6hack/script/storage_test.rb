require 'net/http'

file_name = 'dummy.jpg'

boundary = "XnJLe9ZIbbGUYtzPQJ16u1"
header = {"Content-Type" => "multipart/form-data; boundary=#{boundary}"}

body = ""
body.concat("--#{boundary}\r\n")
mimetype = 'images/jpg'
body.concat("Content-Type: #{mimetype}\r\n")
body.concat("Content-Disposition: form-data; name=\"file\"; filename=\"#{file_name}\"\r\n")
body.concat("\r\n")
File::open( File.dirname(__FILE__) + "/#{file_name}"){|f| body.concat(f.read + "\r\n") }
body.concat("--#{boundary}--\r\n")

Net::HTTP.start('fe80::10%wlan0', 3000) do |http|
  request = Net::HTTP::Post.new('/storage')
  request.set_content_type("multipart/form-data; boundary=#{boundary}")
  request.body = body
  http.request(request)
end
