  library bc19_07.globals;
  
  import './druginfo.dart';

  int selectedDrug = -1;

  List<DrugSimple> allDrugs = [
    DrugSimple(
      index: 0,
  drugName: 'Advil',
  imageUrl: 'assets/advil.jpg',
  rating: 4.95,
  tags: ["fever", "pain", "headache", "stress", "cold", "cough"],
  reviews: [
          "Advil works great as a sleep aid for a chronic pain sufferer. If you are not in pain, don't use ibuprofen pm, but instead try just Benadryl.his stuff works great for falling asleep, but the drawback is being very tired when I wake up. Not everyone has this issue, but I do. Getting out of bed is extra hard, since after 8 hours ibuprofen stops working, so your pain comes back, and you might still be sleep. Use with caution and don't replace ibuprofen with this!",
          "This stuff is a life saver for me when for a month a year I switch over to night shift. I just take 2 along with Zhou Drift Off, and I get much better rest, not perfect but I am not waking up 3 hours later wondering where I am. Worth it!",
          "I had two pills, but I could not fall asleep at all!"
    ],
  desc: [
    "Whether you have a headache, muscle aches, backaches, menstrual pain, minor arthritis and other joint pain, or aches and pains from the common cold, nothing's stronger or longer lasting. The medicine in Advil is #1 doctor recommended for pain relief.",
    "Advil coated ibuprofen tablets temporarily relieve minor aches and pains due to: headache, toothache, backache, menstrual cramps, the common cold, muscular aches, and minor pain of arthritis. Advil coated ibuprofen tablets temporarily reduce fever as well.",
    "Millions have trusted Advil to safely and effectively relieve their aches and pains for over 30 years. Stops pain at the site of inflammation for relief where you need it. The medicine in Advil is what ER doctors use to treat their own aches and pains.",
    "When used as directed, Advil ibuprofen is a safe and effective pain reliever. In fact, when ER Doctors choose an over-the-counter pain reliever for their own aches and pains, the medicine in Advil is their #1 choice.(3)"
  ]
),

DrugSimple(
  index: 1,
  drugName: 'Bayer Aspirin',
  imageUrl: 'assets/bayer.png',
  rating: 4.76,
  tags: ["pain", "fever", "headache"],
  reviews: [
        "Good count for my aspirin needs, take it for heart problems...",
        "Take one daily at age 74, have since age 50",
        "what can I say, they're asprin"
    ],
  desc: [
      "Genuine Bayer Aspirin can provide pain relief from headaches, backaches, muscle pain, toothaches, menstrual pain and minor arthritis pain —and has for over 120 years.",
      "It’s also recommended, under a doctor's direction, to help reduce the risk of a recurrent heart attack or clot-related (ischemic stroke).",
      "Aspirin is not appropriate for everyone, so be sure to talk to your doctor before you begin an aspirin regimen.",
      "Taking Genuine Bayer Aspirin for pain relief does not interfere with the benefits of taking it on a doctor-directed aspirin regimen. Each 325 mg coated aspirin tablet: provides safe, proven pain relief when taken as directed; is caffeine-free and sodium-free; is coated to make it easier to swallow."
    ]
),

DrugSimple(
  index: 2,
  drugName: 'Chloraseptic',
  imageUrl: 'assets/chloraseptic.png',
  rating: 3.70,
  tags: ["pain", "fever", "cough"],
  reviews: [
        "I was having an ulcer in my mouth, those that lasts for a week or two and my doctor gave me a prescription of Apo-Benzydamine Oral Rinse 15% and I can tell you the medicine was worse than the ulcer itself. After few months I got another ulcer and again I needed this medication. I went to the pharmacy and I was told I needed another prescription. Unfortunately it takes me at least 3 hours to go and see the doctor just to get the same prescription she gave me before. I asked if there was something similar and there I found Chloraseptic Sore Throat Spray, Cherry, 6-Ounce (177 ml) (Pack of 3) I did not need prescription for this one and the result was way better than with my previous medication. It numbs your mouth, mainly where you spray and the pain goes away for a while. Very good for ulcers in the mouth.",
        "I searched for many days looking for the best value out there and couldn't find anything cheaper than at Amazon.com.. I bought the pack of 3. I absolutely love this product, it does calms your symptoms whenever you are getting the flu or when your throat hurts.",
        "Not bad product for temporary relief of a sore throat but viruses are just that and a generic is just as good."
    ],
  desc: [
      "Quickly relieve your sore throat pain and cough with a Wild Cherry, Multi Symptom Formula.",
      "Provides fast-acting relief of sore throat and mouth pain",
      "Muti-symptom formula with soothing liquid center - relieves pain, suppresses cough up to 4 hours and cools nasal passages"
    ]
),

DrugSimple(
  index: 3,
  drugName: 'Vicks 44 Cough Liquid',
  imageUrl: 'assets/vicks.jpg',
  rating: 2.00,
  tags: ["pain", "cough", "cold"],
  reviews: [
        "I didn't wake up through the night. The taste was okay and again, left a tingling sensation in my mouth. It started working quickly for me. My symptoms started coming back about 45 minutes before it was time to retake it. It worked great and did exactly as it said it would. The only thing I didn't like was the tingling sensation.",
        "Very strong taste but extremely effective",
        "elps the nasty cold and nighttime cough just which I did not get constipated after using it . Maybe just my issue but it does happen. The plus side is I get a restful night sleep and cold is better in awakening."
    ],
  desc: [
        "Cough – restless days and sleepless nights? Why take any cough syrup when you have trusted Formula 44 Cough Control from Vicks.",
        "Formulated with clinically proven dose of Dextromethorphan Hydrobromide in a special base, Vicks Formula 44 coats your throat better to provide long-lasting* and effective relief from dry cough. Now make a recovery from your dry cough."
    ]
),

DrugSimple(
  index: 4,
  drugName: 'Mucinex FastMax',
  imageUrl: 'assets/mucinex.jpg',
  rating: 1.59,
  tags: ["cold", "cough"],
  reviews: [
        "Super safe, all it does is thin mucus which is what I needed, because I was keeping my husband up snorting and trying to get that thick residual post nasal drainage up or down. With mucinex twice a day it is MUCH less of a problem to me. ",
        "Great cough syrup, loosens things up without a lot of coughing. Expensive, but worth every penny. I take this everyday by doctors order because of asthma. Drink plenty of water while taking this.",
        "It cleared up my throat4 most of the way, but it made my chest hurt, made my eyes water so much they burned and made me feel out of breath... I think I will stick to Sudafed."
    ],
  desc: [
        "Thins & Loosens Mucus",
        "Controls Cough",
        "Relieves Chest Congestion"
    ]
),
  ];