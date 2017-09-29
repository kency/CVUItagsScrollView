# CVUItagsScrollView
## Usage
```Objective-C
/*
//Copy and add https://github.com/zekunyan/TTGTagCollectionView  first in your project
//This is a singleLine ScrollView
*/
#import "CVUItagsScrollView.h"
CVUItagsSingleLineView* tagsView=[[CVUItagsSingleLineView alloc]initWithFrame:CGRectMake(0, 0, 200, 24)];  //height 24f is the best display default
tagsView.tagsDelegate=self;
[tagsView setTagTitlesArray:@[@"标签",@"TAG1",@"tagTitleString",@"tagTitleString",@"tagTitleString",@"tagTitleString",@"tagTitleString",@"tagTitleString"]];
//put the tagsView in any view/collectionCell  /tableViewCell/
//[self.view add subView:tagsView]

-(void)tagsScrollView:(CVUItagsScrollView *)tagsScrollView didSelectTag:(CVTag *)tagObj atIndex:(NSUInteger)index selected:(BOOL)selected{
    [tagsScrollView setTagAtIndex:index selected:!selected];
   NSLog(@"%@",tagObj.name);
}
```
