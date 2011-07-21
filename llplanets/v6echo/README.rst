===================================
v6echo
===================================

内容
----------

IPv6の接続先サーバアドレスから文字列を構成します

OK or NG
----

=============== ========
User Agent      IPv6 Ready
=============== ========
Opera           NG
Chrome dev      NG
Chrome canary   NG
Firefox 5.0.1   OK!
=============== ========
wget            NG
w3m             NG
Lynx            OK!
=============== ========

::

  lynx  -dump 'http://[fe80::1%en0]:7890/'

TODO
----

NOTE
----
::

  takano32% w3m -debug -6 -dump 'http://[fe80::1%en0]:7890/'
  w3m: Can't load http://[fe80::1%en0]:7890/.

::

  takano32% wget -O - 'http://[fe80::1%en0]:7890/'
  http://[fe80::1%en0]:7890/: IPv6 アドレスが不正です.

* ループバックアドレストリビア
* アドレスが不正 2.0 @ Opera
* Sinatra => base.rb が '0.0.0.0' でバインド

