package relop;

/**
 * The simplest of all join algorithms: nested loops (see textbook, 3rd edition,
 * section 14.4.1, page 454).
 */
public class SimpleJoin extends Iterator {
	private Predicate[] newPred = null;
	private Iterator left;
	private Iterator right;
	private Schema leftSchema;
	private Schema rightSchema;
	private int flag = 0;
	private Tuple newTuple;
	private Tuple leftTuple=null;
	private Tuple rightTuple = null;

  /**
   * Constructs a join, given the left and right iterators and join predicates
   * (relative to the combined schema).
   */
  public SimpleJoin(Iterator left, Iterator right, Predicate... preds) {
	  this.left=left;
	  this.right=right;
	  this.newPred=preds;
	  this.leftSchema=left.schema;
	  this.rightSchema=right.schema;
	  this.schema=schema.join(leftSchema, rightSchema);
	  flag = 1;
	 leftTuple =left.getNext();
	  System.out.println("schema created in constructor");
  }

  /**
   * Gives a one-line explaination of the iterator, repeats the call on any
   * child iterators, and increases the indent depth along the way.
   */
  public void explain(int depth) {
   // throw new UnsupportedOperationException("Not implemented");
	  System.out.println("in the explain");
  }

  /**
   * Restarts the iterator, i.e. as if it were just constructed.
   */
  public void restart() {
    //throw new UnsupportedOperationException("Not implemented");
	  System.out.println("in the restart()");
	  left.restart();
	  right.restart();
  }

  /**
   * Returns true if the iterator is open; false otherwise.
   */
  public boolean isOpen() {
    //throw new UnsupportedOperationException("Not implemented");
	  System.out.println("check if in open");
	  if(left.isOpen()){
		  if(right.isOpen()){
			  return true;
		  }else{
			  return false;
		  }
	  }
	  return false;
  }

  /**
   * Closes the iterator, releasing any resources (i.e. pinned pages).
   */
  public void close() {
   // throw new UnsupportedOperationException("Not implemented");
	  System.out.println("in  the close");
	  left.close();
	  right.close();
	  flag=0;
  }

  /**
   * Returns true if there are more tuples, false otherwise.
   */
  public boolean hasNext() {
   // throw new UnsupportedOperationException("Not implemented");
//	  System.out.println("has Next");
	  return left.hasNext();
  }

  /**
   * Gets the next tuple in the iteration.
   * 
   * @throws IllegalStateException if no more tuples
   */
  public Tuple getNext() {
	  int antFlag = 1;
	  Tuple joinData = null;
	  boolean check = true;
    //throw new UnsupportedOperationException("Not implemented");
    System.out.println("getNext");
    while(left.hasNext()){
  //  	System.out.println("in while");
    	if(!right.hasNext()){
    		leftTuple = left.getNext();
   // 		System.out.println("!right left Tuple " + leftTuple);
    		right.restart();
    	}//else{
    		while(right.hasNext()){
    	//		System.out.println("in do while");
    			rightTuple = right.getNext();
    	//		System.out.println("left Tuple " + leftTuple);
    	//		System.out.println("right Tuple " + rightTuple);
    			joinData = Tuple.join(leftTuple, rightTuple, schema);
    			//System.out.
    			for(Predicate p: newPred){
    	//			System.out.println("in predicate");
    				check = p.evaluate(joinData);
    				if(check){
    	//				System.out.println("check = true");
    					//continue;
    				}else{
    					check = false;
    	//				System.out.println("check = false");
    					break;
    				}
    			}
    			if(check){
    				break;
    			}
    		}

    	//}
		if(check){
			return joinData;
		}
    	
    }
    return null;
  }

} // public class SimpleJoin extends Iterator