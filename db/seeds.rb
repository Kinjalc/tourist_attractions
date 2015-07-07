# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
City.destroy_all
city = City.create!(name:'Chicago', state: 'IL', country: 'USA', description: 'Steely skycrapers, top chefs, rocking festivals – the Windy City will blow you away with its low-key cultured awesomeness')
city.tourist_attractions.create!(name:'Navy Pier', description:'You can''t truly experience Chicago without a trip to Navy Pier. This 50-acre playground of entertainment, museums, activities, restaurants, and shops is the perfect place for some family fun time.
  First on the list is a trip to Pier Park for a ride on the 150-foot Ferris wheel, which offers great city and Lake Michigan views and is open year-round. Also check out the whimsical musical carousel, Wave Swinger lift-and-twirl ride, miniature golf course, remote control boats, and more.

  Next, grab the kids and go explore educational wonders at the Chicago Children''s Museum. Discover dozens of lively interactive exhibits such as BIG Backyard, Dinosaur Expedition, Inventing Lab, and the Kovler Family Climbing Schooner. Then get lost in Amazing Chicago''s Funhouse Maze where you will be entertained by the Mirror Maze, Spinning Tunnel, and more.

  See a blockbuster on Chicago''s largest movie screen at the IMAX Theater. Or take a dynamic high-speed motion thrill ride to Antarctica, the moon and more on the Transporter FX.

  And during the warmer months, it''s prime time for the Pier''s boating season. Get off the shores and board one of the many sightseeing and dining boat cruises. Take your pick of vessel, all lined up along the waterfront, from Seadog and Shoreline to The Odyssey. The views of Navy Pier and the Chicago skyline can''t be beat.

  Not limited to a specific season, entertainment at Chicago Shakespeare Theater delights year-round. Catch cutting edge performances and classics at this highly-regarded cultural institution, where their tradition of excellence has been recognized with the Regional Theater Tony Award, three Laurence Olivier Awards, and 70 total Joseph Jefferson Awards', category:'landmark, entertainment', latitude: 41.89139, longitude: -87.5997)
city.tourist_attractions.create!(name:'Milennium Park- the "Bean"', description:' The Cloud Gate Sculpture, also known as the "bean," is one of the highlights of Millennium Park. Designed by the artists Anish Kapoor, the Chicago the Bean sculpture is made of 168 highly polished stainless steel plates - giving the appearance of liquid mercury. Up close, the highly reflective nature of the sculpture captures the beautiful skyline of Chicago. The Cloud Gate Sculpture has thus become a tourist hot spot and is the perfect place to take your vacation snapshots.', category:'landmark', latitude: 41.8827, longitude: -87.6233)
city.tourist_attractions.create!(name:'SkyDeck-Willis tower', description:'SkyDeck Chicago is the Observatory Deck of the world-famous Willis Tower (formerly the Sears Tower). Perched 1,353 feet up in the air on the 103rd floor of the tower, SkyDeck Chicago provides some of the best views of the city, from Navy Pier to Soldier Field. You’ll also find interactive exhibits and historical photographs to learn about the building’s prestigious history. It’s a must-see Chicago attraction and a perennial favorite with visitors from around the globe.', category:'landmark, skyline', latitude: 41.8789, longitude: -87.6358)
city.tourist_attractions.create!(name:'360 Chicago', description:'Formerly known as the John Hancock Observatory, 360 Chicago offers dining, sights and an interactive tour far above the city streets. From 1,000 feet up on the 94th floor, you can see up to 55 miles out and four states—you''ll feel as if you''re along for the ride as you watch airplanes whiz by. A recent addition is the Tilt attraction, which allows visitors to step onto an enclosed platform that extends from the building at a 30 degree angle.', category:'landmark, skyline', latitude: 41.898947, longitude: -87.622916)
city.tourist_attractions.create!(name:'Field museum of natural history', description:'The Field Museum of Natural History, located in Chicago, Illinois, USA, is one of the largest natural history museums in the world. The museum maintains its status as a premier natural history museum through the size and quality of its educational and scientific programs, as well as due to its extensive scientific specimen and artifact collections.The diverse, high quality permanent exhibitions, which attract up to 2 million visitors annually, range from the earliest fossils to past and current cultures from around the world to interactive programming demonstrating today’s urgent conservation needs.', category:'museum', latitude: 41.866261, longitude: -87.6169805)
city.tourist_attractions.create!(name:'Museum of Science and Industry', description:'At the north end of Jackson Park is the Museum of Science and Industry, founded in 1933, and arguably the most impressive museum in Chicago. It is devoted to the application of natural laws in technological and industrial development. The museum is thought to be the first in the U.S. to incorporate the idea of "hands-on" exhibits. Visitors are encouraged to interact with hundreds of exhibits. The MSI features permanent and changing exhibits, as well as an OMNIMAX theater.', category:'museum', latitude: 41.7906, longitude: -87.5828)
city.tourist_attractions.create!(name:'Magnificient Mile', description:'Michigan Avenue is probably one of the most attractive boulevards in America. The city''s famous Magnificent Mile is a section of Michigan Avenue north of the Chicago River, with numerous galleries, boutiques and luxury shops. Some of the attractions along here include the John Hancock Center, the Wrigley Building, and the Tribune Tower. Michigan Avenue splits between North and South designations at Madison Street.', category:'shopping', latitude: 41.8954, longitude: -87.6243)
city.tourist_attractions.create!(name:'The Rookery building', description:'The Rookery Building was designed by architects Daniel Burnham and John Root in 1888, but the interior lobby and patio were remodelled by Frank Lloyd Wright in 1907. This 12 story building has a Roman Revival and Queen Anne style facade but it is the inside and courtyard that are the true gems. The Rookery, named for the large number of pigeons that frequented the building, is listed on the Register of National Historic Places.', category:'architecture', latitude: 41.8791, longitude: -87.6321)
city.tourist_attractions.create!(name:'Shedd aquarium', description:'The Rookery Building was designed by architects Daniel Burnham and John Root in 1888, but the interior lobby and patio were remodelled by Frank Lloyd Wright in 1907. This 12 story building has a Roman Revival and Queen Anne style facade but it is the inside and courtyard that are the true gems. The Rookery, named for the large number of pigeons that frequented the building, is listed on the Register of National Historic Places.', category:'museum', latitude: 41.8678, longitude: -87.6139)
city.tourist_attractions.create!(name:'Buckingham fountain', description:'Located in Grant Park, the Beaux Arts-style Buckingham Fountain was designed by architect Edward Bennett after the Latona Fountain at Versailles. The font is famous for its grand size and for the height of its spray, which can reach as high as 15 stories. The fountain’s four water-spouting sea horse statues are said to represent the four states that surround Lake Michigan, while the fountain’s pool symbolizes the lake itself. The fountain was donated to the city by Kate Sturges Buckingham, a patroness of the arts who inherited her family’s massive fortune at the age of 32. Known as “Chicago’s Grandest Spinster,” she bequeathed the Buckingham Fountain to Chicago as a memorial for her brother in 1927 and established a trust fund for the fountain’s continuous operation as well.', category:'architecture,landmark', latitude: 41.8758, longitude: -87.6189)
city.tourist_attractions.create!(name:'Chicago water tower', description:'Designed by architect William Boyington, the 47 meter (154 foot) tall turreted Chicago Water Tower once played a critical role in the city’s water system. In 1871, a fire that began in a barn owned by Patrick and Catherine O’Leary quickly spread and destroyed the city’s entire business district. One of the few surviving structures of the infamous Great Chicago Fire, the Chicago Water Tower is a symbol of the city’s resilience. Today, the beautiful limestone structure is home to the City Gallery, which exhibits works by local artists and photographers.', category:'architecture,landmark', latitude: 41.8971, longitude: -87.6578)

## NEW YORK
city = City.create!(name:'New York', state: 'NY', country: 'USA', description: 'Home to the Empire State Building, Times Square, Statue of Liberty and other iconic sites, it is also known as the ''city which never sleeps''. New York City is a fast-paced, globally influential center of art, culture, fashion and finance. The city’s 5 boroughs sit where the Hudson River meets the Atlantic Ocean, with the island borough of Manhattan at the “Big Apple''s" core.')
city.tourist_attractions.create!(name:'Statue of Liberty', description:'The Statue of Liberty was France''s gift to America. It was built in 1886 and remains a famous world symbol of freedom and one of the greatest American icons. It is the world''s largest statue and stands just less than 152 feet tall from the base to the torch, and weighs approximately 450,000 pounds. The statue offers a fine view of the New York Harbor and lower Manhattan. It is located on Liberty Island and a short boat ride is required to get to the statue. To see the statue from shore, Battery Park sits on the southern tip of Manhattan and affords great views of New York Harbor and the Statue of Liberty. From here visitors can catch the ferry to the statue and Ellis Island.', category:'landmark', latitude: 40.6892, longitude: -74.0444)
city.tourist_attractions.create!(name:'Empire State building', description:'Along with the Statue of Liberty, The Empire State Building is New York''s most famous landmark. The 381 m tall, 102-storey building was the tallest in the world until the 1 World Trade Center tower rose higher 41 years later. Topped with a mooring mast for airships, the Empire State Building immediately became a landmark and a symbol for NYC when it opened in 1931. There are actually two observatories atop the Empire State Building. The 86th Floor Observatory (1,050 feet) is reached by high speed, automatic elevators, and has both a glass-enclosed area, which is heated in winter and cooled in summer, and spacious outdoor promenades on all four sides of the Building. The 102nd Floor Observatory stands 1,250 feet above the bustling streets below. On clear days visitors can see for distances up to 80 miles, looking into the neighboring states of New Jersey, Pennsylvania, Connecticut and Massachusetts, as well as New York.', category:'landmark,skyline', latitude: 40.7484, longitude: -73.9857)
city.tourist_attractions.create!(name:'Broadway and Shubert Alley', description:'Taking in a Broadway show is one of the highlights of a visit to New York City. Considered the pinnacle of American theater, it has long been world renowned for its performances. This is the place to come to see the latest shows and the long running classics. Broadway usually refers simply to Broadway theater which encompasses a large number of theater venues in the theatre district and along the street of Broadway. For the most popular shows tickets should be purchased well in advance.Shubert Alley is a famous pedestrian only alley in the theater district, and home to two well known playhouses; the Shubert on 221 West 44th Street and the Booth at 22 West 45th Street. Historically, aspiring actors would frequent Shubert Alley looking for opportunities to perform in a play sponsored by theater baron, Sam S. Shubert. "A Chorus Line" played at The Shubert for a record 6,137 shows. The musical, "Oklahoma" debuted in 1941 at the St James playhouse just down the street. Other legendary places include Sardi''s restaurant where many famous actors met and the Music Box Theater, where Irving Berlin staged "The Music Box Revue" in 1921.', category:'entertainment', latitude: 40.7581392, longitude: -73.9869448)
city.tourist_attractions.create!(name:'The Metropolitan museum of art', description:'The Metropolitan Museum of Art, or "The Met" as it is commonly known, was founded in 1870.The permanent collection at the Met contains over 2 million works of art. Highlights of the collection include American decorative arts, arms and armor, costumes, Egyptian art, musical instruments, and photographs, along with much more. The Cloisters in northern Manhattan is a branch of the Metropolitan Museum of Art which focuses on the art and architecture of medieval Europe.',category:'museum', latitude: 40.7789, longitude: -73.9637)
city.tourist_attractions.create!(name:'Fifth avenue', description:'Fifth Avenue has long had a reputation as New York''s premier shopping area. Many top end designers have their flagship stores located along this famous avenue. Cartier, Tiffany, Bergdorf-Goodman, the famous Apple Store Fifth Avenue, and of course Saks Fifth Avenue, as well as many others line the posh avenue. Even none shoppers can enjoy a walk along Fifth Avenue.',category:'shopping', latitude: 40.751676, longitude: -73.982184)
city.tourist_attractions.create!(name:'Brooklyn bridge', description:'The Brooklyn Bridge, completed in 1883, was the world''s first bridge to be constructed of steel. It spans the East River from Manhattan. The bridge is an American landmark that has inspired generations of poets, songwriters and painters. Engineer John Roebling conceived of the bridge in 1855 and worked out every detail from its two granite towers to its four suspended steel cables. In June 1869 while determining the Brooklyn tower site, a ferry crushed Roebling''s foot. Three weeks later, before ground had been broken, Roebling died of tetanus. Roebling''s son, Washington, picked up the reins and executed his Father''s grand plans. In 1872, however, Washington developed caisson''s disease which robbed him of his seeing, walking and writing facilities. The bridge features two powerful stone towers which are connected at the top with Gothic-shaped arches. They carry four cables that cross the East River.',category:'landmark,architecture', latitude: 40.7057, longitude: -73.9964)
city.tourist_attractions.create!(name:'Times square', description:'Formerly Longacre Square, Times Square was named in 1904 after the New York Times tower. The newspaper first posted current headlines along its famous moving sign, the world''s first, in 1928. Long the heart of the Theater District, Times Square fell into decay during the Depression when many theaters shut down. The city cleaned up the area by inviting corporations such as Disney to move into the area. Today, Times Square has become a much safer place, day and night, with shopping, theaters and restaurants galore, not to mention its mammoth billboards.',category:'landmark,entertainment', latitude: 40.7577, longitude: -73.9857)
