#!/bin/env ruby
# encoding: utf-8

require 'pry'
require 'wikidata/fetcher'

names = EveryPolitician::Wikidata.morph_wikinames(source: 'tmtmtmtm/turkey-tbmm-wikipedia', column: 'wikipedia__tk')
names.each_slice(1000) do |sliced|
  EveryPolitician::Wikidata.scrape_wikidata(names: { tr: sliced })
end
warn EveryPolitician::Wikidata.notify_rebuilder

