== Objective
To ensure that the MPHX and lamina jigs are not fused together when they are used to adhere the lamina and MPHX plates, the dimensions and heights of the jigs must maintain a particular distance ensuring no interference and lack of contact. The main issue is the potential for excess glue to be deposited on the MPHX jig rails which secure the modules in place during application. Excess glue along the rails, or anywhere else on the surface of the jig, could cause unintended bonding between the two halves, preventing them from being separated, damaging them, or fusing them with the lamina.

== Test Design
To evaluate the predictability and accuracy of the glue application from the roller an experiment will be set-up to mimic the glue applied by the roller. This will be done by sending the MPHX jigs with plates through the roller applicator allowing us to visually analyze which parts of the jig the adhesive would be applied to. This will also allow us to spot-map areas of coverage for any jig height adjustments allowing us to determine if the area covered in glue will result in the MPHX jig sticking to the lamina jig and/or lamina itself.

The full procedure is as follows: 
1. With the fully operational glue jig, run an MPHX jig through the roller applicator
2. Once the adhesive is applied check for any spots with discoloring (adhesive) on the jig
3. If adhesive is on the jig, mark down the area, measure with digital calipers to determine the amount and location on the MPHX jig (making sure to record the location and severity on a drawing)
4. Iterate on the MPHX jig CAD design given 5-10 test runs at a time; specifically focusing on reducing locations with known (unwanted) adhesive coverage

== Data Collection 
The iterations of designs being based on 5-10 test runs at a time allows us to see the most prominent areas of the jig that are wrongfully coated in glue. The iterative method maximizes effectiveness when modifying the MPHX jig's design effectively catching the areas of highest risk. This however may not catch all glue application errors and can be further tested with lamina and plate jig testing.

== Data Analysis
As an example of the first iteration; the current MPHX jig design can be seen below where the front (pictured as the left-most side) has a bar like stopper for stopping the MPHX plate from sliding through the jig. This bar stopper however is highly prone to adhesive coverage due to it's height and large surface area.

The proposed redesign to prevent the application on the stopping surface is to use smaller stoppers which line up with the loops of the MPHX plates. This design does not extrude as high as the jig in @orignaljig and should not be an issue due to its smaller surface area.

#import "@preview/oasis-align:0.3.3": *
#oasis-align(
  [
#figure(
  caption: [Original Plate Jig],
[#image("images/Original_Plate_Jig.png", width: 90%)]) <orignaljig>
  ],
  [
    
#figure(
  caption: [Proposed Plate Jig],
[#image("images/Proposed_Plate_Jig.png", width: 90%)]) <newjig>
  ]
)
  

This new and edited jig uses less material as well as serves the same purpose of stopping the MPHX plate from sliding through the jig, while also reducing the risk of the jigs gluing together by limiting the area of contact with the glue to an area contained within the lamina.

== Safety Considerations 
In order to do this test, the user must be in a laboratory environment wearing the proper PPE. Both the roller applicator and glued MPHX plates should be in the fume hood during the entirety of the test.

The test clean up will consist of using acetone to clean the surrounding area and either making a full MPHX module if the adhesive placement allows for it, or cleaning up the test MPHX plate using acetone so that another test can be run at a later time.

== Limitations
The limitations of the iterative tests are that since we are under a time and material constraint, the number of tests that we can go through will only solve major problems. Due to the iterative design, the assumption is that bigger problems will be solved however that also means that smaller underlying ones may be missed and or overlooked when a running a full production cycle.