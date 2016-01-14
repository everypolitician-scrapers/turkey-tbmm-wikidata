#!/bin/env ruby
# encoding: utf-8

require 'pry'
require 'wikidata/fetcher'

names = EveryPolitician::Wikidata.morph_wikinames(source: 'tmtmtmtm/turkey-tbmm-wikipedia', column: 'wikipedia__tk')
EveryPolitician::Wikidata.scrape_wikidata(names: { tr: names })
warn EveryPolitician::Wikidata.notify_rebuilder

