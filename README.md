# MIPS-Assembly-Game
Space Shooter game developed in assembly code.

To play, download MARS (http://courses.missouristate.edu/kenvollmar/mars/)

Instructions: 

![image](https://user-images.githubusercontent.com/85118557/218233952-297767e1-a5f0-4b43-99cd-9e91a3631c1f.png)

[The MARS Bitmap Display]

MARS allows us to map a framebuffer in memory to pixels on the screen using the Bitmap Display tool, which you launch by selecting it in the MARS menu: Tools → Bitmap Display. The Bitmap Display window is shown in Error! Reference source not found.

• Specify the actual on-screen width and height of each unit. The screenshot is configured to show each framebuffer unit as 8x8 block on your screen.

• You need to set the dimensions of the overall display: configur the bitmap display to have width and height of 256 pixels, and units of 8x8 pixels.

• You need to tell MARS the base address for the framebuffer in hexadecimal. For this game, this is memory location is 0x10008000, as in the screenshot. This means that the unit in the top-left corner is at address 0x10008000, the first unit in the second row is at address 0x10008080 and the unit in the bottom-right corner is at address 0x10008ffc

• Remember to click “Connect to MIPS” so that the tool connects to the simulated CPU.

• Also open Tools -> Keyboard and Display MMIO Simulator, to interact with game

• Finally, Run -> Assemble, and run the program. Now, the game will be displayed in the Bitmap Display window, and your input will be taken from the Keyboard and Display MMIO Simulator

Controls: 

• W A S D to move ship, P to restart game.
