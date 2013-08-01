ArrayList<String> followBack = new ArrayList();
ArrayList<String> noFollowBack = new ArrayList();
void setup() {
  //Set the size of the stage, and the background to black.
  size(550,550);
  background(0);
  smooth();
  
  //UPDATE THE CREDENTIALS WITH MY KEYS BEFORE RUNNING
  ConfigurationBuilder cb = new ConfigurationBuilder();
  cb.setOAuthConsumerKey("");
  cb.setOAuthConsumerSecret("");
  cb.setOAuthAccessToken("-");
  cb.setOAuthAccessTokenSecret("");
 
  TwitterFactory tf = new TwitterFactory(cb.build());
  Twitter twitter = tf.getInstance();
  
  long cursor = -1;
  try {
  String result = twitter.getScreenName();
  IDs ids;
  ids = twitter.getFollowersIDs(cursor);
  
  IDs followinglist;
  followinglist = twitter.getFriendsIDs(cursor);
  //println(following);

  String name;
  String screenName;
  long[] followers = ids.getIDs();
  long[] followings = followinglist.getIDs();
 
  ResponseList<User> follows = twitter.lookupUsers(followers);
  ResponseList<User> following = twitter.lookupUsers(followings);
  User u;
  
  //loop through the people that you follow and and see if theyre in the list of people that follow you
  // do something for each
  
  for (int z = 0; z < following.size() -1; z++){
    name = following.get(z).getScreenName();
    if (follows.contains(following.get(z))){ 
     followBack.add(name);
    }
    else{
     noFollowBack.add(name);
    }
  }
  
  //print results
  println("The following people follow you back: " + followBack + "\n\n");
  println("These turds dont follow you back: " + noFollowBack);
  }
  catch (TwitterException te) {
    println("Couldn't connect: " + te);
  }
}
