this is for the seinfeld graph, currently a work in progress. will update with more information later

RECENTLY WORKED ON:
	- updated the code so that the character information displays in a text box at the top left of the UI, might change this later but for now it works fine. 
	- added the line for an episode need to do some testing on displaying more than one line and also add events to it so that when you hover over the line or click on the line the 
		episode information will display in another corner of the display. 
	- find out how to display the text whenever the right character is being hovered over, currently it will print to the console but only display to the UI the last character added

WORKING ON:
	- figuring out a good way to store the names, right now I have them in an array, maybe use an arrayList of arrays each item in the arrayList will be a show holding the info of all characters
	- best way to display the characeters on the line that represents the length of the episode, need it to be something more informative b/c the length of the episode will be something like 30+ minutes 
		and the character that has the most screen time might be something like 12 minutes which would kind of look weird on the graph since everything will overlap
	- best way to diplay the text data, maybe have it throw it into the middle of the circle?
	- need to find out how to draw lines around a circle based on the number of episodes aka Episodes.size() in a uniform way. Currently i'm just going to diplay everything in a stright line
		just to see if i can get everything working properly	

TODO:
	- look into good ways to store the data - currently going to store everything in an Episode ArrayList and break apart as necessary
	- how to display each episode as a line but around the center circle, need to do some trig for this - still need to figure out
	- how to display two characters who overlap in their time on the screen - still need to figure out
	- need to think of a good way to read in the data - thinking of using a .csv file with all the info 

FUTURE IDEAS:
	- think of a good color scheme for the graph
	- somehow displaying special episodes in different ways
	- somehow splitting the seasons up with a display indicator
	- adding more info to the file like a list of all the characters or something
