#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require "tanka_renderer"

painter = TankaRenderer::Renderer::PDF.new
painter.guess_font("KouzanBrushFont")
painter.vertical = false
painter.render(<<-END_OF_TEXT, "sample.pdf")
初夢や
     金も拾はず
           死にもせず
END_OF_TEXT
