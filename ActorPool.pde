class ActorPool {

  // fields
  HashMap< String , ArrayList<Actor> > pool = new HashMap();
  
  ActorPool addActor(Actor a) {
    try {
      // attempt to add element to arraylist located in hashmap using actors name as key
      pool.get(a.name).add(a);
      if (a.name == "pillar") return this;
      println("Actor " + a.name + " created successfully");
    }
    // if key is not found, error is caught and handled
    catch (Exception e) {
      ArrayList<Actor> actorList = new ArrayList();       // arraylist created
      pool.put(a.name, actorList);                      // arraylist added to hashmap under actors name
      actorList.add(a);                                   // actor added to arraylist
      println("ArrayList for " + a.name + "s created successfully");
      println("Actor " + a.name + " created successfully");
    }
    
    return this;
  }
  
  void update() {
  
    for (HashMap.Entry< String, ArrayList<Actor> > entry : pool.entrySet()) {
    
      ArrayList<Actor> actorSet = entry.getValue();
      
      for (int i = actorSet.size() - 1; i >= 0; i--){
      
        Actor a = actorSet.get(i);
        
        if (a.isDead) {
        
          actorSet.remove(i);
          continue;
        }
        
        a.update();
        
      }
    }
  }
  
  void draw() {
  
    for (HashMap.Entry< String, ArrayList<Actor> > entry : pool.entrySet()) {
    
      ArrayList<Actor> actorSet = entry.getValue();
      
      for (int i = actorSet.size() - 1; i >= 0; i--){
      
        actorSet.get(i).draw();
      }
    }
  }
}
