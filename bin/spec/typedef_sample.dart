
typedef int Compare(int a, int b);

class SortedCollection {
  Compare compare;
  
  SortedCollection(this.compare);
}

int sort(int a, int b) => a - b;

main() {
  SortedCollection collection = new SortedCollection(sort);
  assert(collection.compare is Function);
  assert(collection.compare is Compare);
}