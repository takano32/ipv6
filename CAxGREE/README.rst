===================================
5分でわかるIPv6
===================================

中央にもってくる方法がわからない

----

お前、誰よ
----------

@takano32 a.k.a. 高野光弘

- hoge

- fuga0

----

あなたの IPv6 レベル
--------------------

独断と偏見

#. "IPv6"という文字列
#. IPv4 と IPv6 の存在
#. IPv4 のIPアドレスが少ない
#. IPv4 のグローバルアドレスが枯渇した
#. IPv4 のアドレスは32ビットで IPv6 のアドレスは 128ビット
#. IPv4 と IPv6 のヘッダの違い
#. IPv6 のアドレス表記
#. AAAA レコードの存在

----


今日のアジェンダ
----------------

- ネットワーク屋の常識とソフトウェア屋の常識

  - 剥離がおそろしい

  - いまIPv4でできてることができなくなるよ

- 5分でIPv6の仔細を理解できたらすごすぎ

  - IPv6の仕様については最低限しか触れません

----

復習: 無意識の恐ろしさ
----------------------

IPv6の前にIPv4知ってて使ってますか

ex. 127.0.0.1 / ループバックアドレス

- 自身のIPアドレスである

- 実は慣習的な由来

  - ループバックさせている実現方法はさまざま

- 現在では 127.0.0.1/8 という説が有力

----

Linux 2.6.27.39 ia64 GNU/Linux
------------------------------

::

  takano32% uname -srmo
  Linux 2.6.27.39 ia64 GNU/Linux
  takano32% ping -c 3 127.16.32.64
  PING 127.16.32.64 (127.16.32.64) 56(84) bytes of data.
  64 bytes from 127.16.32.64: icmp_req=1 ttl=64 time=0.038 ms
  64 bytes from 127.16.32.64: icmp_req=2 ttl=64 time=0.009 ms
  64 bytes from 127.16.32.64: icmp_req=3 ttl=64 time=0.008 ms
  
  --- 127.16.32.64 ping statistics ---
  3 packets transmitted, 3 received, 0% packet loss, time 2013ms
  rtt min/avg/max/mdev = 0.008/0.018/0.038/0.014 ms

- 有力な説の 127.0.0.1 を採用

----

Darwin 10.8.0 x86_64 Darwin
---------------------------

::

  takano32% uname -srmo
  Darwin 10.8.0 x86_64 Darwin
  takano32% ping -c 3 127.16.32.64
  PING 127.16.32.64 (127.16.32.64): 56 data bytes
  Request timeout for icmp_seq 0
  Request timeout for icmp_seq 1
  
  --- 127.16.32.64 ping statistics ---
  3 packets transmitted, 0 packets received, 100.0% packet loss

- 100.0% packet loss...

- インターネットはカオス

  - よくわかんないのになんか動いてる部分たくさん

さらに **よくわかんないIPv6** というものがやってくる

----

実際に使ってみた
----------------

::

  lynx  -dump 'http://[fe80::1%en0]:7890/'

::

  takano32% wget -O - 'http://[fe80::1%en0]:7890/'
  http://[fe80::1%en0]:7890/: IPv6 アドレスが不正です.

RFC 4007 11.2.  The <zone_id> Part **ガン無視**

User Agentのまとめ
------------------

================ ============
User Agent       IPv6 Ready?
================ ============
Opera  11.50     NG
Chrome dev       NG
Chrome canary    NG
Firefox 5.0.1    OK!
wget             NG
w3m              NG
Lynx             OK!
================ ============


* アドレスが不正 2.0 @ Opera

----

ex. フレームワーク
------------------

Sinatra / sinatra / lib / sinatra / base.rb

  https://github.com/sinatra/sinatra/blob/master/lib/sinatra/base.rb

:: 

  takano32% LANG=C date
  Mon Jul 25 18:31:05 JST 2011

たぶん今も同じコード

.. code-block:: ruby

    set :run, false                       # start server via at-exit hook?
    set :running, false                   # is the built-in server running now?
    set :server, %w[thin mongrel webrick]
    set :bind, '0.0.0.0'
    set :port, 4567

えっ

.. code-block:: ruby

    set :bind, '0.0.0.0'

IPv6というものは **アウト・オブ・眼中** という例

----

FAQ
---

- なんでチケット切らないんですか

  - 影響プロダクトが無数

  - @takano32 はクラウドのようにスケールしない

  - できるのは啓蒙活動くらい


