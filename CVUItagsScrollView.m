//
//  CVUItagsScrollView.m
//  clubv
//
//  Created by kency on 16/9/28.
//  Copyright © 2016年 iBALLET Inc. All rights reserved.
//

#import "CVUItagsScrollView.h"
@implementation CVTag
@synthesize tagName,tagID,tagType;
-(instancetype)init{
	self=[super init];
	if (!self)
		return nil;
		tagType=0;
		tagID=0;
		tagName=@"";
	return self;
}

@end

@implementation CVUItagsScrollView{
	CGFloat _tagMargin;
	__block NSMutableArray<NSLayoutConstraint*>*consWidths;
}
@synthesize tagTitlesArray=_tagTitlesArray,tagsDelegate=_tagsDelegate,tagsArray=_tagsArray;
-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
	   TTGTextTagConfig*tagConfig=[TTGTextTagConfig new];
    tagConfig.tagTextColor=[UIColor lightGrayColor];
    tagConfig.tagBackgroundColor=[UIColor whiteColor];
    tagConfig.tagBorderColor=[UIColor lightGrayColor];
	   tagConfig.tagBorderWidth=.5f;
    tagConfig.tagTextFont=[UIFont systemFontOfSize:12.0f];
	   tagConfig.tagExtraSpace=CGSizeMake(14, 8);
	   tagConfig.tagShadowOffset=CGSizeZero;
	   tagConfig.tagShadowRadius=0;
	   tagConfig.tagShadowColor=[UIColor clearColor];
    self.defaultConfig=tagConfig;
	   self.verticalSpacing=8;
	   self.horizontalSpacing=8;
	   self.showsHorizontalScrollIndicator=NO;
	   self.delegate=self;
    }
    return self;
}
-(void)setTagsArray:(NSArray<CVTag *> *)tagsArray{
    if (tagsArray!=_tagsArray) {
	   _tagsArray=tagsArray;
	    [self removeAllTags];
	   
		  __block	NSMutableArray *__strArray=[[NSMutableArray alloc]initWithCapacity:_tagsArray.count];
		  [_tagsArray enumerateObjectsUsingBlock:^(CVTag * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
			 //				if (obj.tagType==CVTagTypePOI) {
			 //
			 //				}
				[__strArray addObject:obj.tagName];
		  }];
	   _tagTitlesArray=__strArray;
	   if (_tagTitlesArray.count>0) {
		 [self addTags:_tagTitlesArray];
	   }
    }
}
-(void)setTagTitlesArray:(NSArray<NSString *> *)tagTitlesArray{
    if (tagTitlesArray!=_tagTitlesArray) {
	   _tagTitlesArray=tagTitlesArray;
	   [self removeAllTags];
	   __block NSMutableArray *__tagsArray=[[NSMutableArray alloc]initWithCapacity:_tagTitlesArray.count];
	   [_tagTitlesArray enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
		  CVTag*tagObj=[[CVTag alloc]init];
		  tagObj.tagName=obj;
		  [__tagsArray addObject:tagObj];
	   }];
	   _tagsArray=__tagsArray;
	   if (_tagTitlesArray.count>0) {
		  dispatch_async(dispatch_get_main_queue(), ^{
	   [self addTags:_tagTitlesArray];
			 });
	   }
	   
    }
}
#pragma mark - TTGTextTagCollectionViewDelegate

- (void)textTagCollectionView:(TTGTextTagCollectionView *)textTagCollectionView didTapTag:(NSString *)tagText atIndex:(NSUInteger)index selected:(BOOL)selected{
    if(_tagsDelegate)
    [_tagsDelegate tagsScrollView:self didSelectTag:_tagsArray[index] atIndex:index selected:selected];
}
//-(void)textTagCollectionView:(TTGTextTagCollectionView *)textTagCollectionView updateContentSize:(CGSize)contentSize{
//}
@end

@implementation CVUItagsSingleLineView
-(instancetype)initWithFrame:(CGRect)frame{
	if (self=[super initWithFrame:frame]) {
	    self.defaultConfig.tagTextFont=[UIFont systemFontOfSize:12.0f];
		self.scrollDirection=TTGTagCollectionScrollDirectionHorizontal;
		self.verticalSpacing=0;
	    self.contentInset=UIEdgeInsetsZero;
	    self.scrollView.alwaysBounceVertical=NO;
	    self.showsVerticalScrollIndicator=NO;
	}
	return self;
}

@end
