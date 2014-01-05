#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require "tanka"

painter = Tanka::Painter.new
painter.font = "KouzanBrushFontOTF"
painter.write_to_png("初夢や金も拾はず死にもせず", "sample.png")
