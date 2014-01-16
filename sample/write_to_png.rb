#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require "tanka_renderer"

painter = TankaRenderer::Renderer.new
painter.font = "KouzanBrushFontOTF"
painter.write_to_png(<<-END_OF_TEXT, "sample.png")
初夢や
     金も拾はず
           死にもせず
END_OF_TEXT
