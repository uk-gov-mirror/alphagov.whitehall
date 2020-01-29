# add to list without duplicating
def add_to_list(list, val)
  list << val unless list.include? val
end

new = Organisation.find_by(slug: "rural-payments-agency")
old = Organisation.find_by(slug: "natural-england")

# slugs, from zendesk ticket:
[
  "woodland-capital-grants-2015-fencing-fg1",
  "woodland-capital-grants-2015-wooden-field-gate-or-wooden-wings-fg12",
  "woodland-capital-grants-2015-badger-gate-fg14",
  "woodland-capital-grants-2015-water-gates-fg15",
  "woodland-capital-grants-2015-sheep-netting-fg2",
  "woodland-capital-grants-2015-rabbit-fencing-supplement-fg4",
  "woodland-capital-grants-2015-fencing-supplement-difficult-site-fg5",
  "woodland-capital-grants-2015-deer-fencing-fg9",
  "woodland-capital-grants-2015-woodland-management-plan-pa3",
  "woodland-capital-grants-2015-rhododendron-control-sb6",
  "woodland-capital-grants-2015-tree-planting-te4",
  "woodland-capital-grants-2015-individual-tree-shelter-te5",
  "woodland-capital-grants-2015-woodland-creation-maintenance-payment-wd1",
  "woodland-capital-grants-2015-scrub-control-and-felling-diseased-trees-sb1",
  "environmental-stewardship-educational-access-visits-on-your-land",
  "woodland-capital-grants-2015-choose-options",
  "countryside-stewardship-update-land-parcel-records-before-applying",
  "cross-compliance-2016",
  "catchment-sensitive-farming-reduce-agricultural-water-pollution",
  "cross-compliance-2018",
  "environmental-stewardship-how-to-get-paid-under-your-agreement",
  "changes-to-digital-maps-that-may-affect-stewardship-and-forestry-scheme-agreements",
  "countryside-stewardship-and-environmental-stewardship-inspection",
  "digital-maps-in-the-rural-payments-service-check-and-change-mapping-updates",
  "create-a-woodland-management-plan",
  "environmental-stewardship",
  "cross-compliance-2017",
  "rural-land-register",
  "common-agricultural-policy-reform",
  "countryside-stewardship-statements-of-priorities",
  "capital-items-countryside-stewardship-woodland-capital-grants-2015",
  "cross-compliance",
  "countryside-stewardship-woodland-support",
  "countryside-stewardship-facilitation-funding",
  "countryside-stewardship-information-for-agreement-holders",
  "environmental-stewardship-guidance-and-forms-for-existing-agreement-holders",
  "countryside-stewardship-forms",
  "countryside-stewardship-get-paid-for-environmental-land-management",
  "wildlife-offers-countryside-stewardship",
  "environmental-stewardship-shared-grazing-and-common-land",
  "higher-level-stewardship-source-of-british-native-origin-seed",
  "environmental-stewardship-agent-authorisation",
  "environmental-stewardship-supplementary-land-ownership-and-control",
  "countryside-stewardship-hs6-and-hs7-structural-maintenance-plan-and-record-forms",
  "countryside-stewardship-ponds-for-wildlife-and-historic-interest-assessment",
  "countryside-stewardship-farm-facts-template",
  "woodland-management-plans-and-tree-health-support-change-ownership",
  "woodland-management-plans-and-tree-health-support-change-an-agreement",
  "countryside-stewardship-organic-viability-plan",
  "countryside-stewardship-land-ownership-and-control-form",
  "countryside-stewardship-consent-for-soil-sampling-on-scheduled-monuments",
  "countryside-stewardship-ditch-dyke-and-rhine-restoration-assessment",
  "woodland-management-plans-and-tree-health-support-claim-a-payment",
  "countryside-stewardship-building-wildlife-assessment",
  "countryside-stewardship-building-maintenance-plan-and-log",
  "minor-change-notice-for-entry-level-stewardship-agreements",
  "minor-change-request-for-higher-level-stewardship-agreements",
  "countryside-stewardship-common-land-and-shared-grazing-supplementary-application",
  "countryside-stewardship-farm-visit-evaluation",
  "environmental-stewardship-livestock-record-keeping",
  "countryside-stewardship-livestock-record-keeping",
  "vat-declaration-for-higher-level-stewardship-agreement-holders",
  "countryside-stewardship-runoff-and-soil-erosion-risk-assessment",
  "farming-ammonia-reduction-grant-scheme-claim-form-and-offer-terms",
  "countryside-stewardship-capital-grant-application-form",
  "minor-and-temporary-adjustment-mta-form-countryside-stewardship",
  "countryside-stewardship-permanent-grassland-with-very-low-input-options",
  "check-evidence-and-record-keeping-requirements-countryside-stewardship",
  "countryside-stewardship-facilitation-fund-claim-a-grant-and-record-progress",
  "rural-payments-registering-and-updating-your-details",
  "environmental-stewardship-for-heritage-properties",
  "cap-reform-how-we-will-manage-double-funding-greening-and-environmental-stewardship",
  "common-agricultural-policy-introduction-to-the-new-cap-schemes",
  "cap-reform-august-2014-update-including-greening-how-it-works",
  "cap-reform-october-2014-update",
  "cap-reform-december-2014-update",
  "cap-reform-february-2015-update",
  "countryside-stewardship-common-land-and-shared-grazing-supplement",
  "countryside-stewardship-statement-of-priorities-arden-nca097",
  "countryside-stewardship-statement-of-priorities-avon-vales-nca117",
  "countryside-stewardship-statement-of-priorities-bedfordshire-and-cambridgeshire-claylands-nca088",
  "countryside-stewardship-statement-of-priorities-bedfordshire-greensand-ridge-nca090",
  "countryside-stewardship-statement-of-priorities-berkshire-and-marlborough-downs-nca116",
  "countryside-stewardship-statement-of-priorities-black-mountains-and-golden-valley-nca099",
  "countryside-stewardship-statement-of-priorities-blackdowns-nca147",
  "countryside-stewardship-statement-of-priorities-blackmoor-vale-and-the-vale-of-wardour-nca133",
  "countryside-stewardship-statement-of-priorities-bodmin-moor-nca153",
  "countryside-stewardship-statement-of-priorities-border-moors-and-forests-nca005",
  "countryside-stewardship-statement-of-priorities-bowland-fells-nca034",
  "countryside-stewardship-statement-of-priorities-bowland-fringe-and-pendle-hill-nca033",
  "countryside-stewardship-statement-of-priorities-the-brecks-nca085",
  "countryside-stewardship-statement-of-priorities-bristol-avon-valleys-and-ridges-nca118",
  "countryside-stewardship-statement-of-priorities-cannock-chase-and-cank-wood-nca067",
  "countryside-stewardship-statement-of-priorities-carnmenellis-nca155",
  "countryside-stewardship-statement-of-priorities-lincolnshire-central-vale-nca044",
  "countryside-stewardship-statement-of-priorities-central-north-norfolk-nca078",
  "countryside-stewardship-statement-of-priorities-charnwood-nca073",
  "countryside-stewardship-statement-of-priorities-cheshire-sandstone-ridge-nca062",
  "countryside-stewardship-statement-of-priorities-cheviot-fringe-nca003",
  "countryside-stewardship-statement-of-priorities-cheviots-nca004",
  "countryside-stewardship-statement-of-priorities-chilterns-nca110",
  "countryside-stewardship-statement-of-priorities-clun-and-north-west-herefordshire-hills-nca098",
  "countryside-stewardship-statement-of-priorities-cornish-killas-nca152",
  "countryside-stewardship-statement-of-priorities-cotswolds-nca107",
  "countryside-stewardship-statement-of-priorities-cumbria-high-fells-nca008",
  "countryside-stewardship-statement-of-priorities-dark-peak-nca051",
  "countryside-stewardship-statement-of-priorities-dartmoor-nca150",
  "countryside-stewardship-statement-of-priorities-derbyshire-peak-fringe-nca050",
  "countryside-stewardship-statement-of-priorities-devon-redlands-nca148",
  "countryside-stewardship-statement-of-priorities-dorset-downs-and-cranborne-chase-nca134",
  "countryside-stewardship-statement-of-priorities-dorset-heaths-nca135",
  "countryside-stewardship-statement-of-priorities-dunsmore-and-feldon-nca096",
  "countryside-stewardship-statement-of-priorities-durham-coalfield-pennine-fringe-nca016",
  "countryside-stewardship-statement-of-priorities-durham-magnesian-limestone-plateau-nca015",
  "countryside-stewardship-statement-of-priorities-east-anglian-chalk-nca087",
  "countryside-stewardship-statement-of-priorities-eden-valley-nca009",
  "countryside-stewardship-statement-of-priorities-exmoor-nca145",
  "countryside-stewardship-statement-of-priorities-forest-of-dean-and-lower-wye-nca105",
  "countryside-stewardship-statement-of-priorities-greater-thames-estuary-nca081",
  "countryside-stewardship-statement-of-priorities-hampshire-downs-nca130",
  "countryside-stewardship-priority-statement-hensbarrow-nca154",
  "countryside-stewardship-statement-of-priorities-herefordshire-lowlands-nca100",
  "countryside-stewardship-statement-of-priorities-herefordshire-plateau-nca101",
  "countryside-stewardship-statement-of-priorities-high-leicestershire-nca093",
  "countryside-stewardship-statement-of-priorities-high-weald-nca122",
  "countryside-stewardship-statement-of-priorities-holderness-nca040",
  "countryside-stewardship-statement-of-priorities-howardian-hills-nca029",
  "countryside-stewardship-statement-of-priorities-howgill-fells-nca018",
  "countryside-stewardship-statement-of-priorities-humber-estuary-nca041",
  "countryside-stewardship-statement-of-priorities-humberhead-levels-nca039",
  "countryside-stewardship-statement-of-priorities-inner-london-nca112",
  "countryside-stewardship-statement-of-priorities-isle-of-portland-nca137",
  "countryside-stewardship-statement-of-priorities-isle-of-wight-nca127",
  "countryside-stewardship-priority-statement-isles-of-scilly-nca158",
  "countryside-stewardship-statement-of-priorities-kesteven-uplands-nca075",
  "countryside-stewardship-statement-of-priorities-lancashire-and-amounderness-plain-nca032",
  "countryside-stewardship-statement-of-priorities-lancashire-coal-measures-nca056",
  "countryside-stewardship-statement-of-priorities-lancashire-valleys-nca035",
  "countryside-stewardship-statement-of-priorities-leicestershire-and-nottinghamshire-wolds-nca074",
  "countryside-stewardship-statement-of-priorities-leicestershire-and-south-derbyshire-coalfields-nca071",
  "countryside-stewardship-statement-of-priorities-leicestershire-vales-nca094",
  "countryside-stewardship-statement-of-priorities-lincolnshire-coast-and-marshes-nca042",
  "countryside-stewardship-statement-of-priorities-lincolnshire-wolds-nca043",
  "countryside-stewardship-statement-of-priorities-low-weald-nca121",
  "countryside-stewardship-statement-of-priorities-lundy-nca159",
  "countryside-stewardship-statement-of-priorities-malvern-hills-nca103",
  "countryside-stewardship-statement-of-priorities-manchester-conurbation-nca055",
  "countryside-stewardship-statement-of-priorities-manchester-pennine-fringe-nca054",
  "countryside-stewardship-statement-of-priorities-marshwood-and-powerstock-vales-nca139",
  "countryside-stewardship-statement-of-priorities-mease-and-sence-lowlands-nca072",
  "countryside-stewardship-statement-of-priorities-melbourne-parklands-nca070",
  "countryside-stewardship-statement-of-priorities-mendip-hills-nca141",
  "countryside-stewardship-statement-of-priorities-merseyside-valley-nca060",
  "countryside-stewardship-statement-of-priorities-merseyside-conurbation-nca058",
  "countryside-stewardship-statement-of-priorities-mid-norfolk-nca084",
  "countryside-stewardship-statement-of-priorities-mid-northumberland-nca012",
  "countryside-stewardship-statement-of-priorities-mid-severn-sandstone-plateau-nca066",
  "countryside-stewardship-statement-of-priorities-mid-somerset-hills-nca143",
  "countryside-stewardship-statement-of-priorities-midvale-ridge-nca109",
  "countryside-stewardship-statement-of-priorities-morecambe-bay-limestones-nca020",
  "countryside-stewardship-statement-of-priorities-morecambe-coast-lune-estuary-nca031",
  "countryside-stewardship-statement-of-priorities-needwood-and-south-derbyshire-claylands-nca068",
  "countryside-stewardship-statement-of-priorities-new-forest-nca131",
  "countryside-stewardship-statement-of-priorities-north-downs-nca119",
  "countryside-stewardship-statement-of-priorities-north-east-norfolk-and-flegg-nca079",
  "countryside-stewardship-statement-of-priorities-north-kent-plain-nca113",
  "countryside-stewardship-statement-of-priorities-north-norfolk-coast-nca077",
  "countryside-stewardship-statement-of-priorities-north-northumberland-coastal-plain-nca001",
  "countryside-stewardship-statement-of-priorities-north-pennines-nca010",
  "countryside-stewardship-statement-of-priorities-north-west-norfolk-nca076",
  "countryside-stewardship-statement-of-priorities-north-york-moors-and-cleveland-hills-nca025",
  "countryside-stewardship-statement-of-priorities-northamptonshire-uplands-nca095",
  "countryside-stewardship-statement-of-priorities-northamptonshire-vales-nca089",
  "countryside-stewardship-statement-of-priorities-northern-lincolnshire-edge-with-coversands-nca045",
  "countryside-stewardship-statement-of-priorities-northern-thames-basin-nca111",
  "countryside-stewardship-statement-of-priorities-northumberland-sandstone-hills-nca002",
  "countryside-stewardship-statement-of-priorities-orton-fells-nca017",
  "countryside-stewardship-statement-of-priorities-oswestry-uplands-nca063",
  "countryside-stewardship-statement-of-priorities-pennine-dales-fringe-nca022",
  "countryside-stewardship-statement-of-priorities-pevensey-levels-nca124",
  "countryside-stewardship-statement-of-priorities-potteries-and-churnet-valley-nca064",
  "countryside-stewardship-statement-of-priorities-rockingham-forest-nca092",
  "countryside-stewardship-statement-of-priorities-quantock-hills-nca144",
  "countryside-stewardship-statement-of-priorities-romney-marsh-nca123",
  "countryside-stewardship-statement-of-priorities-salisbury-plain-and-west-wiltshire-downs-nca132",
  "countryside-stewardship-statement-of-priorities-nottinghamshire-derbyshire-and-yorkshire-coalfields-nca038",
  "countryside-stewardship-statement-of-priorities-sefton-coast-nca057",
  "countryside-stewardship-statement-of-priorities-severn-and-avon-vales-nca106",
  "countryside-stewardship-statement-of-priorities-sherwood-nca049",
  "countryside-stewardship-statement-of-priorities-shropshire-hills-nca065",
  "countryside-stewardship-statement-of-priorities-shropshire-cheshire-and-staffordshire-plain-nca061",
  "countryside-stewardship-statement-of-priorities-solway-basin-nca006",
  "countryside-stewardship-statement-of-priorities-somerset-levels-and-moors-nca142",
  "countryside-stewardship-statement-of-priorities-south-coast-plain-nca126",
  "countryside-stewardship-statement-of-priorities-south-cumbria-low-fells-nca019",
  "countryside-stewardship-priority-statement-south-devon-nca151",
  "countryside-stewardship-statement-of-priorities-south-downs-nca125",
  "countryside-stewardship-statement-of-priorities-south-east-northumberland-coastal-plain-nca013",
  "countryside-stewardship-statement-of-priorities-south-hampshire-lowlands-nca128",
  "countryside-stewardship-statement-of-priorities-south-herefordshire-and-over-severn-nca104",
  "countryside-stewardship-statement-of-priorities-south-norfolk-and-high-suffolk-claylands-nca083",
  "countryside-stewardship-statement-of-priorities-south-purbeck-nca136",
  "countryside-stewardship-statement-of-priorities-south-suffolk-north-essex-clayland-nca086",
  "countryside-stewardship-statement-of-priorities-south-west-peak-nca053",
  "countryside-stewardship-statement-of-priorities-southern-lincolnshire-edge-nca047",
  "countryside-stewardship-statement-of-priorities-southern-magnesian-limestone-nca030",
  "countryside-stewardship-statement-of-priorities-southern-pennines-nca036",
  "countryside-stewardship-statement-of-priorities-suffolk-coast-heaths-nca082",
  "countryside-stewardship-statement-of-priorities-tees-lowlands-nca023",
  "countryside-stewardship-statement-of-priorities-teme-valley-nca102",
  "countryside-stewardship-statement-of-priorities-thames-basin-heaths-nca129",
  "countryside-stewardship-statement-of-priorities-thames-basin-lowlands-nca114",
  "countryside-stewardship-statement-of-priorities-thames-valley-nca115",
  "countryside-stewardship-statement-of-priorities-the-broads-nca080",
  "countryside-stewardship-statement-of-priorities-the-culm-nca149",
  "countryside-stewardship-statement-of-priorities-the-fens-nca046",
  "countryside-stewardship-statement-of-priorities-the-lizard-nca157",
  "countryside-stewardship-statement-of-priorities-trent-and-belvoir-vales-nca048",
  "countryside-stewardship-statement-of-priorities-trent-valley-washlands-nca069",
  "countryside-stewardship-statement-of-priorities-tyne-and-wear-lowlands-nca014",
  "countryside-stewardship-statement-of-priorities-tyne-gap-and-hadrians-wall-nca011",
  "countryside-stewardship-statement-of-priorities-wealden-greensand-nca120",
  "countryside-stewardship-statement-of-priorities-upper-thames-clay-vales-nca108",
  "countryside-stewardship-statement-of-priorities-vale-of-mowbray-nca024",
  "countryside-stewardship-statement-of-priorities-vale-of-pickering-nca026",
  "countryside-stewardship-statement-of-priorities-vale-of-taunton-and-quantock-fringes-nca146",
  "countryside-stewardship-statement-of-priorities-vale-of-york-nca028",
  "countryside-stewardship-statement-of-priorities-west-cumbria-coastal-plain-nca007",
  "countryside-stewardship-statement-of-priorities-west-penwith-nca156",
  "countryside-stewardship-statement-of-priorities-weymouth-lowlands-nca138",
  "countryside-stewardship-statement-of-priorities-white-peak-nca052",
  "countryside-stewardship-statement-of-priorities-wirral-nca059",
  "countryside-stewardship-statement-of-priorities-yardley-whittlewood-ridge-nca091",
  "countryside-stewardship-statement-of-priorities-yeovil-scarplands-nca140",
  "countryside-stewardship-statement-of-priorities-yorkshire-dales-nca021",
  "countryside-stewardship-statement-of-priorities-yorkshire-southern-pennine-fringe-nca037",
  "countryside-stewardship-statement-of-priorities-yorkshire-wolds-nca027",
  "countryside-stewardship-inheritance-tax-or-capital-gains-exemption",
  "guide-to-countryside-stewardship-water-capital-grants-2015",
  "guide-to-countryside-stewardship-woodland-capital-grants-2015",
  "cross-compliance-guidance-for-2015",
  "countryside-stewardship-farm-wildlife-package",
  "environmental-stewardship-additions-transfers-and-option-changes-to-existing-agreements",
  "countryside-stewardship-hedgerows-and-boundaries-grant-manual-2017",
  "countryside-stewardship-woodland-creation-grant-manual-2017",
  "countryside-stewardship-woodland-creation-grant-manual-2016",
  "hedgerows-and-boundaries-grant-manual-2017-countryside-stewardship",
  "countryside-stewardship-hedgerows-and-boundaries-grant-manual-2016",
  "guide-to-countryside-stewardship-facilitation-fund",
  "countryside-stewardship-woodland-management-plan-grant-manual-2017",
  "countryside-stewardship-woodland-creation-grant-manual-2018",
  "high-speed-two-hs2-how-it-affects-agri-environment-scheme-agreements",
  "countryside-stewardship-woodland-tree-health-grant-manual-2017",
  "woodland-tree-health-grant-countryside-stewardship",
  "southern-north-sea-marine-area-index-map-and-site-packages",
  "hedgerows-and-boundaries-grant-countryside-stewardship",
  "water-environment-grant-weg-handbooks-guidance-and-forms",
  "woodland-management-plan-grant-countryside-stewardship",
  "annex-8-of-mid-tier-and-new-countryside-stewardship-offers-for-wildlife-manual",
  "countryside-stewardship-how-to-submit-claims-online",
  "hot-and-dry-weather-conditions-in-england",
  "historic-buildings-restoration-grant-countryside-stewardship",
  "catchment-sensitive-farming-officer-contacts",
  "countryside-stewardship-manual-and-grants-1-january-2016-agreements",
  "countryside-stewardship-mid-tier-including-water-quality-capital-items-manual-for-1-january-2017-agreements",
  "countryside-stewardship-higher-tier-manual-for-1-january-2017-agreements",
  "mid-tier-manual-for-1-january-2018-agreements-countryside-stewardship",
  "higher-tier-manual-for-1-january-2018-agreements-countryside-stewardship",
  "countryside-stewardship-higher-tier-manual",
  "countryside-stewardship-mid-tier-including-water-quality-capital-items-manual",
  "arable-offer-countryside-stewardship",
  "lowland-grazing-offer-countryside-stewardship",
  "mixed-farming-offer-countryside-stewardship",
  "upland-offer-countryside-stewardship",
  "countryside-stewardship-facilitation-fund-successful-applications",
  "countryside-stewardship-facilitation-fund-successful-applications-in-round-2",
  "countryside-stewardship-facilitation-fund-successful-applications-in-2017-floods-round",
  "facilitation-fund-successful-applications-in-2017-national-round",
  "countryside-stewardship-flood-reduction-infographic",
  "countryside-stewardship-facilitation-fund-case-studies",
  "mid-tier-events-2018-countryside-stewardship",
  "tell-the-rural-payments-agency-about-land-changes-and-entitlement-transfers",
].each do |slug|
  begin
    document = Document.find_by(slug: slug)
    edition = document.latest_edition

    lead_organisations = edition.lead_organisations.to_a
    supporting_organisations = edition.supporting_organisations.to_a

    # replace `old` with `new` in the lead and supporting orgs; if
    # `old` is lead and `new` is supporting, then this will "promote"
    # `new` to lead.
    if lead_organisations.include? old
      add_to_list(lead_organisations, new)
      supporting_organisations.delete new
    elsif supporting_organisations.include?(old) && !lead_organisations.include?(new)
      add_to_list(supporting_organisations, new)
    end
    lead_organisations.delete old
    supporting_organisations.delete old

    edition.update(
      lead_organisations: lead_organisations,
      supporting_organisations: supporting_organisations,
    )

    # the migration runs inside a transaction, so delay the
    # republishing until the migration is done
    PublishingApiDocumentRepublishingWorker.perform_in(
      5.seconds,
      document.id,
    )
  rescue StandardError => e
    puts "#{slug}: #{e.class}, #{e.message}"
  end
end
