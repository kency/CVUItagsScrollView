//
//  CVUItagsScrollView.h
//  clubv
//
//  Created by kency on 16/9/28.
//  Copyright © 2016年 iBALLET Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTGTextTagCollectionView.h"
typedef NS_ENUM(NSUInteger, CVTagType) {
	CVTagTypeString=0,
	CVTagTypePOI,
	
};
@interface CVTag:NSObject
@property (nonatomic,assign)CVTagType tagType;
@property(nonatomic,copy)NSString* tagID;
@property(nonatomic,copy)NSString* tagName;
@end



@class CVUItagsScrollView;
@protocol CVUItagsScrollViewDelegate <NSObject>
-(void)tagsScrollView:(CVUItagsScrollView*)tagsScrollView didSelectTag:(CVTag*)tagObj atIndex:(NSUInteger)index selected:(BOOL)selected;
@end
@interface CVUItagsScrollView : TTGTextTagCollectionView<TTGTextTagCollectionViewDelegate>
@property (nonatomic,strong)NSArray<CVTag*>*tagsArray;
@property (nonatomic,strong)NSArray<NSString*>*tagTitlesArray;
@property(nonatomic,weak)id <CVUItagsScrollViewDelegate>tagsDelegate;
@end

@interface CVUItagsSingleLineView : CVUItagsScrollView
@end
