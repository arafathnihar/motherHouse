# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Add admin user
User.create(
    customId: 'MH0001',
    name: 'Admin User',
    contact: '0111234567',

    username: 'shiva',
    password: Digest::SHA1.hexdigest('abc@123'),

    guid: SecureRandom.uuid,
    created_by: 1
)

Country.create([
  {code: 'AFG', name: 'Afghanistan'},
  {code: 'ALB', name: 'Albania'},
  {code: 'DZA', name: 'Algeria'},
  {code: 'ASM', name: 'American Samoa'},
  {code: 'AND', name: 'Andorra'},
  {code: 'AGO', name: 'Angola'},
  {code: 'AIA', name: 'Anguilla'},
  {code: 'ATA', name: 'Antarctica'},
  {code: 'ATG', name: 'Antigua and Barbuda'},
  {code: 'ARG', name: 'Argentina'},
  {code: 'ARM', name: 'Armenia'},
  {code: 'ABW', name: 'Aruba'},
  {code: 'AUS', name: 'Australia'},
  {code: 'AUT', name: 'Austria'},
  {code: 'AZE', name: 'Azerbaijan'},
  {code: 'BHS', name: 'Bahamas'},
  {code: 'BHR', name: 'Bahrain'},
  {code: 'BGD', name: 'Bangladesh'},
  {code: 'BRB', name: 'Barbados'},
  {code: 'BLR', name: 'Belarus'},
  {code: 'BEL', name: 'Belgium'},
  {code: 'BLZ', name: 'Belize'},
  {code: 'BEN', name: 'Benin'},
  {code: 'BMU', name: 'Bermuda'},
  {code: 'BTN', name: 'Bhutan'},
  {code: 'BOL', name: 'Bolivia'},
  {code: 'BES', name: 'Bonaire'},
  {code: 'BIH', name: 'Bosnia and Herzegovina'},
  {code: 'BWA', name: 'Botswana'},
  {code: 'BVT', name: 'Bouvet Island'},
  {code: 'BRA', name: 'Brazil'},
  {code: 'BRN', name: 'Brunei Darussalam'},
  {code: 'BGR', name: 'Bulgaria'},
  {code: 'BFA', name: 'Burkina Faso'},
  {code: 'BDI', name: 'Burundi'},
  {code: 'KHM', name: 'Cambodia'},
  {code: 'CMR', name: 'Cameroon'},
  {code: 'CAN', name: 'Canada'},
  {code: 'CPV', name: 'Cape Verde'},
  {code: 'CYM', name: 'Cayman Islands'},
  {code: 'CAF', name: 'Central African Republic'},
  {code: 'TCD', name: 'Chad'},
  {code: 'CHL', name: 'Chile'},
  {code: 'CHN', name: 'China'},
  {code: 'CXR', name: 'Christmas Island'},
  {code: 'COL', name: 'Colombia'},
  {code: 'COM', name: 'Comoros'},
  {code: 'COG', name: 'Congo'},
  {code: 'COD', name: 'Republic of the Congo'},
  {code: 'COK', name: 'Cook Islands'},
  {code: 'CRI', name: 'Costa Rica'},
  {code: 'HRV', name: 'Croatia'},
  {code: 'CUB', name: 'Cuba'},
  {code: 'CYP', name: 'Cyprus'},
  {code: 'CZE', name: 'Czech Republic'},
  {code: 'DNK', name: 'Denmark'},
  {code: 'DJI', name: 'Djibouti'},
  {code: 'DMA', name: 'Dominica'},
  {code: 'DOM', name: 'Dominican Republic'},
  {code: 'ECU', name: 'Ecuador'},
  {code: 'EGY', name: 'Egypt'},
  {code: 'GNQ', name: 'Equatorial Guinea'},
  {code: 'ERI', name: 'Eritrea'},
  {code: 'EST', name: 'Estonia'},
  {code: 'ETH', name: 'Ethiopia'},
  {code: 'FJI', name: 'Fiji'},
  {code: 'FIN', name: 'Finland'},
  {code: 'FRA', name: 'France'},
  {code: 'GUF', name: 'French Guiana'},
  {code: 'PYF', name: 'French Polynesia'},
  {code: 'ATF', name: 'French Southern Territories'},
  {code: 'GAB', name: 'Gabon'},
  {code: 'GMB', name: 'Gambia'},
  {code: 'GEO', name: 'Georgia'},
  {code: 'DEU', name: 'Germany'},
  {code: 'GHA', name: 'Ghana'},
  {code: 'GIB', name: 'Gibraltar'},
  {code: 'GRC', name: 'Greece'},
  {code: 'GRL', name: 'Greenland'},
  {code: 'GRD', name: 'Grenada'},
  {code: 'GLP', name: 'Guadeloupe'},
  {code: 'GUM', name: 'Guam'},
  {code: 'GTM', name: 'Guatemala'},
  {code: 'GGY', name: 'Guernsey'},
  {code: 'GIN', name: 'Guinea'},
  {code: 'GNB', name: 'Guinea-Bissau'},
  {code: 'GUY', name: 'Guyana'},
  {code: 'HTI', name: 'Haiti'},
  {code: 'HND', name: 'Honduras'},
  {code: 'HKG', name: 'Hong Kong'},
  {code: 'HUN', name: 'Hungary'},
  {code: 'ISL', name: 'Iceland'},
  {code: 'IND', name: 'India'},
  {code: 'IDN', name: 'Indonesia'},
  {code: 'IRN', name: 'Iran, Islamic Republic of'},
  {code: 'IRQ', name: 'Iraq'},
  {code: 'IRL', name: 'Ireland'},
  {code: 'IMN', name: 'Isle of Man'},
  {code: 'ISR', name: 'Israel'},
  {code: 'ITA', name: 'Italy'},
  {code: 'JAM', name: 'Jamaica'},
  {code: 'JPN', name: 'Japan'},
  {code: 'JEY', name: 'Jersey'},
  {code: 'JOR', name: 'Jordan'},
  {code: 'KAZ', name: 'Kazakhstan'},
  {code: 'KEN', name: 'Kenya'},
  {code: 'KIR', name: 'Kiribati'},
  {code: 'PRK', name: 'Korea North '},
  {code: 'KOR', name: 'Korea South '},
  {code: 'KWT', name: 'Kuwait'},
  {code: 'KGZ', name: 'Kyrgyzstan'},
  {code: 'LVA', name: 'Latvia'},
  {code: 'LBN', name: 'Lebanon'},
  {code: 'LSO', name: 'Lesotho'},
  {code: 'LBR', name: 'Liberia'},
  {code: 'LBY', name: 'Libya'},
  {code: 'LIE', name: 'Liechtenstein'},
  {code: 'LTU', name: 'Lithuania'},
  {code: 'LUX', name: 'Luxembourg'},
  {code: 'MAC', name: 'Macao'},
  {code: 'MKD', name: 'Macedonia '},
  {code: 'MDG', name: 'Madagascar'},
  {code: 'MWI', name: 'Malawi'},
  {code: 'MYS', name: 'Malaysia'},
  {code: 'MDV', name: 'Maldives'},
  {code: 'MLI', name: 'Mali'},
  {code: 'MLT', name: 'Malta'},
  {code: 'MHL', name: 'Marshall Islands'},
  {code: 'MTQ', name: 'Martinique'},
  {code: 'MRT', name: 'Mauritania'},
  {code: 'MUS', name: 'Mauritius'},
  {code: 'MYT', name: 'Mayotte'},
  {code: 'MEX', name: 'Mexico'},
  {code: 'MDA', name: 'Moldova'},
  {code: 'MCO', name: 'Monaco'},
  {code: 'MNG', name: 'Mongolia'},
  {code: 'MNE', name: 'Montenegro'},
  {code: 'MSR', name: 'Montserrat'},
  {code: 'MAR', name: 'Morocco'},
  {code: 'MOZ', name: 'Mozambique'},
  {code: 'MMR', name: 'Myanmar'},
  {code: 'NAM', name: 'Namibia'},
  {code: 'NRU', name: 'Nauru'},
  {code: 'NPL', name: 'Nepal'},
  {code: 'NLD', name: 'Netherlands'},
  {code: 'NCL', name: 'New Caledonia'},
  {code: 'NZL', name: 'New Zealand'},
  {code: 'NIC', name: 'Nicaragua'},
  {code: 'NER', name: 'Niger'},
  {code: 'NGA', name: 'Nigeria'},
  {code: 'NIU', name: 'Niue'},
  {code: 'NFK', name: 'Norfolk Island'},
  {code: 'MNP', name: 'Northern Mariana Islands'},
  {code: 'NOR', name: 'Norway'},
  {code: 'OMN', name: 'Oman'},
  {code: 'PAK', name: 'Pakistan'},
  {code: 'PLW', name: 'Palau'},
  {code: 'PSE', name: 'Palestine'},
  {code: 'PAN', name: 'Panama'},
  {code: 'PHL', name: 'Philippines'},
  {code: 'PCN', name: 'Pitcairn'},
  {code: 'POL', name: 'Poland'},
  {code: 'PRT', name: 'Portugal'},
  {code: 'PRI', name: 'Puerto Rico'},
  {code: 'QAT', name: 'Qatar'},
  {code: 'ROU', name: 'Romania'},
  {code: 'RUS', name: 'Russian Federation'},
  {code: 'RWA', name: 'Rwanda'},
  {code: 'REU', name: 'Reunion'},
  {code: 'BLM', name: 'Saint Barthelemy'},
  {code: 'SHN', name: 'Saint Helena'},
  {code: 'KNA', name: 'Saint Kitts and Nevis'},
  {code: 'LCA', name: 'Saint Lucia'},
  {code: 'WSM', name: 'Samoa'},
  {code: 'SMR', name: 'San Marino'},
  {code: 'STP', name: 'Sao Tome and Principe'},
  {code: 'SAU', name: 'Saudi Arabia'},
  {code: 'SEN', name: 'Senegal'},
  {code: 'SRB', name: 'Serbia'},
  {code: 'SYC', name: 'Seychelles'},
  {code: 'SLE', name: 'Sierra Leone'},
  {code: 'SGP', name: 'Singapore'},
  {code: 'SVK', name: 'Slovakia'},
  {code: 'SVN', name: 'Slovenia'},
  {code: 'SLB', name: 'Solomon Islands'},
  {code: 'SOM', name: 'Somalia'},
  {code: 'ZAF', name: 'South Africa'},
  {code: 'SSD', name: 'South Sudan'},
  {code: 'ESP', name: 'Spain'},
  {code: 'LKA', name: 'Sri Lanka'},
  {code: 'SDN', name: 'Sudan'},
  {code: 'SUR', name: 'Suriname'},
  {code: 'SWZ', name: 'Swaziland'},
  {code: 'SWE', name: 'Sweden'},
  {code: 'CHE', name: 'Switzerland'},
  {code: 'SYR', name: 'Syrian Arab Republic'},
  {code: 'TWN', name: 'Taiwan, Province of China'},
  {code: 'TJK', name: 'Tajikistan'},
  {code: 'TZA', name: 'United Republic of Tanzania'},
  {code: 'THA', name: 'Thailand'},
  {code: 'TLS', name: 'Timor-Leste'},
  {code: 'TGO', name: 'Togo'},
  {code: 'TKL', name: 'Tokelau'},
  {code: 'TON', name: 'Tonga'},
  {code: 'TTO', name: 'Trinidad and Tobago'},
  {code: 'TUN', name: 'Tunisia'},
  {code: 'TUR', name: 'Turkey'},
  {code: 'TKM', name: 'Turkmenistan'},
  {code: 'TUV', name: 'Tuvalu'},
  {code: 'UGA', name: 'Uganda'},
  {code: 'UKR', name: 'Ukraine'},
  {code: 'ARE', name: 'United Arab Emirates'},
  {code: 'GBR', name: 'United Kingdom'},
  {code: 'USA', name: 'United States'},
  {code: 'URY', name: 'Uruguay'},
  {code: 'UZB', name: 'Uzbekistan'},
  {code: 'VUT', name: 'Vanuatu'},
  {code: 'VEN', name: 'Venezuela'},
  {code: 'VNM', name: 'Viet Nam'},
  {code: 'VGB', name: 'British Virgin Islands'},
  {code: 'VIR', name: 'US Virgin Islands'},
  {code: 'ESH', name: 'Western Sahara'},
  {code: 'YEM', name: 'Yemen'},
  {code: 'ZMB', name: 'Zambia'},
  {code: 'ZWE', name: 'Zimbabwe'},
  {code: 'ALA', name: 'Aland Islands'},
  {code: 'ZMB', name: 'Zambia'},
  {code: 'ZWE', name: 'Zimbabwe'},
  {code: 'ALA', name: 'Aland Islands'}
])

Currency.create([
  {code: 'AFN', name: 'Afghanistan Afghani'},
  {code: 'ALL', name: 'Albanian Lek'},
  {code: 'DZD', name: 'Algerian Dinar'},
  {code: 'USD', name: 'US Dollar'},
  {code: 'EUR', name: 'Euro'},
  {code: 'AOA', name: 'Angolan Kwanza'},
  {code: 'XCD', name: 'East Caribbean Dollar'},
  {code: 'XCD', name: 'East Caribbean Dollar'},
  {code: 'XCD', name: 'East Caribbean Dollar'},
  {code: 'ARS', name: 'Argentine Peso'},
  {code: 'AMD', name: 'Armenian Dram'},
  {code: 'AWG', name: 'Aruban Guilder'},
  {code: 'AUD', name: 'Australian Dollar'},
  {code: 'EUR', name: 'Euro'},
  {code: 'AZN', name: 'Azerbaijan New Manat'},
  {code: 'BSD', name: 'Bahamian Dollar'},
  {code: 'BHD', name: 'Bahraini Dinar'},
  {code: 'BDT', name: 'Bangladeshi Taka'},
  {code: 'BBD', name: 'Barbados Dollar'},
  {code: 'BYR', name: 'Belarussian Ruble'},
  {code: 'EUR', name: 'Euro'},
  {code: 'BZD', name: 'Belize Dollar'},
  {code: 'XOF', name: 'CFA Franc BCEAO'},
  {code: 'BMD', name: 'Bermudian Dollar'},
  {code: 'BTN', name: 'Bhutan Ngultrum'},
  {code: 'BOB', name: 'Boliviano'},
  {code: 'BAM', name: 'Marka'},
  {code: 'BWP', name: 'Botswana Pula'},
  {code: 'NOK', name: 'Norwegian Krone'},
  {code: 'BRL', name: 'Brazilian Real'},
  {code: 'USD', name: 'US Dollar'},
  {code: 'BND', name: 'Brunei Dollar'},
  {code: 'BGN', name: 'Bulgarian Lev'},
  {code: 'XOF', name: 'CFA Franc BCEAO'},
  {code: 'BIF', name: 'Burundi Franc'},
  {code: 'KHR', name: 'Kampuchean Riel'},
  {code: 'XAF', name: 'CFA Franc BEAC'},
  {code: 'CAD', name: 'Canadian Dollar'},
  {code: 'CVE', name: 'Cape Verde Escudo'},
  {code: 'KYD', name: 'Cayman Islands Dollar'},
  {code: 'XAF', name: 'CFA Franc BEAC'},
  {code: 'XAF', name: 'CFA Franc BEAC'},
  {code: 'CLP', name: 'Chilean Peso'},
  {code: 'CNY', name: 'Yuan Renminbi'},
  {code: 'AUD', name: 'Australian Dollar'},
  {code: 'AUD', name: 'Australian Dollar'},
  {code: 'COP', name: 'Colombian Peso'},
  {code: 'KMF', name: 'Comoros Franc'},
  {code: 'XAF', name: 'CFA Franc BEAC'},
  {code: 'CDF', name: 'Francs'},
  {code: 'NZD', name: 'New Zealand Dollar'},
  {code: 'CRC', name: 'Costa Rican Colon'},
  {code: 'HRK', name: 'Croatian Kuna'},
  {code: 'CUP', name: 'Cuban Peso'},
  {code: 'EUR', name: 'Euro'},
  {code: 'CZK', name: 'Czech Koruna'},
  {code: 'DKK', name: 'Danish Krone'},
  {code: 'DJF', name: 'Djibouti Franc'},
  {code: 'XCD', name: 'East Caribbean Dollar'},
  {code: 'DOP', name: 'Dominican Peso'},
  {code: 'ECS', name: 'Ecuador Sucre'},
  {code: 'EGP', name: 'Egyptian Pound'},
  {code: 'SVC', name: 'El Salvador Colon'},
  {code: 'XAF', name: 'CFA Franc BEAC'},
  {code: 'ERN', name: 'Eritrean Nakfa'},
  {code: 'EUR', name: 'Euro'},
  {code: 'ETB', name: 'Ethiopian Birr'},
  {code: 'EUR', name: 'Euro'},
  {code: 'FKP', name: 'Falkland Islands Pound'},
  {code: 'DKK', name: 'Danish Krone'},
  {code: 'FJD', name: 'Fiji Dollar'},
  {code: 'EUR', name: 'Euro'},
  {code: 'EUR', name: 'Euro'},
  {code: 'EUR', name: 'Euro'},
  {code: 'EUR', name: 'Euro'},
  {code: 'XAF', name: 'CFA Franc BEAC'},
  {code: 'GMD', name: 'Gambian Dalasi'},
  {code: 'GEL', name: 'Georgian Lari'},
  {code: 'EUR', name: 'Euro'},
  {code: 'GHS', name: 'Ghanaian Cedi'},
  {code: 'GIP', name: 'Gibraltar Pound'},
  {code: 'GBP', name: 'Pound Sterling'},
  {code: 'EUR', name: 'Euro'},
  {code: 'DKK', name: 'Danish Krone'},
  {code: 'XCD', name: 'East Carribean Dollar'},
  {code: 'EUR', name: 'Euro'},
  {code: 'USD', name: 'US Dollar'},
  {code: 'QTQ', name: 'Guatemalan Quetzal'},
  {code: 'GGP', name: 'Pound Sterling'},
  {code: 'GNF', name: 'Guinea Franc'},
  {code: 'GWP', name: 'Guinea-Bissau Peso'},
  {code: 'GYD', name: 'Guyana Dollar'},
  {code: 'HTG', name: 'Haitian Gourde'},
  {code: 'AUD', name: 'Australian Dollar'},
  {code: 'HNL', name: 'Honduran Lempira'},
  {code: 'HKD', name: 'Hong Kong Dollar'},
  {code: 'HUF', name: 'Hungarian Forint'},
  {code: 'ISK', name: 'Iceland Krona'},
  {code: 'INR', name: 'Indian Rupee'},
  {code: 'IDR', name: 'Indonesian Rupiah'},
  {code: 'IRR', name: 'Iranian Rial'},
  {code: 'IQD', name: 'Iraqi Dinar'},
  {code: 'EUR', name: 'Euro'},
  {code: 'GBP', name: 'Pound Sterling'},
  {code: 'ILS', name: 'Israeli New Shekel'},
  {code: 'EUR', name: 'Euro'},
  {code: 'XOF', name: 'CFA Franc BCEAO'},
  {code: 'JMD', name: 'Jamaican Dollar'},
  {code: 'JPY', name: 'Japanese Yen'},
  {code: 'GBP', name: 'Pound Sterling'},
  {code: 'JOD', name: 'Jordanian Dinar'},
  {code: 'KZT', name: 'Kazakhstan Tenge'},
  {code: 'KES', name: 'Kenyan Shilling'},
  {code: 'AUD', name: 'Australian Dollar'},
  {code: 'KPW', name: 'North Korean Won'},
  {code: 'KRW', name: 'Korean Won'},
  {code: 'KWD', name: 'Kuwaiti Dinar'},
  {code: 'KGS', name: 'Som'},
  {code: 'LAK', name: 'Lao Kip'},
  {code: 'LVL', name: 'Latvian Lats'},
  {code: 'LBP', name: 'Lebanese Pound'},
  {code: 'LSL', name: 'Lesotho Loti'},
  {code: 'LRD', name: 'Liberian Dollar'},
  {code: 'LYD', name: 'Libyan Dinar'},
  {code: 'CHF', name: 'Swiss Franc'},
  {code: 'LTL', name: 'Lithuanian Litas'},
  {code: 'EUR', name: 'Euro'},
  {code: 'MOP', name: 'Macau Pataca'},
  {code: 'MKD', name: 'Denar'},
  {code: 'MGF', name: 'Malagasy Franc'},
  {code: 'MWK', name: 'Malawi Kwacha'},
  {code: 'MYR', name: 'Malaysian Ringgit'},
  {code: 'MVR', name: 'Maldive Rufiyaa'},
  {code: 'XOF', name: 'CFA Franc BCEAO'},
  {code: 'EUR', name: 'Euro'},
  {code: 'USD', name: 'US Dollar'},
  {code: 'EUR', name: 'Euro'},
  {code: 'MRO', name: 'Mauritanian Ouguiya'},
  {code: 'MUR', name: 'Mauritius Rupee'},
  {code: 'EUR', name: 'Euro'},
  {code: 'MXN', name: 'Mexican Nuevo Peso'},
  {code: 'USD', name: 'US Dollar'},
  {code: 'MDL', name: 'Moldovan Leu'},
  {code: 'EUR', name: 'Euro'},
  {code: 'MNT', name: 'Mongolian Tugrik'},
  {code: 'EUR', name: 'Euro'},
  {code: 'XCD', name: 'East Caribbean Dollar'},
  {code: 'MAD', name: 'Moroccan Dirham'},
  {code: 'MZN', name: 'Mozambique Metical'},
  {code: 'MMK', name: 'Myanmar Kyat'},
  {code: 'NAD', name: 'Namibian Dollar'},
  {code: 'AUD', name: 'Australian Dollar'},
  {code: 'NPR', name: 'Nepalese Rupee'},
  {code: 'EUR', name: 'Euro'},
  {code: 'ANG', name: 'Netherlands Antillean Guilder'},
  {code: 'XPF', name: 'CFP Franc'},
  {code: 'NZD', name: 'New Zealand Dollar'},
  {code: 'NIO', name: 'Nicaraguan Cordoba Oro'},
  {code: 'XOF', name: 'CFA Franc BCEAO'},
  {code: 'NGN', name: 'Nigerian Naira'},
  {code: 'NZD', name: 'New Zealand Dollar'},
  {code: 'AUD', name: 'Australian Dollar'},
  {code: 'USD', name: 'US Dollar'},
  {code: 'NOK', name: 'Norwegian Krone'},
  {code: 'OMR', name: 'Omani Rial'},
  {code: 'PKR', name: 'Pakistan Rupee'},
  {code: 'USD', name: 'US Dollar'},
  {code: 'PAB', name: 'Panamanian Balboa'},
  {code: 'PGK', name: 'Papua New Guinea Kina'},
  {code: 'PYG', name: 'Paraguay Guarani'},
  {code: 'PEN', name: 'Peruvian Nuevo Sol'},
  {code: 'PHP', name: 'Philippine Peso'},
  {code: 'NZD', name: 'New Zealand Dollar'},
  {code: 'PLN', name: 'Polish Zloty'},
  {code: 'XPF', name: 'CFP Franc'},
  {code: 'EUR', name: 'Euro'},
  {code: 'USD', name: 'US Dollar'},
  {code: 'QAR', name: 'Qatari Rial'},
  {code: 'EUR', name: 'Euro'},
  {code: 'RON', name: 'Romanian New Leu'},
  {code: 'RUB', name: 'Russian Ruble'},
  {code: 'RWF', name: 'Rwanda Franc'},
  {code: 'SHP', name: 'St. Helena Pound'},
  {code: 'XCD', name: 'East Caribbean Dollar'},
  {code: 'XCD', name: 'East Caribbean Dollar'},
  {code: 'EUR', name: 'Euro'},
  {code: 'XCD', name: 'East Caribbean Dollar'},
  {code: 'WST', name: 'Samoan Tala'},
  {code: 'EUR', name: 'Euro'},
  {code: 'STD', name: 'Dobra'},
  {code: 'SAR', name: 'Saudi Riyal'},
  {code: 'XOF', name: 'CFA Franc BCEAO'},
  {code: 'RSD', name: 'Dinar'},
  {code: 'SCR', name: 'Seychelles Rupee'},
  {code: 'SLL', name: 'Sierra Leone Leone'},
  {code: 'SGD', name: 'Singapore Dollar'},
  {code: 'EUR', name: 'Euro'},
  {code: 'EUR', name: 'Euro'},
  {code: 'SBD', name: 'Solomon Islands Dollar'},
  {code: 'SOS', name: 'Somali Shilling'},
  {code: 'ZAR', name: 'South African Rand'},
  {code: 'GBP', name: 'Pound Sterling'},
  {code: 'SSP', name: 'South Sudan Pound'},
  {code: 'EUR', name: 'Euro'},
  {code: 'LKR', name: 'Sri Lanka Rupee'},
  {code: 'SDG', name: 'Sudanese Pound'},
  {code: 'SRD', name: 'Surinam Dollar'},
  {code: 'NOK', name: 'Norwegian Krone'},
  {code: 'SZL', name: 'Swaziland Lilangeni'},
  {code: 'SEK', name: 'Swedish Krona'},
  {code: 'CHF', name: 'Swiss Franc'},
  {code: 'SYP', name: 'Syrian Pound'},
  {code: 'TWD', name: 'Taiwan Dollar'},
  {code: 'TJS', name: 'Tajik Somoni'},
  {code: 'TZS', name: 'Tanzanian Shilling'},
  {code: 'THB', name: 'Thai Baht'},
  {code: 'XOF', name: 'CFA Franc BCEAO'},
  {code: 'NZD', name: 'New Zealand Dollar'},
  {code: 'TOP', name: 'Tongan Pa\'anga'},
  {code: 'TTD', name: 'Trinidad and Tobago Dollar'},
  {code: 'TND', name: 'Tunisian Dollar'},
  {code: 'TRY', name: 'Turkish Lira'},
  {code: 'TMT', name: 'Manat'},
  {code: 'USD', name: 'US Dollar'},
  {code: 'AUD', name: 'Australian Dollar'},
  {code: 'GBP', name: 'Pound Sterling'},
  {code: 'UGX', name: 'Uganda Shilling'},
  {code: 'UAH', name: 'Ukraine Hryvnia'},
  {code: 'AED', name: 'Arab Emirates Dirham'},
  {code: 'UYU', name: 'Uruguayan Peso'},
  {code: 'USD', name: 'US Dollar'},
  {code: 'USD', name: 'US Dollar'},
  {code: 'UZS', name: 'Uzbekistan Sum'},
  {code: 'VUV', name: 'Vanuatu Vatu'},
  {code: 'EUR', name: 'Euro'},
  {code: 'VEF', name: 'Venezuelan Bolivar'},
  {code: 'VND', name: 'Vietnamese Dong'},
  {code: 'USD', name: 'US Dollar'},
  {code: 'USD', name: 'US Dollar'},
  {code: 'XPF', name: 'CFP Franc'},
  {code: 'MAD', name: 'Moroccan Dirham'},
  {code: 'YER', name: 'Yemeni Rial'},
  {code: 'ZMW', name: 'Zambian Kwacha'},
  {code: 'ZWD', name: 'Zimbabwe Dollar'}
])

MainAgent.create(
    customId: 'MH0001',
    name: 'Mother House',
    contact: '0111234567',
    country_id: 145,

    guid: SecureRandom.uuid,
    created_by: 1
)

Agent.create(
    customId: 'WC0001',
    main_agent_id: 1,
    name: 'Walking Customer',

    guid: SecureRandom.uuid,
    created_by: 1
)

# tempory

Agent.create(
    customId: 'AG0001',
    main_agent_id: 1,
    name: 'John Targarian',
    contact: '0111234568',
    country_id: 56,

    guid: SecureRandom.uuid,
    created_by: 1
)

Agent.create(
    customId: 'AG0002',
    main_agent_id: 1,
    name: 'Sansa Stark',
    contact: '0111234569',
    country_id: 36,

    guid: SecureRandom.uuid,
    created_by: 1
)

Agent.create(
    customId: 'AG0003',
    main_agent_id: 1,
    name: 'Tiffany Alvord',
    contact: '0111234570',
    country_id: 115,

    guid: SecureRandom.uuid,
    created_by: 1
)

Agent.create(
    customId: 'AG0004',
    main_agent_id: 1,
    name: 'Jayanath Balasubramaniam',
    contact: '0111234571',
    country_id: 125,

    guid: SecureRandom.uuid,
    created_by: 1
)



ReceivingAgent.create(
    main_agent_id: 1,
    customId: 'RA0001',
    name: 'Daynaris Targarian',
    contact: '0111234577',
    country_id: 115,

    guid: SecureRandom.uuid,
    created_by: 1
)

ReceivingAgent.create(
    main_agent_id: 1,
    customId: 'RA0002',
    name: 'Misba Ul Haq',
    contact: '0111234578',
    country_id: 15,

    guid: SecureRandom.uuid,
    created_by: 1
)

ReceivingAgent.create(
    main_agent_id: 1,
    customId: 'RA0003',
    name: 'Andrew Symonds',
    contact: '0111234579',
    country_id: 13,

    guid: SecureRandom.uuid,
    created_by: 1
)