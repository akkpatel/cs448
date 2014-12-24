package relop;


/**
 * The selection operator specifies which tuples to retain under a condition; in
 * Minibase, this condition is simply a set of independent predicates logically
 * connected by OR operators.
 */
public class Selection extends Iterator {
	
	Iterator iterate;
	Predicate[] predicate = null;
	public int i = 0;

  /**
   * Constructs a selection, given the underlying iterator and predicates.
   */
  public Selection(Iterator iter, Predicate... preds) {
    //throw new UnsupportedOperationException("Not implemented");
    iterate = iter;
    this.schema=iterate.schema;
    predicate = preds;
    iterate.restart();
	//System.out.println("selection - constructor.");
  }

/**
   * Gives a one-line explaination of the iterator, repeats the call on any
   * child iterators, and increases the indent depth along the way.
   */
  public void explain(int depth) {
    //throw new UnsupportedOperationException("Not implemented");
	System.out.println("selection - explain.");
  }

  /**
   * Restarts the iterator, i.e. as if it were just constructed.
   */
  public void restart() {
    //throw new UnsupportedOperationException("Not implemented");
	  System.out.println("selection - restart.");
	  iterate.restart();
  }

  /**
   * Returns true if the iterator is open; false otherwise.
   */
  public boolean isOpen() {
    //throw new UnsupportedOperationException("Not implemented");
	  //System.out.println("selection - isOpen.");
	 return iterate.isOpen();
  }

  /**
   * Closes the iterator, releasing any resources (i.e. pinned pages).
   */
  public void close() {
    //throw new UnsupportedOperationException("Not implemented");
		//System.out.println("selection - close.");
	  iterate.close();
  }

  /**
   * Returns true if there are more tuples, false otherwise.
   */
  public boolean hasNext() {
    //throw new UnsupportedOperationException("Not implemented");
		//System.out.println("selection - hasNext.");
	  return iterate.hasNext();
  }

  /**
   * Gets the next tuple in the iteration.
   * 
   * @throws IllegalStateException if no more tuples
   */
  public Tuple getNext() {
   // throw new UnsupportedOperationException("Not implemented");
		//System.out.println("selection - getNext.");
	  Tuple tuple = null;
	  boolean check = false;
	  int index = 0;
	  while(iterate.hasNext()){
		  tuple = iterate.getNext();
		  for(index = 0; index < predicate.length; index++){
			  //System.out.println("Predicates: " + predicate[index]);
			  check = predicate[index].evaluate(tuple);
			  if(check){
				  continue;
			  }else{
				  break;
			  }
		  }
		  if(check){
			 return tuple;
		  }
	  }
	//System.out.println("The last driver id, 10, does not match the condition but if we return null here, \nit gives a null pointer exception in iterator at line 69.");
	return tuple;
  }

} // public class Selection extends Iterator
