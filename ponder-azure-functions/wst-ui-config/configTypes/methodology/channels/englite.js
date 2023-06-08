module.exports = async () => 
    [
        {
            "header": "Indoor Coverage Score",
            "content" : [
                "The indoor coverage score is built to reflect the way the customer experiences coverage when being indoor. It is accurate and considers the customer's location and its immediate surroundings. Please note that it is still less accurate than a local engineering assessment, so please refer to your market for 100% certainty. The score ranges from 1-Very Weak to 5-Best correspond to the following experience:",
                "",
                "   - 5-Best: Excellent experience in indoor and outdoor conditions.",
                "   - 4-Very Strong: Very good experience. Excellent coverage outdoor and at strong coverage everywhere indoor.",
                "   - 3-Strong: Seamless network experience, typical of any cellular network. Good coverage outdoor and in most areas indoor.",
                "   - 2-Uneven: Good experience outdoor and partially indoor. Some areas may not be adequately covered indoor. Typical situation where enabling Voice over Wi-Fi would be recommended for a seamless experience. In dense urban areas with tall buildings, coverage scores can be very different between floors.",
                "   - 1-Very Weak: Weak outdoor experience, partial indoor coverage is possible but poor experience overall.",
                ""
            ]
        },
        {
            "header": "5G",
            "content" : [
                "",
                "   - Yes: 5G is available in the area.",
                "   - Partial: 5G is available in the area however it may not be available in some or any areas inside this location.",
                "   - No: 5G may be available in the area however a serving site was not detected.",
                ""
            ] 
        },
        {
            "header": "5G Plus mmWave",
            "content": [
                "",
                "   - Yes: mmWave is available in the area.",
                "   - Hotspot: mmWave available in the area, likely requiring a Hotspot to connect.",
                "   - No: mmWave may be available in the area however no mmWave was detected.",
                ""
            ]
        },
        {
            "header": "5G Plus C-Band",
            "content": [
                "",
                "   - Indoor: C-Band is available indoors.",
                "   - Outdoor Only: C-Band available in the area however signal strength likely unable to penetrate indoors.",
                "   - No: C-Band may be available in the area however no C-Band was detected.",
                ""
            ]
        },
        {
            "header": "FNET",
            "content": [
                "",
                "   - Yes: FNET is available in the area.",
                "   - Partial: FNET is available in the area however some roaming was detected, and it may not be available in some or any areas inside this location.",
                "   - No: FNET may be available in the area however heavy roaming was detected and this location will likely not have FNET available.",
                ""
            ]
        },
        {
            "header": "Band 14",
            "content": [
                "",
                "   - Yes: Band 14 is available in the area.",
                "   - Partial: Band 14 is available in the area however it may not be available in some or any areas inside this location.",
                "   - No: Band 14 may be available in the area however a serving site was not detected.",
                ""
            ]
        },
        {
            "header": "Mobile Speed Experience",
            "content": [
                "",
                "   - High Speed: Very fast downloads available (top 20% in the network). Outstanding experience.",
                "   - Medium Speed: Consistently fast download available. Seamless experience with video and downloads.",
                "   - Low Speed: Download speed may dip during busiest time of the day. Video quality may be degraded at that time.",
                ""
            ]
        }
    ];
