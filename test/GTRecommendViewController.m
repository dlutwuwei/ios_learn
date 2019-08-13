//
//  GTRecommendViewController.m
//  test
//
//  Created by wuwei on 2019/8/9.
//  Copyright © 2019 wuwei. All rights reserved.
//

#import "GTRecommendViewController.h"

@interface GTRecommendViewController ()<UIScrollViewDelegate, UIGestureRecognizerDelegate>

@end

@implementation GTRecommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.backgroundColor = [UIColor whiteColor];
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width*5, self.view.frame.size.height);
    scrollView.pagingEnabled = YES;
    scrollView.delegate = self;
    
    for (int i=0; i < 5; i++) {
        [scrollView addSubview:({
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, scrollView.bounds.size.width, scrollView.bounds.size.height)];
            [view addSubview:({
                UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
                view.backgroundColor = [UIColor yellowColor];
                UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewClick)];
                tapGesture.delegate = self;
                [view addGestureRecognizer:tapGesture];
                view;
            })];
            view;
        })];
    }
    [self.view addSubview:scrollView];
}

- (void) viewClick{
    NSLog(@"view click");
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"did scroll - %@", @(scrollView.contentOffset.x));
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
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
