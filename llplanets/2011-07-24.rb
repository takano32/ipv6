#! /usr/bin/env ruby1.9
# vim: set noet ts=4 sts=4 sw=4:
# author: takano32 <tak at no32.tk>
#

require 'webrick'
require 'webrick/httpproxy'

analog = DATA.readlines.map do |line|
	line.chomp
end.join

handler = -> request, response do
	p request.addr.first
	# AF_INET or AF_INET6
	return unless response.content_type =~ %r!text/html!
	return unless response.status == 200

	response.body.gsub!(%r!(<body[^>]*>)!) do
		src = "data:image/png;base64,#{analog}"
		$1 + %Q!<img class="analog" src="#{src}"></span>!
	end

	response.body.gsub!(%r!(<head[^>]*>)!) do
		$1 + <<-CSS

  <style type="text/css">
    <!--
    .analog {
      display: block;
      position: absolute;
      top: 10px;
      right: 30px;
    }
    -->
  </style>
		CSS
	end
end

param = {
	:BindAddress => nil,
	# bind '127.0.0.1' and '::1'
	:Port => 8080,
	:ProxyContentHandler => handler,
}
s = WEBrick::HTTPProxyServer.new(param)

Signal.trap(:INT) do
	s.shutdown
end

s.start

__END__
R0lGODlhlgA8AJEAAGbMAGb/AP///wAAACH5BAAAAAAALAAAAACWADwAAAL/jI+py+0Po5y0
2ouz3rz7D4biSJbmiaaqJLTuC8fyTNf2jef6/jr8DwwKh0Qf8YhMKnPGpfMJDTaj1KrVNb1q
t8gs9wvWecPkMmxsTofR6raW7Y5H4fK6km7PD/H6Po/vF3gDKFgoQ2iY2IKoaMjYKPgICQPg
UllZJmmGKcR5aaaJBDBKWspJOWNaiioXWnX6AmspA6sq++UadWq72nK7G3PLlauEKeybShsb
nEac9Fkj/DvLDNoQd7ysXJ3cfO2WTc2t3W3NAI5zPF1uvtAWLh7My96ukDaak70eC7/lbIWP
SMA4/ya1KWjQ27mEDBd9a5gQIUQwEicOe2ixUcWMOFc2cqzi8eMcjCIjkSzpJyTKJSpXJmnp
8gjMmHtO0mxl86abFTx7+vwJNKjQoUSLGj2KNKnSBwUAADs=

