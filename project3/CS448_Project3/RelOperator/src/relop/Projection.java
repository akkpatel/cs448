package relop;

/**
 * The projection operator extracts columns from a relation; unlike in
 * relational algebra, this operator does NOT eliminate duplicate tuples.
 */
public class Projection extends Iterator {

  private Iterator iter;
  private Integer[] inFlds;
/**
   * Constructs a projection, given the underlying iterator and field numbers.
   */
  public Projection(Iterator iter, Integer... fields) {
    this.iter = iter;
    this.inFlds = fields;
    this.schema=new Schema(fields.length);
    Schema sch = iter.schema;
   // schema= iter.schema;
    init(sch);
    //setVariables();
  }

  private void setVariables() {
 Schema temp = new Schema (inFlds.length);
 temp = iter.schema;
 init(temp);
}

  private void init(Schema sch) {
 for(int i=0;i<inFlds.length;i++){
  schema.initField(i,sch.fieldType(inFlds[i]),sch.fieldLength(inFlds[i]),sch.fieldName(inFlds[i]));
 }
}

/**
   * Gives a one-line explaination of the iterator, repeats the call on any
   * child iterators, and increases the indent depth along the way.
   */
  public void explain(int depth) {
    //throw new UnsupportedOperationException("Not implemented");
  }

  /**
   * Restarts the iterator, i.e. as if it were just constructed.
   */
  public void restart() {
    iter.restart();
  }

  /**
   * Returns true if the iterator is open; false otherwise.
   */
  public boolean isOpen() {
    return iter.isOpen();
  }

  /**
   * Closes the iterator, releasing any resources (i.e. pinned pages).
   */
  public void close() {
   iter.close();
  }

  /**
   * Returns true if there are more tuples, false otherwise.
   */
  public boolean hasNext() {
  // System.out.println("in has next");
    return iter.hasNext();
  }

  /**
   * Gets the next tuple in the iteration.
   * 
   * @throws IllegalStateException if no more tuples
   */
  public Tuple getNext() {
   Tuple temp = iter.getNext();
   Tuple ret = new Tuple(schema);
   int i =0;
   while(i< schema.getCount()){
    ret.setField(i,temp.getField(inFlds[i]));
    i++;
   }
   return ret; 
  }

} // public class Projection extends Iterator
