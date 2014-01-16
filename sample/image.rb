#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require "tanka_renderer"

renderer = TankaRenderer::Renderer::Image.new
renderer.font = "KouzanBrushFontGyousyoOTF"
renderer.render(<<-END_OF_TEXT, "sample.png")
春はあけぼの やう／＼しろく成り行く
山ぎは すこしあかりて むらさきだちたる
雲のほそくたなびきたる

夏はよる 月の比はさら也 やみも猶
ほたるの多く飛びちがひたる
又 ただ一つ二つなどほのかに
うちひかりて行くもをかし

                           「枕草子」より
END_OF_TEXT
