regulator_social_housing = Organisation.find_by(slug: "regulator-of-social-housing")

# slugs, from zendesk ticket:
[
  # collections
  "consumer-regulation-review",
  "decision-instruments",
  "global-accounts-of-housing-providers",
  "quarterly-survey-of-private-registered-providers",
  "regulation-committee-minutes-2018",
  "regulatory-framework-requirements",
  "sector-risk-profiles",
  "statistical-data-return-statistical-releases",
  "accounting-directions-for-social-housing-in-england",
  "decision-statements",
  "regulatory-framework-requirements",
  # guidance
  "deregulatory-measures-for-social-housing-regulation-from-6-april-2017",
  "register-and-de-register-as-a-provider-of-social-housing",
  "regulator-of-social-housing-privacy-notice",
  "regulatory-judgements-and-regulatory-notices-a-to-z-list",
  "regulatory-standards",
  "standards-of-service",
  "information-required-from-registered-providers",
  "regulator-of-social-housing-privacy-notice",
  # publications
  "2012-global-accounts-of-housing-providers",
  "2013-global-accounts-of-housing-providers",
  "2014-global-accounts-of-housing-providers",
  "2015-global-accounts-of-housing-providers",
  "2016-global-accounts-of-private-registered-providers",
  "2017-global-accounts-of-private-registered-providers",
  "brief-guide-to-regulation-of-registered-providers",
  "consumer-regulation-review-2012-to-2013",
  "consumer-regulation-review-2013-to-2014",
  "consumer-regulation-review-2014-to-2015",
  "consumer-regulation-review-2015-to-2016",
  "consumer-regulation-review-2016-to-2017",
  "consumer-regulation-review-2017-to-2018",
  "decision-instrument-10-changes-to-the-accounting-direction",
  "decision-instrument-11",
  "decision-instrument-12-charging-of-fees-for-social-housing-regulation",
  "decision-instrument-13-notification-of-restructures-and-constitutional-changes",
  "decision-instrument-14-notification-of-disposals",
  "decision-instrument-15-amendment-to-the-tenant-involvement-and-empowerment-standard",
  "decision-instrument-16-revision-to-the-value-for-money-standard-and-introduction-of-an-associated-code-of-practice",
  "decision-instrument-8",
  "decision-instrument-9",
  "de-classification-of-a-dwelling-as-social-housing",
  "delivering-better-value-for-money-understanding-differences-in-unit-costs",
  "disposal-proceeds-fund",
  "fees-and-resources-advisory-panel-terms-of-reference",
  "fees-for-social-housing-regulation",
  "fees-statement-2017-to-2020",
  "governance-and-financial-viability-standard-code-of-practice",
  "guidance-on-the-regulators-approach-to-intervention-enforcement-and-use-of-powers",
  "notifications-about-disposals",
  "quarterly-survey-for-q1-april-to-june-2013-to-2014",
  "quarterly-survey-for-q1-april-to-june-2014-to-2015",
  "quarterly-survey-for-q1-april-to-june-2015-to-2016",
  "quarterly-survey-for-q1-april-to-june-2016-to-2017",
  "quarterly-survey-for-q1-april-to-june-2017-to-2018",
  "quarterly-survey-for-q1-april-to-june-2018-to-2019",
  "quarterly-survey-for-q2-july-to-september-2013-to-2014",
  "quarterly-survey-for-q2-july-to-september-2014-to-2015",
  "quarterly-survey-for-q2-july-to-september-2015-to-2016",
  "quarterly-survey-for-q2-july-to-september-2016-to-2017",
  "quarterly-survey-for-q2-july-to-september-2017-to-2018",
  "quarterly-survey-for-q3-october-to-december-2013-to-2014",
  "quarterly-survey-for-q3-october-to-december-2014-to-2015",
  "quarterly-survey-for-q3-october-to-december-2015-to-2016",
  "quarterly-survey-for-q3-october-to-december-2016-to-2017",
  "quarterly-survey-for-q3-october-to-december-2017-to-2018",
  "quarterly-survey-for-q4-january-to-march-2013-to-2014",
  "quarterly-survey-for-q4-january-to-march-2014-to-2015",
  "quarterly-survey-for-q4-january-to-march-2015-to-2016",
  "quarterly-survey-for-q4-january-to-march-2016-to-2017",
  "quarterly-survey-for-q4-january-to-march-2017-to-2018",
  "regulating-the-standards",
  "regulator-of-social-housing-business-impact-target",
  "regulatory-judgement-a2dominion-housing-group-limited",
  "regulatory-judgement-the-abbeyfield-society",
  "regulatory-judgement-accent-group-limited",
  "regulatory-judgement-accord-housing-association-limited",
  "regulatory-judgement-acis-group-limited--2",
  "regulatory-judgement-advance-housing-and-support-limited",
  "regulatory-judgement-aldwyck-housing-group-limited--3",
  "regulatory-judgement-anchor-trust",
  "regulatory-judgement-arawak-walton-housing-association-limited",
  "regulatory-judgement-arches-housing-limited",
  "regulatory-judgement-arcon-housing-association-limited",
  "regulatory-judgement-arun-district-council",
  "regulatory-judgement-aspire-group-staffordshire-limited",
  "regulatory-judgement-aster-group-limited",
  "regulatory-judgement-b3-living-limited",
  "regulatory-judgement-bernicia-group-limited",
  "regulatory-judgement-black-country-housing-group-limited",
  "regulatory-judgement-bolton-at-home-limited--3",
  "regulatory-judgement-bournemouth-churches-housing-association-limited--2",
  "regulatory-judgement-bournville-village-trust",
  "regulatory-judgement-bpha-limited--2",
  "regulatory-judgement-bracknell-forest-homes-limited",
  "regulatory-judgement-broadacres-housing-association-limited--2",
  "regulatory-judgement-broadland-housing-association-limited",
  "regulatory-judgement-bromford-housing-group-limited",
  "regulatory-judgement-bromsgrove-district-housing-trust-limited",
  "regulatory-judgement-brunelcare--2",
  "regulatory-judgement-byker-community-trust-limited",
  "regulatory-judgement-calico-homes-limited",
  "regulatory-judgement-cambridge-housing-society-limited--3",
  "regulatory-judgement-castles-coasts-housing-association",
  "regulatory-judgement-catalyst-housing-limited",
  "regulatory-judgement-central-and-cecil-housing-trust",
  "regulatory-judgement-chelmer-housing-partnership-limited",
  "regulatory-judgement-cheshire-peaks-plains-housing-trust",
  "regulatory-judgement-christian-action-enfield-housing-association-limited",
  "regulatory-judgement-city-west-housing-trust-limited",
  "regulatory-judgement-clarion-housing-group-limited",
  "regulatory-judgement-coast-country-housing-limited",
  "regulatory-judgement-coastline-housing-limited",
  "regulatory-judgement-cobalt-housing-limited",
  "regulatory-judgement-colne-housing-society-limited",
  "regulatory-judgement-community-gateway-association-limited",
  "regulatory-judgement-connect-housing-association-limited",
  "regulatory-judgement-connexus-housing-limited",
  "regulatory-judgement-cornerstone-housing-limited",
  "regulatory-judgement-cottsway-housing-association-limited--3",
  "regulatory-judgement-county-durham-housing-group-limited",
  "regulatory-judgement-cross-keys-homes-limited",
  "regulatory-judgement-croydon-churches-housing-association-limited",
  "regulatory-judgement-curo-group-albion-limited",
  "regulatory-judgement-durham-aged-mineworkers-homes-association",
  "regulatory-judgement-east-end-homes-limited--2",
  "regulatory-judgement-east-midlands-housing-group",
  "regulatory-judgement-eden-housing-association-limited",
  "regulatory-judgement-empowering-people-inspiring-communities-limited",
  "regulatory-judgement-english-rural-housing-association-limited",
  "regulatory-judgement-equity-housing-group-limited--2",
  "regulatory-judgement-estuary-housing-association-limited",
  "regulatory-judgement-first-choice-homes-oldham-limited",
  "regulatory-judgement-first-priority-housing-association",
  "regulatory-judgement-flagship-housing-group-limited--4",
  "regulatory-judgement-fortis-living",
  "regulatory-judgement-forviva-group-limited",
  "regulatory-judgement-freebridge-community-housing-limited",
  "regulatory-judgement-futures-housing-group-limited",
  "regulatory-judgement-gateway-housing-association",
  "regulatory-judgement-gentoo-group-limited--2",
  "regulatory-judgement-gloucester-city-homes-limited",
  "regulatory-judgement-golden-lane-housing-limited",
  "regulatory-judgement-golding-homes",
  "regulatory-judgement-grand-union-housing-group-limited--2",
  "regulatory-judgement-great-places-housing-group-limited",
  "regulatory-judgement-greenfields-community-housing-association",
  "regulatory-judgement-greensquare-group-limited",
  "regulatory-judgement-habinteg-housing-association-limited",
  "regulatory-judgement-halton-housing-trust-limited",
  "regulatory-judgement-hanover-housing-association",
  "regulatory-judgement-hastoe-housing-association",
  "regulatory-judgement-havebury-housing-partnership",
  "regulatory-judgement-hexagon-housing-association-limited",
  "regulatory-judgement-hightown-housing-association-limited",
  "regulatory-judgement-home-group-limited",
  "regulatory-judgement-housing-care-21",
  "regulatory-judgement-housing-plus-group-limited",
  "regulatory-judgement-housing-solutions-limited",
  "regulatory-judgement-howard-cottage-housing-association",
  "regulatory-judgement-hundred-houses-society-limited",
  "regulatory-judgement-hyde-housing-association-limited",
  "regulatory-judgement-inclusion-housing-community-interest-company",
  "regulatory-judgement-incommunities-group-limited",
  "regulatory-judgement-industrial-dwellings-society-1885-limited",
  "regulatory-judgement-inquilab-housing-association-limited--2",
  "regulatory-judgement-irwell-valley-housing-association-limited",
  "regulatory-judgement-islington-and-shoreditch-housing-association",
  "regulatory-judgement-jigsaw-homes-group-limited",
  "regulatory-judgement-johnnie-johnson-housing-trust-limited--2",
  "regulatory-judgement-joseph-rowntree-housing-trust--2",
  "regulatory-judgement-karbon-homes-limited",
  "regulatory-judgement-kinsman-housing-limited",
  "regulatory-judgement-knowsley-housing-trust",
  "regulatory-judgement-leeds-and-yorkshire-housing-association-limited",
  "regulatory-judgement-leeds-federated-housing-association-limited",
  "regulatory-judgement-lincolnshire-housing-partnership-limited",
  "regulatory-judgement-liverpool-mutual-homes-limited",
  "regulatory-judgement-liverty-limited",
  "regulatory-judgement-livin-housing-limited",
  "regulatory-judgement-local-space-limited--2",
  "regulatory-judgement-london-quadrant-housing-trust",
  "regulatory-judgement-longhurst-group-limited",
  "regulatory-judgement-look-ahead-care-and-support-limited",
  "regulatory-judgement-magna-housing-group-limited",
  "regulatory-judgement-manningham-housing-association-limited",
  "regulatory-judgement-metropolitan-housing-trust-limited--3",
  "regulatory-judgement-midland-heart-limited--6",
  "regulatory-judgement-moat-homes-limited",
  "regulatory-judgement-mosscare-st-vincents-housing-group-limited",
  "regulatory-judgement-mount-green-housing-association-limited--2",
  "regulatory-judgement-muir-group-housing-association-limited",
  "regulatory-judgement-nehemiah-united-churches-housing-association-limited",
  "regulatory-judgement-network-housing-group-limited--3",
  "regulatory-judgement-newlon-housing-trust",
  "regulatory-judgement-north-devon-homes",
  "regulatory-judgement-north-hertfordshire-homes-limited--2",
  "regulatory-judgement-north-star-housing-group-limited",
  "regulatory-judgement-notting-hill-genesis",
  "regulatory-judgement-nottingham-community-housing-association-limited",
  "regulatory-judgement-nsah-alliance-homes",
  "regulatory-judgement-ocean-housing-group-limited",
  "regulatory-judgement-octavia-housing",
  "regulatory-judgement-one-housing-group-limited--3",
  "regulatory-judgement-one-manchester-limited",
  "regulatory-judgement-one-vision-housing-limited",
  "regulatory-judgement-ongo-homes-limited",
  "regulatory-judgement-onward-homes-limited",
  "regulatory-judgement-optivo",
  "regulatory-judgement-orbit-group-limited--2",
  "regulatory-judgement-origin-housing-limited",
  "regulatory-judgement-orwell-housing-association-limited--2",
  "regulatory-judgement-paradigm-housing-group-limited",
  "regulatory-judgement-paragon-asra-housing-limited",
  "regulatory-judgement-pathfinder-housing-association-limited",
  "regulatory-judgement-peabody-trust",
  "regulatory-judgement-phoenix-community-housing-association-bellingham-and-downham-limited",
  "regulatory-judgement-pickering-and-ferens-homes",
  "regulatory-judgement-pierhead-housing-association-limited",
  "regulatory-judgement-pioneer-housing-and-community-group",
  "regulatory-judgement-places-for-people-group-limited",
  "regulatory-judgement-plus-dane-housing-limited",
  "regulatory-judgement-plymouth-community-homes",
  "regulatory-judgement-poplar-harca-limited--2",
  "regulatory-judgement-progress-housing-group-limited--2",
  "regulatory-judgement-radian-group-limited",
  "regulatory-judgement-railway-housing-association-and-benefit-fund",
  "regulatory-judgement-raven-housing-trust-limited",
  "regulatory-judgement-red-kite-community-housing-limited--2",
  "regulatory-judgement-regenda-limited",
  "regulatory-judgement-richmond-housing-partnership-limited",
  "regulatory-judgement-riverside-group-limited",
  "regulatory-judgement-rochdale-boroughwide-housing-limited",
  "regulatory-judgement-rooftop-housing-group-limited",
  "regulatory-judgement-rosebery-housing-association-limited",
  "regulatory-judgement-saffron-housing-trust-limited--2",
  "regulatory-judgement-salix-homes-limited",
  "regulatory-judgement-salvation-army-housing-association",
  "regulatory-judgement-sanctuary-housing-association",
  "regulatory-judgement-saxon-weald-homes-limited",
  "regulatory-judgement-selwood-housing-society-limited",
  "regulatory-judgement-severn-vale-housing-society-limited--3",
  "regulatory-judgement-shepherds-bush-housing-association-limited",
  "regulatory-judgement-soha-housing-limited--2",
  "regulatory-judgement-solon-south-west-housing-association-limited",
  "regulatory-judgement-south-lakes-housing",
  "regulatory-judgement-south-liverpool-homes-limited",
  "regulatory-judgement-south-yorkshire-housing-association-limited",
  "regulatory-judgement-southern-housing-group-limited",
  "regulatory-judgement-southway-housing-trust",
  "regulatory-judgement-sovereign-housing-association-limited",
  "regulatory-judgement-st-andrews-community-housing-association",
  "regulatory-judgement-st-mungo-community-housing-association--3",
  "regulatory-judgement-stafford-rural-homes-limited",
  "regulatory-judgement-staffordshire-housing-association",
  "regulatory-judgement-stonewater-limited",
  "regulatory-judgement-suffolk-housing-society-limited--2",
  "regulatory-judgement-swan-housing-association-limited--3",
  "regulatory-judgement-teign-housing",
  "regulatory-judgement-thames-valley-housing-association-limited",
  "regulatory-judgement-community-housing-group-limited-the",
  "regulatory-judgement-guinness-partnership-limited-the",
  "regulatory-judgement-thirteen-group-limited",
  "regulatory-judgement-thrive-homes-limited-96kb",
  "regulatory-judgement-together-housing-group-limited",
  "regulatory-judgement-torus62-limited",
  "regulatory-judgement-tower-hamlets-community-housing-limited--2",
  "regulatory-judgement-town-country-housing-group",
  "regulatory-judgement-trafford-housing-trust-limited",
  "regulatory-judgement-trent-dove-housing-limited",
  "regulatory-judgement-trident-housing-association-limited--2",
  "regulatory-judgement-tuntum-housing-association-limited--4",
  "regulatory-judgement-two-rivers-housing",
  "regulatory-judgement-united-housing-association-limited",
  "regulatory-judgement-unity-housing-association-limited",
  "regulatory-judgement-vale-of-aylesbury-housing-trust",
  "regulatory-judgement-victory-housing-trust",
  "regulatory-judgement-vivid-housing-limited",
  "regulatory-judgement-wakefield-and-district-housing-limited",
  "regulatory-judgement-walsall-housing-group-limited",
  "regulatory-judgement-wandle-housing-association-limited--2",
  "regulatory-judgement-warrington-housing-association-limited",
  "regulatory-judgement-waterloo-housing-group-limited",
  "regulatory-judgement-watford-community-housing-trust",
  "regulatory-judgement-watmos-community-homes",
  "regulatory-judgement-weaver-vale-housing-trust-limited",
  "regulatory-judgement-wellingborough-homes-limited",
  "regulatory-judgement-west-kent-housing-association",
  "regulatory-judgement-westward-housing-group-limited--2",
  "regulatory-judgement-wirral-partnership-homes-limited",
  "regulatory-judgement-wm-housing-group-limited",
  "regulatory-judgement-worthing-homes-limited",
  "regulatory-judgement-wrekin-housing-group-limited",
  "regulatory-judgement-wythenshawe-community-housing-group-limited",
  "regulatory-judgement-yarlington-housing-group",
  "regulatory-judgement-yorkshire-coast-homes-limited",
  "regulatory-judgement-yorkshire-housing-limited--2",
  "regulatory-judgement-your-housing-group-limited--2",
  "regulatory-judgements-and-regulatory-notices",
  "rent-standard-guidance",
  "restructures-and-constitutional-changes",
  "rsh-stakeholder-survey",
  "sector-risk-profile-2013",
  "sector-risk-profile-2014",
  "sector-risk-profile-2015",
  "sector-risk-profile-2016",
  "sector-risk-profile-2017",
  "service-standard-performance-data",
  "statistical-data-return-survey-responses",
  "the-accounting-direction-for-social-housing-in-england-from-april-2012",
  "the-accounting-direction-for-social-housing-in-england-from-april-2015",
  "value-for-money-code-of-practice",
  "value-for-money-metrics-technical-note",
  "what-is-the-regulatory-framework",
  "current-registered-providers-of-social-housing",
  "memorandum-of-understanding-between-the-regulator-of-social-housing-and-the-housing-ombudsman",
  "innovation-plan-hca-regulator-of-social-housing",
  "regulatory-judgement-trinity-housing-association-limited",
  "value-for-money-summary-and-techical-reports",
  "decision-statement-on-introducing-fees-for-social-housing-regulation",
  "decision-statement-on-an-amendment-to-the-tenant-involvement-and-empowerment-standard",
  "decision-statement-on-registration-criteria",
  "decision-statement-on-changes-to-the-accounting-direction",
  "decision-statement-on-the-value-for-money-standard",
  "decision-statement-on-changes-to-regulatory-framework",
  "leasehold-schemes-for-the-elderly-management-fee-limit",
  "regulator-of-social-housing-business-impact-target",
  # statistics
  "statistical-data-return-2011-to-2012",
  "statistical-data-return-2012-to-2013",
  "statistical-data-return-2013-to-2014",
  "statistical-data-return-2014-to-2015",
  "statistical-data-return-2015-to-2016",
  "statistical-data-return-2016-to-2017",
].each do |slug|
  document = Document.find_by(slug: slug)
  edition = document.latest_edition

  lead_organisations = edition.lead_organisations.to_a
  next if lead_organisations.include? regulator_social_housing

  lead_organisations << regulator_social_housing

  edition.lead_organisations = lead_organisations
  edition.save!

  PublishingApiDocumentRepublishingWorker.perform_in(
    2.seconds,
    document.id,
  )
rescue StandardError => e
  puts "#{slug}: #{e.class}, #{e.message}"
end
