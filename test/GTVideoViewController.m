//
//  GTVideoViewController.m
//  test
//
//  Created by wuwei on 2019/8/8.
//  Copyright © 2019 wuwei. All rights reserved.
//

#import "GTVideoViewController.h"

@interface GTVideoViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation GTVideoViewController

- (instancetype)init
{
    self = [super init];
    if (self) {

    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.minimumLineSpacing = 10;
    layout.minimumInteritemSpacing = 10;
    layout.itemSize =CGSizeMake(self.view.frame.size.width/2 - 5 , 300);
    
    UICollectionView * view = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];

    view.dataSource = self;
    view.delegate = self;
    view.backgroundColor = [UIColor redColor];
    [view registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionView"];

    [self.view addSubview:view];
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionView" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.item % 3 == 0) {
        return CGSizeMake(self.view.frame.size.width, 200);
    } else {
        return CGSizeMake(self.view.frame.size.width/2 - 5, 300);
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
