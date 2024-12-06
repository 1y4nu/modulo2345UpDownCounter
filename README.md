
![alt text](https://github.com/1y4nu/modulo2345UpDownCounter/blob/main/images/fpga.jpg?raw=true)
-**Cyclone IV Altera DE2-115 Development and Education Board**

This counter has been written in VHDL with its primary function being able to count up and down in radix 8 from 0 to 2344 in radix 14. Its other features include:
- A load button that loads in a value in binary using 15 switches.
- An instantiated clock generator.
- A clear button that resets the counter back to 0.
- 4 seven segment displays to show counting.
- A switch that can change the radix view (8 or 14) on the seven segment displays.
- A warning signal that lights up and prevents a value greater than 2344 from being loaded in.
- Green LEDs that represent the lowest significant bit of the counting value being displayed on the 4 seven segment displays.
- An enable switch that can be used to start and stop counting.
