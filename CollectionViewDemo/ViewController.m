//
//  ViewController.m
//  CollectionViewDemo
//
//  Created by mac on 15/11/20.
//  Copyright © 2015年 banwang. All rights reserved.
//

#import "ViewController.h"
#import "BWHeadView.h"
#import "CricleLayout.h"

//UICollectionViewDelegateFlowLayout是UICollectionViewDelegate的子协议
@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView          *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.collectionView];
}

- (UICollectionView *)collectionView{
    if (_collectionView == nil) {
        CricleLayout *layout = [[CricleLayout alloc] init];
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        //注册cell
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"mycell"];
        //默认为NO,是否可以多选
        _collectionView.allowsMultipleSelection = YES;
        
    }
    return _collectionView;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 0) {
        return 3;
    }else if (section == 1){
        return 10;
    }
    return 16;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"mycell" forIndexPath:indexPath];
//    if (indexPath.row %2 == 0) {
//        cell.contentView.backgroundColor = [UIColor redColor];
//    }else{
//        cell.contentView.backgroundColor = [UIColor blueColor];
//    }
    cell.contentView.backgroundColor = [UIColor magentaColor];

    return cell;
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 3;
}


#pragma mark - UICollectionViewDelegate
//选中某个cell
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    [cell.contentView setBackgroundColor:[UIColor yellowColor]];
    NSLog(@"%@",indexPath);
}
//取消选择了某个cell
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    [cell setBackgroundColor:[UIColor yellowColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
