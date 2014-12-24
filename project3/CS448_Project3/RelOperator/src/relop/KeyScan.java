package relop;

import global.SearchKey;
import global.RID;
import index.HashScan;
import heap.HeapFile;
import index.HashIndex;

/**
 * Wrapper for hash scan, an index access method.
 */
public class KeyScan extends Iterator {
	//private Schema fSchema;
	private HashIndex hIndex;
	private SearchKey sKey;
	private HashScan hScan;
	private HeapFile hFile;
	private RID temp;
	/**
   * Constructs an key scan, given the hash index and schema.
   */
  public KeyScan(Schema schema, HashIndex index, SearchKey key, HeapFile file) {
	  this.schema = schema;
	  this.hIndex = index;
	  this.sKey = key;
	  this.hScan = index.openScan(key);
	  this.hFile = file;
  }

  /**
   * Gives a one-line explaination of the iterator, repeats the call on any
   * child iterators, and increases the indent depth along the way.
   */
  public void explain(int depth) {
    throw new UnsupportedOperationException("Not implemented");
  }

  /**
   * Restarts the iterator, i.e. as if it were just constructed.
   */
  public void restart() {
    close();
    hScan = hIndex.openScan(sKey);
  }

  /**
   * Returns true if the iterator is open; false otherwise.
   */
  public boolean isOpen() {
	if(hScan == null){
		return false;
	}
	else{
		return true;
	}
  }

  /**
   * Closes the iterator, releasing any resources (i.e. pinned pages).
   */
  public void close() {
    hScan.close();
    hScan = null;
  }

  /**
   * Returns true if there are more tuples, false otherwise.
   */
  public boolean hasNext() {
    return hScan.hasNext();
  }

  /**
   * Gets the next tuple in the iteration.
   * 
   * @throws IllegalStateException if no more tuples
   */
  public Tuple getNext() {
    temp = hScan.getNext();
    
    if(hScan != null){
    	byte[] record = hFile.selectRecord(temp);
    	return new Tuple(getSchema(),record);
    }
    else{
    	throw new IllegalStateException("Scan not found!");
    }
  }

} // public class KeyScan extends Iterator
