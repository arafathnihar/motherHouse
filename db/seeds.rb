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
    {code: 'ALB', name: 'Albania'},
    {code: 'AUS', name: 'Australia'},
    {code: 'AUT', name: 'Austria'},
    {code: 'BHR', name: 'Bahrain'},
    {code: 'BGD', name: 'Bangladesh'},
    {code: 'BEL', name: 'Belgium'},
    {code: 'BTN', name: 'Bhutan'},
    {code: 'BGR', name: 'Bulgaria'},
    {code: 'CAN', name: 'Canada'},
    {code: 'CHN', name: 'China'},
    {code: 'HRV', name: 'Croatia'},
    {code: 'CYP', name: 'Cyprus'},
    {code: 'CZE', name: 'Czech Republic'},
    {code: 'DNK', name: 'Denmark'},
    {code: 'EGY', name: 'Egypt'},
    {code: 'FIN', name: 'Finland'},
    {code: 'FRA', name: 'France'},
    {code: 'GEO', name: 'Georgia'},
    {code: 'DEU', name: 'Germany'},
    {code: 'GRC', name: 'Greece'},
    {code: 'HKG', name: 'Hong Kong'},
    {code: 'HUN', name: 'Hungary'},
    {code: 'ISL', name: 'Iceland'},
    {code: 'IND', name: 'India'},
    {code: 'IDN', name: 'Indonesia'},
    {code: 'IRN', name: 'Iran'},
    {code: 'IRQ', name: 'Iraq'},
    {code: 'IRL', name: 'Ireland'},
    {code: 'ISR', name: 'Israel'},
    {code: 'ITA', name: 'Italy'},
    {code: 'JPN', name: 'Japan'},
    {code: 'JOR', name: 'Jordan'},
    {code: 'XKX', name: 'Kosovo'},
    {code: 'KWT', name: 'Kuwait'},
    {code: 'LVA', name: 'Latvia'},
    {code: 'LBN', name: 'Lebanon'},
    {code: 'LTU', name: 'Lithuania'},
    {code: 'LUX', name: 'Luxembourg'},
    {code: 'MYS', name: 'Malaysia'},
    {code: 'MDV', name: 'Maldives'},
    {code: 'MLT', name: 'Malta'},
    {code: 'MDA', name: 'Moldova'},
    {code: 'MCO', name: 'Monaco'},
    {code: 'MMR', name: 'Myanmar'},
    {code: 'NPL', name: 'Nepal'},
    {code: 'NLD', name: 'Netherlands'},
    {code: 'NZL', name: 'New Zealand'},
    {code: 'PRK', name: 'North Korea'},
    {code: 'NOR', name: 'Norway'},
    {code: 'OMN', name: 'Oman'},
    {code: 'PAK', name: 'Pakistan'},
    {code: 'PSE', name: 'Palestine'},
    {code: 'PHL', name: 'Philippines'},
    {code: 'POL', name: 'Poland'},
    {code: 'PRT', name: 'Portugal'},
    {code: 'QAT', name: 'Qatar'},
    {code: 'ROU', name: 'Romania'},
    {code: 'RUS', name: 'Russia'},
    {code: 'SAU', name: 'Saudi Arabia'},
    {code: 'SRB', name: 'Serbia'},
    {code: 'SGP', name: 'Singapore'},
    {code: 'SVK', name: 'Slovakia'},
    {code: 'SVN', name: 'Slovenia'},
    {code: 'ZAF', name: 'South Africa'},
    {code: 'KOR', name: 'South Korea'},
    {code: 'ESP', name: 'Spain'},
    {code: 'LKA', name: 'Sri Lanka'},
    {code: 'SWE', name: 'Sweden'},
    {code: 'CHE', name: 'Switzerland'},
    {code: 'SYR', name: 'Syria'},
    {code: 'TWN', name: 'Taiwan'},
    {code: 'THA', name: 'Thailand'},
    {code: 'TUR', name: 'Turkey'},
    {code: 'UKR', name: 'Ukraine'},
    {code: 'ARE', name: 'United Arab Emirates'},
    {code: 'GBR', name: 'United Kingdom'},
    {code: 'USA', name: 'United States'},
    {code: 'VNM', name: 'Vietnam'},
    {code: 'YEM', name: 'Yemen'},
    {code: 'RSB', name: 'Yugoslavia'}
])

Currency.create([
    {code: 'ALL', name: 'Albanian Lek'},
    {code: 'AED', name: 'Arab Emirates Dirham'},
    {code: 'AUD', name: 'Australian Dollar'},
    {code: 'BHD', name: 'Bahraini Dinar'},
    {code: 'BDT', name: 'Bangladeshi Taka'},
    {code: 'BTN', name: 'Bhutan Ngultrum'},
    {code: 'BGN', name: 'Bulgarian Lev'},
    {code: 'CAD', name: 'Canadian Dollar'},
    {code: 'HRK', name: 'Croatian Kuna'},
    {code: 'CZK', name: 'Czech Koruna'},
    {code: 'DKK', name: 'Danish Krone'},
    {code: 'RSD', name: 'Dinar'},
    {code: 'EGP', name: 'Egyptian Pound'},
    {code: 'EUR', name: 'Euro'},
    {code: 'GEL', name: 'Georgian Lari'},
    {code: 'HKD', name: 'Hong Kong Dollar'},
    {code: 'HUF', name: 'Hungarian Forint'},
    {code: 'ISK', name: 'Iceland Krona'},
    {code: 'INR', name: 'Indian Rupee'},
    {code: 'IDR', name: 'Indonesian Rupiah'},
    {code: 'IRR', name: 'Iranian Rial'},
    {code: 'IQD', name: 'Iraqi Dinar'},
    {code: 'ILS', name: 'Israeli New Shekel'},
    {code: 'JPY', name: 'Japanese Yen'},
    {code: 'JOD', name: 'Jordanian Dinar'},
    {code: 'KRW', name: 'Korean Won'},
    {code: 'KWD', name: 'Kuwaiti Dinar'},
    {code: 'LVL', name: 'Latvian Lats'},
    {code: 'LBP', name: 'Lebanese Pound'},
    {code: 'LTL', name: 'Lithuanian Litas'},
    {code: 'MYR', name: 'Malaysian Ringgit'},
    {code: 'MVR', name: 'Maldive Rufiyaa'},
    {code: 'MDL', name: 'Moldovan Leu'},
    {code: 'MMK', name: 'Myanmar Kyat'},
    {code: 'NPR', name: 'Nepalese Rupee'},
    {code: 'NZD', name: 'New Zealand Dollar'},
    {code: 'KPW', name: 'North Korean Won'},
    {code: 'NOK', name: 'Norwegian Krone'},
    {code: 'OMR', name: 'Omani Rial'},
    {code: 'PKR', name: 'Pakistan Rupee'},
    {code: 'PHP', name: 'Philippine Peso'},
    {code: 'PLN', name: 'Polish Zloty'},
    {code: 'QAR', name: 'Qatari Rial'},
    {code: 'RON', name: 'Romanian New Leu'},
    {code: 'RUB', name: 'Russian Ruble'},
    {code: 'SAR', name: 'Saudi Riyal'},
    {code: 'SGD', name: 'Singapore Dollar'},
    {code: 'ZAR', name: 'South African Rand'},
    {code: 'LKR', name: 'Sri Lanka Rupee'},
    {code: 'GBP', name: 'Sterling Pound'},
    {code: 'SEK', name: 'Swedish Krona'},
    {code: 'CHF', name: 'Swiss Franc'},
    {code: 'SYP', name: 'Syrian Pound'},
    {code: 'TWD', name: 'Taiwan Dollar'},
    {code: 'THB', name: 'Thai Baht'},
    {code: 'TRY', name: 'Turkish Lira'},
    {code: 'UAH', name: 'Ukraine Hryvnia'},
    {code: 'USD', name: 'US Dollar'},
    {code: 'VND', name: 'Vietnamese Dong'},
    {code: 'YER', name: 'Yemeni Rial'},
    {code: 'CNY', name: 'Yuan Renminbi	'}
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