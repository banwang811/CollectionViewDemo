//
//  CricleLayout.m
//  CollectionViewDemo
//
//  Created by mac on 15/11/20.
//  Copyright © 2015年 banwang. All rights reserved.
//

#import "CricleLayout.h"

#define ITEM_SIZE 70

@interface CricleLayout()

@property (nonatomic, assign) CGPoint center;
@property (nonatomic, assign) CGPoint center2;

@property (nonatomic, assign) CGFloat radius;
@property (nonatomic, assign) NSInteger cellCount;

@end

@implementation CricleLayout

- (void)prepareLayout{
    [super prepareLayout];
    CGSize size = self.collectionView.frame.size;
    _cellCount = [[self collectionView] numberOfItemsInSection:0];
    _center = CGPointMake(size.width/2.0, size.height/4.0);
    _center2 = CGPointMake(size.width/2.0, size.height *3/4.0);
    _radius = MIN(size.width, size.height)/2.5;
}

- (CGSize)collectionViewContentSize{
    return self.collectionView.frame.size;
}


//每个cell的布局
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section ==0) {
        UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        attributes.size = CGSizeMake(ITEM_SIZE, ITEM_SIZE);
        attributes.center = CGPointMake(_center.x + _radius * cosf(2 * indexPath.item * M_PI / _cellCount),
                                        _center.y + _radius * sinf(2 * indexPath.item * M_PI / _cellCount));
        return attributes;
    }else{
        UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        attributes.size = CGSizeMake(ITEM_SIZE, ITEM_SIZE);
        attributes.center = CGPointMake(_center2.x + _radius * cosf(2 * indexPath.item * M_PI / _cellCount),
                                        _center2.y + _radius * sinf(2 * indexPath.item * M_PI / _cellCount));
        return attributes;
    }
}

//布局
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    //布局cell
    NSMutableArray* attributes = [NSMutableArray array];
    for (int j =0 ; j<2;j++) {
        for (NSInteger i=0 ; i < self.cellCount; i++) {
            NSIndexPath* indexPath = [NSIndexPath indexPathForItem:i inSection:j];
            [attributes addObject:[self layoutAttributesForItemAtIndexPath:indexPath]];
        }
    }
    NSIndexPath* index = [NSIndexPath indexPathForItem:0 inSection:0];
    //布局SectionFooter
    [attributes addObject:[self layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionFooter atIndexPath:index]];
    //布局SectionHeader
    [attributes addObject:[self layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader atIndexPath:index]];

    return attributes;
}

//SectionFooter和SectionHeader的布局
- (UICollectionViewLayoutAttributes *)layoutAttributesForSupplementaryViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath{
    if ([elementKind isEqualToString: UICollectionElementKindSectionFooter ]){
        UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:elementKind withIndexPath:indexPath];
        attributes.size = CGSizeMake(100, ITEM_SIZE);
        return attributes;
    }else{
        UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:elementKind withIndexPath:indexPath];
        attributes.size = CGSizeMake(300, ITEM_SIZE);
        return attributes;
    }
}

//- (UICollectionViewLayoutAttributes *)finalLayoutAttributesForDeletedItemAtIndexPath:(NSIndexPath *)itemIndexPath {
//    UICollectionViewLayoutAttributes* attributes = [self layoutAttributesForItemAtIndexPath:itemIndexPath];
//    attributes.alpha = 0.0;
//    attributes.center = CGPointMake(_center.x, _center.y);
//    attributes.transform3D = CATransform3DMakeScale(0.1, 0.1, 1.0);
//    return attributes;
//}

@end
