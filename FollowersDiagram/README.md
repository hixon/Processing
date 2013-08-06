twitter followers diagram project:

Idea: what my point is for this project is to show a graphical representation of who you follow as compared to who follows you back. Since some people will only follow people who follow them back. This project is also to help me get up to speed on using the twitter4j api and more practice using Processing for graphical programming. 

Flow of the code:
	- gather the username of the person to display the graphic for
	- find the number of people they follow - User.getFollowersCount()
	- find the number of people they are following - User.getFriendsCount()
	- loop through and create a list of people they follow, continue until the size of the list matches the number of Users.getFollowersCount()
	- loop through and create a list of people that follow them, continue until the size of the list matches the number of Users.getFriendsCount()
	- Compare the two lists
	- if a person is in both lists then they follow that person back display them inside of the circle
	- if a person is in the followers list but not in the friends list display them outside of the circle
	- possibly show some information when the user hovers over each person?


Idea to look up any user given their screen name:
	- input name as String
	- use the UserResources.showUser(String) function which will return a User object
	- use the User.getID() function for that user to get the id to search everything else
	- long[] following = FriendsFollowersResources.getFollowersIDs(userID, cursor)
	- long[] follows = FriendsFollowersResources.getFriendsIDs(userID, cursor)
	- cross reference the two and display the results accordingly
	- also need a way to start the program from the beginning when theyre finished looking. 
