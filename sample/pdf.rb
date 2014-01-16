#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require "tanka_renderer"

painter = TankaRenderer::Renderer::PDF.new
painter.font = "KouzanBrushFontOTF"
painter.vertical = true
painter.render(<<-END_OF_TEXT, "sample.pdf")
秋来ぬと目にはさやかに見えねども

　　　　　風の音にぞおどろかれぬる


　　　　　　　　　　　　　　藤原敏行
END_OF_TEXT
