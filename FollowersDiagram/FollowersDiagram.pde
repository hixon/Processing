//Build an ArrayList to hold all of the words that we get from the imported tweets
ArrayList<Long> followers = new ArrayList();
 
void setup() {
  //Set the size of the stage, and the background to black.
  size(550,550);
  background(0);
  smooth();
  
  //UPDATE THE CREDENTIALS WITH MY KEYS BEFORE RUNNING
  //Credentials
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

  String name;
  //println(ids.getIDs());
  long[] followers = ids.getIDs();
  
  //println(followers.length);
  //println(twitter.lookupUsers(followers));
  ResponseList<User> test = twitter.lookupUsers(followers);
  Object[] test2 = test.toArray();
  //println(test.size());
  //println(test2);
  for(int x = 0; x < test.size() - 1; x++){
     println("user: " + test.get(x) + "\n"); 
  }
  }
  catch (TwitterException te) {
    println("Couldn't connect: " + te);
  }
}
