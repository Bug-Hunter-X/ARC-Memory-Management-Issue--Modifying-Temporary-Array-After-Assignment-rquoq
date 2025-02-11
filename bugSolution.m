The solution is to avoid modifying the temporary array after assignment and instead directly manipulate the property:

```objectivec
@property (strong, nonatomic) NSMutableArray *myArray;

- (void)someMethod {
    self.myArray = [NSMutableArray arrayWithObjects:@"A", @"B", @"C", nil];
    [self.myArray addObject:@"D"]; // Correct Approach
}
```

By directly adding the object to `self.myArray`, we ensure consistent state and eliminate the risk of unexpected deallocation and data corruption.  Always directly modify the property to ensure reliable memory management.