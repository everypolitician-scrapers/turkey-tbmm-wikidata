#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

names = EveryPolitician::Wikidata.morph_wikinames(source: 'tmtmtmtm/turkey-tbmm-wikipedia', column: 'wikipedia__tk')
names.shuffle.each_slice(100) do |sliced|
  EveryPolitician::Wikidata.scrape_wikidata(names: { tr: sliced })
end

