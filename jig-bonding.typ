
=== Glue Predictability
To ensure that the MPHX and lamina jigs are not fused together when they are used to adhere the lamina and MPHX plates, the dimensions and heights of the jigs must maintain a particular distance ensuring no interference and lack of contact. The main issue is that the surface at the front of the MPHX jig will often be covered in glue during the roller application. This front surface then adheres to the lamina and/or lamina jig during curing process resulting in an unintended and problematic bond. 

To evaluate the predictability and accuracy of the glue application from the roller an experiment will be set-up to mimic the glue applied by the roller. This will be done by sending the MPHX jigs with plates through the roller applicator resulting in glued plates allowing us to visually analyze which parts of the jig the adhesive is applied to. This will also allow us to spot map areas of coverage for any jig height adjustments allowing us to determine if the area covered in glue will result in the MPHX jig sticking to the lamina jig and/or lamina itself.

=== The test for glue distribution:
1. With the fully operational glue jig run an MPHX jig through the roller applicator
2. Once the adhesive is applied check for any spots with discoloring (adhesive) on the jig
3. If adhesive is on the jig, mark down the area, measure with digital calipers to determine the amount and location on the MPHX jig (making sure to record the location and severity on a drawing)
4. Iterate the MPHX jig CAD design given 5-10 test runs at a time; specifically focusing on reducing locations with known (unwanted) adhesive coverage

The iterations of designs being based on 5-10 test runs at a time allows us to see the most prominent areas of the jig that are wrongfully coated in glue. The iterative method maximizes effectiveness when modifying the MPHX jig's design effectively catching the areas of highest risk. This however may not catch all glue application errors and can be further tested with lamina and plate jig testing.

As an example of the first iteration; the current MPHX jig design can be seen below where the front (pictured as the left-most side) has a bar like stopper for stopping the MPHX plate from sliding through the jig. This bar stopper however is highly prone to adhesive coverage due to it's height and large surface area.

#figure(
  caption: [Original Plate Jig],
  [#image("images/Original_Plate_Jig.png", width: 90%)]) <orignaljig>
  
The proposed redesign to prevent the application on the stopping surface is to use smaller stoppers which line up with the loops of the MPHX plates. This design does not extrude as high as the jig in @orignaljig and should not be an issue due to its smaller surface area. The new design may be seen below:

#figure(
  caption: [Proposed Plate Jig],
  [#image("images/Proposed_Plate_Jig.png", width: 90%)]) <newjig>

This new and edited jig uses less material as well as serves the same purpose of stopping the MPHX plate from sliding through the jig, while also reducing the risk of the jigs gluing together by limiting the area of contact with the glue to an area contained within the lamina.
