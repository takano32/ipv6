==============
IPv6ハッカソン
==============

==========
Rubyチーム
==========

- LL Planets

  - 2011年8月20日

  - 於 文京シビックホール

  -  IPv6ハッカソン

    - Rubyチーム

----

==========
Rubyチーム
==========

- @ukstudio

  - フリーランスRubyプログラマ

  - Asakusa.rb

- @sugamasao

  - 若手IT勉強会

  - Mitaka.rb

- @takano32

  - 日本UNIXユーザ会

  - ia64.rb

@ukstudio と @sugamasao のチームに当日 @takano32 がジョイン

----

==================
IPv6アドレスったー
==================

IPv6アドレスをキーにしたTwitterクライアント

動機
^^^^

Twitterのつぶやきには64ビットのIDが振られている情報を **PHPチームから拝借**

- IPv6なので、アドレスがたくさん使える

  - 2001:2e8:406:11::/64

  - 64ビットの **グローバルIPアドレス**

つぶやきの識別子の幅と同じ量のIPv6アドレスが使える

----

==============
つぶやきの取得
==============

http://[2001:2e8:406:11::14]:3000/v6hack

- アドレスのホスト部をつぶやきのIDとしてアクセス

  - ex. 0x14 => 20

**Creator, Co-founder and Executive Chairman of Twitter; CEO of Square.**

.. image:: jack.png
  :align: right

----

==============
つぶやきの投稿
==============

IPv6アドレスの下位1バイトをASCII文字でつぶやく

.. code-block:: ruby

  # hello.rb
  "Hello".each_char do |ch|
    puts sprintf("0x%X", ch.ord)
  end

::

  $ ruby hello.rb
  0x48
  0x65
  0x6C
  0x6C
  0x6F

http://[2001:2e8:406:11::48]:3000/v6hack/post

http://[2001:2e8:406:11::65]:3000/v6hack/post

http://[2001:2e8:406:11::6c]:3000/v6hack/post

http://[2001:2e8:406:11::6c]:3000/v6hack/post

http://[2001:2e8:406:11::6f]:3000/v6hack/post

http://twitter.com/takano32


----

=======================
アドレスをキーとするKVS
=======================

powered by @ukstudio

ひとつのIPアドレスに対してひとつのファイルを保存

時間的都合によりPOSTまでの実装

ファイルのPOST(既存のものは上書き)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

::

  POST http://[2001:2e8:406:11::48]:3000/storage
  POST http://[2001:2e8:406:11::49]:3000/storage

ファイルのGET
^^^^^^^^^^^^^

::

  GET http://[2001:2e8:406:11::48]:3000/storage
  GET http://[2001:2e8:406:11::49]:3000/storage


