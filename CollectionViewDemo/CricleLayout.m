//
//  CricleLayout.m
//  CollectionViewDemo
//
//  Created by mac on 15/11/20.
//  Copyright © 2015年 banwang. All rights reserved.
//

#import "CricleLayout.h"

#define ITEM_SIZE 20

@interface CricleLayout()

@property (nonatomic, assign) CGPoint center;
@property (nonatomic, assign) CGPoint center2;

@property (nonatomic, assign) CGFloat radius;
@property (nonatomic, assign) CGFloat radius1;
@property (nonatomic, assign) CGFloat radius2;

@property (nonatomic, assign) NSInteger cellCount;
@property (nonatomic, assign) NSInteger cellCount1;
@property (nonatomic, assign) NSInteger cellCount2;
@property (nonatomic, strong) NSArray   *count;

@end

@implementation CricleLayout

- (void)prepareLayout{
    [super prepareLayout];
    CGSize size = self.collectionView.frame.size;
    _cellCount = [[self collectionView] numberOfItemsInSection:0];
    _cellCount1 = [[self collectionView] numberOfItemsInSection:1];
    _cellCount2 = [[self collectionView] numberOfItemsInSection:2];
    self.count = [NSArray arrayWithObjects:[NSNumber numberWithInteger:_cellCount],[NSNumber numberWithInteger:_cellCount1],[NSNumber numberWithInteger:_cellCount2], nil];
//    _center = CGPointMake(size.width/2.0, size.height/4.0);
//    _center2 = CGPointMake(size.width/2.0, size.height - ITEM_SIZE/2);
    _center2 = CGPointMake(size.width/2.0, size.height/2);
    
    _radius = MIN(size.width, size.height)/5;
    _radius1 = MIN(size.width, size.height)/3;
    _radius2 = MIN(size.width, size.height)/2;

}

- (CGSize)collectionViewContentSize{
    return self.collectionView.frame.size;
}


//每个cell的布局
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section ==0) {
        UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        attributes.size = CGSizeMake(ITEM_SIZE, ITEM_SIZE);
        attributes.center = CGPointMake(_center2.x + _radius * cosf( indexPath.item * M_PI / (_cellCount - 1) ),
                                        _center2.y - _radius * sinf( indexPath.item * M_PI /( _cellCount - 1)));
        attributes.transform=CGAffineTransformMakeRotation(indexPath.item * M_PI /( _cellCount -1 ) - M_PI/2);
        return attributes;
    }else if (indexPath.section ==1) {
        UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        attributes.size = CGSizeMake(ITEM_SIZE, ITEM_SIZE);
        attributes.center = CGPointMake(_center2.x + _radius1 * cosf(2 * indexPath.item * M_PI / _cellCount1),
                                        _center2.y + _radius1 * sinf(2 * indexPath.item * M_PI / _cellCount1));
        attributes.transform=CGAffineTransformMakeRotation(2 * indexPath.item * M_PI / _cellCount1 - M_PI/2);
//        attributes.transform=CGAffineTransformMakeRotation(M_PI/3);
        return attributes;
    }else{
        UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        attributes.size = CGSizeMake(ITEM_SIZE, ITEM_SIZE);
        attributes.center = CGPointMake(_center2.x + _radius2 * cosf(2 * indexPath.item * M_PI / _cellCount2),
                                        _center2.y + _radius2 * sinf(2 * indexPath.item * M_PI / _cellCount2));
        attributes.transform=CGAffineTransformMakeRotation(2 * indexPath.item * M_PI / _cellCount2 - M_PI/2);
        return attributes;
    }
}

//布局
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    //布局cell
    NSMutableArray* attributes = [NSMutableArray array];
    for (int j =0 ; j<3;j++) {
        for (NSInteger i=0 ; i < [self.count[j] integerValue]; i++) {
            NSIndexPath* indexPath = [NSIndexPath indexPathForItem:i inSection:j];
            [attributes addObject:[self layoutAttributesForItemAtIndexPath:indexPath]];
        }
    }
    return attributes;
}

//- (UICollectionViewLayoutAttributes *)finalLayoutAttributesForDeletedItemAtIndexPath:(NSIndexPath *)itemIndexPath {
//    UICollectionViewLayoutAttributes* attributes = [self layoutAttributesForItemAtIndexPath:itemIndexPath];
//    attributes.alpha = 0.0;
//    attributes.center = CGPointMake(_center.x, _center.y);
//    attributes.transform3D = CATransform3DMakeScale(0.1, 0.1, 1.0);
//    return attributes;
//}

@end
