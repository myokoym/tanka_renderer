#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require "tanka_renderer"

renderer = TankaRenderer::Renderer::PDF.new
renderer.font = "KouzanBrushFontOTF"
renderer.vertical = true
renderer.render(<<-END_OF_TEXT, "sample.pdf")
秋来ぬと目にはさやかに見えねども

　　　　　風の音にぞおどろかれぬる


　　　　　　　　　　　　　　藤原敏行
END_OF_TEXT
