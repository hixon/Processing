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
  cb.setOAuthAccessToken("");
  cb.setOAuthAccessTokenSecret("");
 
  TwitterFactory tf = new TwitterFactory(cb.build());
  Twitter twitter = tf.getInstance();
  
  long cursor = -1;
  try {
  String result = twitter.getScreenName();
  IDs ids;
  ids = twitter.getFollowersIDs(cursor);
  int x = 0;
  while (ids.hasNext()){
    println(ids.getIDs());
  }
  }
  catch (TwitterException te) {
    println("Couldn't connect: " + te);
  }
}
