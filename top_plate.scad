projection(cut=true) difference() {
  linear_extrude(height=1, center=true, convextity=5)
    polygon(points=[[69.0, 126.0], [68.87167292060715, 127.95789288330077], [68.48888739433602, 129.8822856765378], [67.8581929876693, 131.74025148547634], [66.99038105676658, 133.5], [65.90030010436853, 135.13142143513082], [64.60660171779821, 136.6066017177982], [63.13142143513081, 137.90030010436854], [61.5, 138.99038105676658], [59.74025148547635, 139.8581929876693], [57.88228567653781, 140.48888739433602], [55.95789288330077, 140.87167292060715], [54.0, 141.0], [-54.0, 141.0], [-55.95789288330077, 140.87167292060715], [-57.88228567653781, 140.48888739433602], [-59.74025148547635, 139.8581929876693], [-61.5, 138.99038105676658], [-63.13142143513081, 137.90030010436854], [-64.60660171779821, 136.6066017177982], [-65.90030010436853, 135.13142143513082], [-66.99038105676658, 133.5], [-67.8581929876693, 131.74025148547634], [-68.48888739433602, 129.8822856765378], [-68.87167292060715, 127.95789288330077], [-69.0, 126.0], [-69.0, -126.0], [-68.87167292060715, -127.95789288330077], [-68.48888739433602, -129.8822856765378], [-67.8581929876693, -131.74025148547634], [-66.99038105676658, -133.5], [-65.90030010436853, -135.13142143513082], [-64.60660171779821, -136.6066017177982], [-63.13142143513081, -137.9003001043685], [-61.50000000000001, -138.99038105676658], [-59.74025148547636, -139.8581929876693], [-57.88228567653781, -140.48888739433602], [-55.95789288330077, -140.87167292060715], [-54.0, -141.0], [54.0, -141.0], [55.95789288330077, -140.87167292060715], [57.882285676537805, -140.48888739433602], [59.74025148547635, -139.8581929876693], [61.5, -138.99038105676658], [63.131421435130804, -137.90030010436854], [64.60660171779821, -136.6066017177982], [65.90030010436853, -135.13142143513082], [66.99038105676658, -133.5], [67.8581929876693, -131.74025148547636], [68.48888739433602, -129.8822856765378], [68.87167292060715, -127.95789288330077], [69.0, -126.0], [69.0, -90.0], [66.91158092447917, -89.86311778198096], [64.85889527835967, -89.4548132206251], [62.87706508215855, -88.78207252018058], [60.99999999999999, -87.85640646055101], [59.259817135860466, -86.69365344465976], [57.68629150101523, -85.31370849898477], [56.30634655534024, -83.74018286413953], [55.143593539448986, -82.0], [54.21792747981941, -80.12293491784143], [53.54518677937491, -78.14110472164033], [53.13688221801903, -76.08841907552082], [53.0, -74.0], [53.0, 74.0], [53.13688221801903, 76.08841907552082], [53.54518677937491, 78.14110472164033], [54.21792747981941, 80.12293491784143], [55.14359353944898, 82.0], [56.30634655534024, 83.74018286413954], [57.68629150101524, 85.31370849898477], [59.25981713586047, 86.69365344465976], [61.0, 87.85640646055101], [62.877065082158566, 88.78207252018059], [64.85889527835967, 89.4548132206251], [66.91158092447917, 89.86311778198096], [69.0, 90.0]], paths=[[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77]], convexity=4);
  translate([-32.5, 141.0])
    cube([25.0, 64.0, 2], center=true);
  translate([-32.5, -141.0])
    cube([25.0, 64.0, 2], center=true);
  translate([41.0, -37.0, 0])
    cylinder(h=10, r=1.6, center=true, $fn=16);
  translate([-0.5, -41.0, 0])
    cylinder(h=10, r=1.55, center=true, $fn=16);
  translate([-49.5, -41.0, 0])
    cylinder(h=10, r=1.55, center=true, $fn=16);
  translate([-0.5, -99.0, 0])
    cylinder(h=10, r=1.55, center=true, $fn=16);
  translate([-49.5, -99.0, 0])
    cylinder(h=10, r=1.55, center=true, $fn=16);
  translate([-14.5, 12.5, 0])
    cylinder(h=10, r=1.1, center=true, $fn=16);
  translate([-35.5, 12.5, 0])
    cylinder(h=10, r=1.1, center=true, $fn=16);
  translate([-14.5, 0.0, 0])
    cylinder(h=10, r=1.1, center=true, $fn=16);
  translate([-35.5, 0.0, 0])
    cylinder(h=10, r=1.1, center=true, $fn=16);
  translate([-25.0, 0.0, 0])
    cylinder(h=10, r=4.5, center=true, $fn=16);
}