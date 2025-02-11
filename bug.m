In Objective-C, a common yet subtle error arises when dealing with memory management using ARC (Automatic Reference Counting).  Consider this scenario:

```objectivec
@property (strong, nonatomic) NSMutableArray *myArray;

- (void)someMethod {
    NSMutableArray *tempArray = [NSMutableArray arrayWithObjects:@"A", @"B", @"C", nil];
    self.myArray = tempArray;
    [tempArray addObject:@"D"]; // Error Prone
}
```

The issue lies in modifying `tempArray` after assigning it to `self.myArray`.  While `self.myArray` now holds a strong reference to the array, `tempArray` is still pointing to the same object in memory.  When `someMethod` completes, `tempArray` is deallocated, potentially leading to unexpected behavior or crashes if other parts of your code still hold a reference to it through `self.myArray` after the modification, assuming there was an intention to modify `self.myArray`. This causes inconsistent state and potential data corruption.