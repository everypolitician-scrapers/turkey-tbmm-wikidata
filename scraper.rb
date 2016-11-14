#!/bin/env ruby
# encoding: utf-8

require 'everypolitician'
require 'wikidata/fetcher'

existing = EveryPolitician::Index.new.country("Turkey").legislature('Assembly').popolo.persons.map(&:wikidata).compact
names = EveryPolitician::Wikidata.morph_wikinames(source: 'tmtmtmtm/turkey-tbmm-wikipedia', column: 'wikipedia__tk')

EveryPolitician::Wikidata.scrape_wikidata(ids: existing, names: { tr: names })
