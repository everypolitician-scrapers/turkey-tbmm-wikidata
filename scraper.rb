#!/bin/env ruby
# encoding: utf-8

require 'everypolitician'
require 'wikidata/fetcher'

existing = EveryPolitician::Index.new.country("Turkey").legislature('Assembly').popolo.persons.map(&:wikidata).compact
scraper_ids = EveryPolitician::Wikidata.morph_wikinames(source: 'tmtmtmtm/turkey-tbmm-wikipedia', column: 'wikidata')

# This _should_ be unnecessary, but we can remove it once we've switched to all IDs
scraper_names = EveryPolitician::Wikidata.morph_wikinames(source: 'tmtmtmtm/turkey-tbmm-wikipedia', column: 'wikipedia__tr')

EveryPolitician::Wikidata.scrape_wikidata(ids: existing | scraper_ids, names: { tr: scraper_names })
