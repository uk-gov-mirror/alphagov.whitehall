# Corporate Information page with missing Worldwide Organisation
corporate_information_page = CorporateInformationPage.find(981490)
# Worldwide Organisation for British High Commission Port Vila
worldwide_org = WorldwideOrganisation.find(326)

EditionWorldwideOrganisation.create(edition_id: corporate_information_page.id, worldwide_organisation_id: worldwide_org.id)
